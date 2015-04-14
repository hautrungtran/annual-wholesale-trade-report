angular
.module 'resource.models'
.factory 'AnnualReport', ['ResourceBase', (ResourceBase) ->
  class AnnualReport extends ResourceBase
    @configure url: '/api/annual_reports', name: 'annual_report'
    @search: (criteria) =>
      @$get @$url('search'),
        data_item_id: criteria.dataItemId
        operation_type_id: criteria.operationTypeId
]