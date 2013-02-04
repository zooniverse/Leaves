{Tool} = require 'marking-surface'

class LineTool extends Tool
  line: null
  dots: null

  markDefaults:
    start: [0, 0]
    end: [0, 0]

  cursors:
    'dots': 'move'

  initialize: ->
    @line = @addShape 'path', 'M 0 0', stroke: 'red', 'stroke-width': 3
    @dots = for i in [0...2]
      @addShape 'circle', 0, 0, 8, fill: 'red', stroke: 'white', 'stroke-width': 2

  onFirstClick: (e) ->
    @['on drag dots'] e, @dots[0]
    @onFirstDrag e

  onFirstDrag: (e) ->
    @['on drag dots'] e, @dots[1]

  'on drag dots': (e, shape) ->
    {x, y} = @mouseOffset e
    point = if shape is @dots[0] then 'start' else 'end'
    @mark.set point, [x, y]

  render: ->
    @dots[0].attr cx: @mark.start[0], cy: @mark.start[1]
    @dots[1].attr cx: @mark.end[0], cy: @mark.end[1]

    @line.attr path: [
      "M #{@mark.start[0]} #{@mark.start[1]}"
      "L #{@mark.end[0]} #{@mark.end[1]}"
    ].join ','

    @controls.moveTo [
      (@mark.start[0] + @mark.end[0]) / 2
      (@mark.start[1] + @mark.end[1]) / 2
    ]

module.exports = LineTool
