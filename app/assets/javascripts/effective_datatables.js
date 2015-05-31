//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.tableTools
//= require dataTables/extras/dataTables.colVis
//= require vendor/jquery.dataTables.columnFilter

//= require_tree ./effective_datatables

$.extend( $.fn.dataTable.defaults, {
  'dom': "<'row'<'col-xs-6'l><'col-xs-6'TfC>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
});

