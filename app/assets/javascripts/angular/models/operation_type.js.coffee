angular
.module 'resource.models'
.factory 'OperationType', ['ResourceBase', (ResourceBase) ->
  class OperationType extends ResourceBase
    @configure url: '/api/operation_types', name: 'operation_type'
]