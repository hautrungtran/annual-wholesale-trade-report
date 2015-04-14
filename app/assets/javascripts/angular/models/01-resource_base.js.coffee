angular
.module 'resource.models', ['rails']
.factory 'ResourceBase', ['RailsResource', (RailsResource) ->
  class ResourceBase extends RailsResource
    @new: () ->
      @$get(@$url('new'))
]