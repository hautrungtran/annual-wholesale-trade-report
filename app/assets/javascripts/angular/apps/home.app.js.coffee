app = angular.module 'home.app', ['resource.models', 'home.controllers', 'ui.router', 'templates']
#
# Config for ui router
#
app.config ['$urlRouterProvider', '$stateProvider'
  ($urlRouterProvider, $stateProvider) ->
    $urlRouterProvider.otherwise '/'
    data =
      annualReports: []
    $stateProvider
    .state
      name: 'home'
      url: '/'
      data: data
      views:
        filter:
          templateUrl: 'home/filter.html'
          controller: 'FilterController'
          controllerAs: 'filterCtrl'
        chart:
          templateUrl: 'home/chart.html'
          controller: 'ChartController'
          controllerAs: 'chartCtrl'
        grid:
          templateUrl: 'home/grid.html'
          controller: 'GridController'
          controllerAs: 'gridCtrl'
]
#
# Other config
#
app.config ['$httpProvider', ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
]
