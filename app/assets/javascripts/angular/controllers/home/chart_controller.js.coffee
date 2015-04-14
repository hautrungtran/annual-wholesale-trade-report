class ChartController

  alpha: 15
  beta: 15
  chartOptions:
    options:
      chart:
        type: 'column'
        options3d:
          enabled: true
          alpha: 15
          beta: 15
          depth: 50
          viewDistance: 25
      tooltip:
        shared: true
        crosshairs: true
    title:
      text: ''
    size:
      height: 500
    series: []

  @$inject: ['$scope']
  constructor: (@scope) ->
    @chartOptions.func = (chart) =>
      @chart = chart
    elementSelector = (x) ->
      result = [x.year, x.value * 1]
    sortSelector = (x) ->
      x.year

    keySelector = (x) ->
      x.industryClassification.id

    valuesSelector = (x) ->
      x

    resultSelector = (key, group) ->
      x = group.FirstOrDefault()
      result =
        name: if x then x.industryClassification.name else key
        data: group.OrderBy(sortSelector).Select(elementSelector).ToArray()

    @scope.$root.$watch 'annualReports', () =>
      return unless @scope.$root.annualReports
      enumerable = Enumerable.From(@scope.$root.annualReports)
      groups = enumerable.GroupBy(keySelector, valuesSelector, resultSelector).Take(5).ToArray()
      @chartOptions.series = groups

  rerawChart: () ->
    console.log @alpha
    console.log @beta
    @chart.options.chart.options3d.alpha = @alpha
    @chart.options.chart.options3d.beta = @beta
    @chart.redraw(false)

angular
.module 'home.controllers'
.controller 'ChartController', ChartController
.requires.push 'highcharts-ng'