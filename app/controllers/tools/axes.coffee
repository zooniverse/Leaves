$ = require 'jqueryify'
{Tool} = require 'marking-surface'

class AxesTool extends Tool
  cross: null
  dots: null

  markDefaults:
    p0: [-20, -20], p1: [-20, -20]
    p2: [-20, -20], p3: [-20, -20]

  cursors:
    'dots': 'move'

  initialize: ->
    @cross = @addShape 'path', 'M 0 0', stroke: 'red', 'stroke-width': 3
    @dots = for i in [0...4]
      @addShape 'circle', 0, 0, 8, fill: 'red', stroke: 'white', 'stroke-width': 2

  onFirstClick: (e) ->
    {x, y} = @mouseOffset e
    points = if @clicks is 0 then ['p0', 'p1', 'p2', 'p3'] else ['p2', 'p3']
    @mark.set point, [x, y] for point in points

  onFirstDrag: (e) ->
    {x, y} = @mouseOffset e
    points = if @clicks is 0 then ['p1', 'p3'] else ['p3']
    @mark.set point, [x, y] for point in points

  isComplete: ->
    @clicks is 2

  'on drag dots': (e, shape) ->
    index = $.inArray shape, @dots
    {x, y} = @mouseOffset e
    @mark.set "p#{index}", [x, y]

  render: ->
    for point, i in ['p0', 'p1', 'p2', 'p3']
      @dots[i].attr cx: @mark[point][0], cy: @mark[point][1]

    @cross.attr path: [
      "M #{@mark.p0[0]} #{@mark.p0[1]}"
      "L #{@mark.p1[0]} #{@mark.p1[1]}"
      "M #{@mark.p2[0]} #{@mark.p2[1]}"
      "L #{@mark.p3[0]} #{@mark.p3[1]}"
    ].join ','

    @controls.moveTo [
      (@mark.p0[0] + @mark.p1[0] + @mark.p2[0] + @mark.p3[0]) / 4
      (@mark.p0[1] + @mark.p1[1] + @mark.p2[1] + @mark.p3[1]) / 4
    ]

module.exports = AxesTool
