require 'jquery-datatables-rails'
require 'kaminari'
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end

require "effective_datatables/engine"
require "effective_datatables/version"

module EffectiveDatatables
  mattr_accessor :authorization_method
  mattr_accessor :date_format
  mattr_accessor :datetime_format
  mattr_accessor :default_entries

  def self.setup
    yield self
  end

  def self.authorized?(controller, action, resource)
    if authorization_method.respond_to?(:call) || authorization_method.kind_of?(Symbol)
      raise Effective::AccessDenied.new() unless (controller || self).instance_exec(controller, action, resource, &authorization_method)
    end
    true
  end

  def self.datatables
    Rails.env.development? ? read_datatables : (@@datatables ||= read_datatables)
  end

  private

  def self.read_datatables
    Rails.application.eager_load! unless Rails.configuration.cache_classes
    Effective::Datatable.descendants.map { |klass| klass }.compact
  end

end
