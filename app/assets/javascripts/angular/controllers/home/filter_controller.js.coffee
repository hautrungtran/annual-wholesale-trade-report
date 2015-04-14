class FilterController

  dataItems: []
  dataItem: null
  operationTypes: []
  operationType: null
  annualReports: []

  @$inject: ['$scope', 'DataItem', 'OperationType', 'AnnualReport']
  constructor: (@scope, @DataItem, @OperationType, @AnnualReport) ->
    @loadDataItems()
    @loadOperationTypes()

    @scope.$watch () =>
      @dataItem
    , (oldValue, newValue) =>
      @loadAnnualReports @dataItem, @operationType

    @scope.$watch () =>
      @operationType
    , (oldValue, newValue) =>
      @loadAnnualReports @dataItem, @operationType

  loadDataItems: () ->
    @DataItem.query().then (items) =>
      @dataItems = items
      @dataItem = items[0] if items && items.length > 0

  loadOperationTypes: () ->
    @OperationType.query().then (items) =>
      @operationTypes = items
      @operationType = items[0] if items && items.length > 0

  loadAnnualReports: (dataItem, operationType) ->
    return unless dataItem && operationType
    criteria = {}
    criteria.dataItemId = dataItem.id if dataItem
    criteria.operationTypeId = operationType.id if operationType
    @AnnualReport.search(criteria).then (items) =>
      @scope.$root.annualReports = items

angular
.module 'home.controllers', []
.controller 'FilterController', FilterController
.requires.push 'ui.select', 'ngSanitize'