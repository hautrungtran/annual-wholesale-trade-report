class GridController

  gridOptions:
    paginationPageSizes: [20, 30, 50]
    paginationPageSize: 30
    minRowsToShow: 31
    enableGridMenu: true
    columnDefs: [
      {name: 'dataItem.name', displayName: 'Data Item'}
      {name: 'industryClassification.name', displayName: 'Industry Classification'}
      {name: 'operationType.name', displayName: 'Operation Type'}
      {name: 'year', displayName: 'Year'}
      {name: 'value', displayName: 'Value'}
    ]
    data: []

  @$inject: ['$scope']
  constructor: (@scope) ->
    @scope.$root.$watch 'annualReports', () =>
      @gridOptions.data = @scope.$root.annualReports if @scope.$root.annualReports

angular
.module 'home.controllers'
.controller 'GridController', GridController
.requires.push 'ui.grid', 'ui.grid.pagination', 'ui.grid.resizeColumns', 'ui.grid.moveColumns'