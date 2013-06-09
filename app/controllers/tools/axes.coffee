$ = require 'jqueryify'
{Tool} = require 'marking-surface'
shapeStyle = require '../../lib/shape-style'
Raphael = window.Raphael

class AxesTool extends Tool
  major: null
  minor: null
  majorHalf: null
  minorHalf: null
  majorLabelBacker: null
  minorLabelBacker: null
  majorLengthLabel: null
  minorLengthLabel: null
  grabbers: null

  markDefaults:
    p0: [-20, -20], p1: [-20, -20]
    p2: [-20, -20], p3: [-20, -20]

  cursors:
    'grabbers': 'move'

  constructor: ->
    super
    window.axes = @

  initialize: ->
    @major = @addShape 'path', 'M 0 0', shapeStyle.line
    @minor = @addShape 'path', 'M 0 0', $.extend {}, shapeStyle.line, 'stroke-width': 2
    @majorHalf = @addShape 'circle', r: 5, stroke: 'white'
    @minorHalf = @addShape 'circle', r: 5, stroke: 'white'
    @majorLabelBacker = @addShape 'circle', shapeStyle.backer
    @minorLabelBacker = @addShape 'circle', shapeStyle.backer
    @majorLengthLabel = @addShape 'text', shapeStyle.label
    @minorLengthLabel = @addShape 'text', shapeStyle.label

    @grabbers = for i in [0...4]
      @addShape 'circle', 0, 0, 8, shapeStyle.dot

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

  'on drag grabbers': (e, shape) ->
    index = $.inArray shape, @grabbers
    {x, y} = @mouseOffset e
    @mark.set "p#{index}", [x, y]

  render: ->
    for point, i in ['p0', 'p1', 'p2', 'p3']
      @grabbers[i].attr cx: @mark[point][0], cy: @mark[point][1]

    majorPath = "M #{@mark.p0[0]} #{@mark.p0[1]}, L #{@mark.p1[0]} #{@mark.p1[1]}"
    minorPath = "M #{@mark.p2[0]} #{@mark.p2[1]}, L #{@mark.p3[0]} #{@mark.p3[1]}"
    majorLength = Raphael.getTotalLength majorPath
    minorLength = Raphael.getTotalLength minorPath
    majorHalfPoint = Raphael.getPointAtLength majorPath, majorLength / 2
    minorHalfPoint = Raphael.getPointAtLength minorPath, minorLength / 2

    @major.attr path: majorPath
    @minor.attr path: minorPath

    @majorHalf.attr cx: majorHalfPoint.x, cy: majorHalfPoint.y
    @minorHalf.attr cx: minorHalfPoint.x, cy: minorHalfPoint.y

    majorLengthLabelPoint = Raphael.getPointAtLength majorPath, majorLength * 0.8
    minorLengthLabelPoint = Raphael.getPointAtLength minorPath, minorLength * 0.8

    @majorLabelBacker.attr cx: majorLengthLabelPoint.x, cy: majorLengthLabelPoint.y
    @minorLabelBacker.attr cx: minorLengthLabelPoint.x, cy: minorLengthLabelPoint.y
    @majorLengthLabel.attr x: majorLengthLabelPoint.x, y: majorLengthLabelPoint.y, text: Math.floor majorLength
    @minorLengthLabel.attr x: minorLengthLabelPoint.x, y: minorLengthLabelPoint.y, text: Math.floor minorLength

    [intersect] = Raphael.pathIntersection majorPath, minorPath
    if intersect?
      angle = Math.abs Math.floor Raphael.angle @mark.p0..., @mark.p2..., intersect?.x, intersect?.y
      angle -= 180 if angle > 180
      angle = 90 - Math.abs angle - 90
      label = "#{angle}°"
    else
      label = ''

    # NOTE: Don't call the setter! It calls this render function.
    @mark.label = label

    @controls.moveTo [
      (@mark.p0[0] + @mark.p1[0] + @mark.p2[0] + @mark.p3[0]) / 4
      (@mark.p0[1] + @mark.p1[1] + @mark.p2[1] + @mark.p3[1]) / 4
    ]

module.exports = AxesTool
