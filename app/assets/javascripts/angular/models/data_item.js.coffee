angular
.module 'resource.models'
.factory 'DataItem', ['ResourceBase', (ResourceBase) ->
  class DataItem extends ResourceBase
    @configure url: '/api/data_items', name: 'data_item'
]