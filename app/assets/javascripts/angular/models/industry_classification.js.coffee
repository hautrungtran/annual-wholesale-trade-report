angular
.module 'resource.models'
.factory 'IndustryClassification', ['ResourceBase', (ResourceBase) ->
  class IndustryClassification extends ResourceBase
    @configure url: '/api/industry_classifications', name: 'industry_classification'
]