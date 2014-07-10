{ Tool } = require 'marking-surface'
shapeStyle = require '../../lib/shape-style'

Raphael = window.Raphael
$ = window.jQuery

LABEL_WIDTH = 35
LABEL_HEIGHT = 12

NEW_SCALE = 970 / 800
MICONS_PER_PIXEL = (100 / 115) * NEW_SCALE

RENDER_FPS = 30

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

  renderTimeout = NaN

  markDefaults:
    p0: [-50, -50], p1: [-50, -50]
    p2: [-50, -50], p3: [-50, -50]

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
    @majorLabelBacker = @addShape 'rect', 0, 0, LABEL_WIDTH, LABEL_HEIGHT, 0, shapeStyle.backer
    @minorLabelBacker = @addShape 'rect', 0, 0, LABEL_WIDTH, LABEL_HEIGHT, 0, shapeStyle.backer
    @majorLengthLabel = @addShape 'text', shapeStyle.label
    @minorLengthLabel = @addShape 'text', shapeStyle.label

    @grabbers = for i in [0...4]
      @addShape 'circle', 0, 0, 8, shapeStyle.dot

  onFirstClick: (e) ->
    {x, y} = @mouseOffset e
    points = if @clicks is 0 then ['p0', 'p1'] else ['p2', 'p3']
    @mark.set point, [x, y] for point in points

  onFirstDrag: (e) ->
    {x, y} = @mouseOffset e
    points = if @clicks is 0 then ['p1'] else ['p3']
    @mark.set point, [x, y] for point in points

  isComplete: ->
    @clicks is 2

  'on drag grabbers': (e, shape) ->
    index = $.inArray shape, @grabbers
    {x, y} = @mouseOffset e
    @mark.set "p#{index}", [x, y]

  # TODO: Integrate this debouncing into the Marking Surface library.
  onMarkChange: ->
    return if @renderTimeout
    @renderTimeout = setTimeout (=> @render arguments...; @renderTimeout = NaN), 1000 / RENDER_FPS

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

    majorArcPoint = Raphael.getPointAtLength majorPath, (majorLength / 2) - 15
    minorArcPoint = Raphael.getPointAtLength minorPath, (minorLength / 2) + 15

    majorLengthLabelPoint = Raphael.getPointAtLength majorPath, majorLength * 0.8
    minorLengthLabelPoint = Raphael.getPointAtLength minorPath, minorLength * 0.8

    @majorLabelBacker.attr x: majorLengthLabelPoint.x - (LABEL_WIDTH / 2), y: majorLengthLabelPoint.y - (LABEL_HEIGHT / 2)
    @minorLabelBacker.attr x: minorLengthLabelPoint.x - (LABEL_WIDTH / 2), y: minorLengthLabelPoint.y - (LABEL_HEIGHT / 2)

    @majorLengthLabel.attr x: majorLengthLabelPoint.x, y: majorLengthLabelPoint.y, text: "#{Math.floor majorLength * MICONS_PER_PIXEL}µm"
    @minorLengthLabel.attr x: minorLengthLabelPoint.x, y: minorLengthLabelPoint.y, text: "#{Math.floor minorLength * MICONS_PER_PIXEL}µm"

    [intersect] = Raphael.pathIntersection majorPath, minorPath
    if intersect?
      angle = Math.abs Math.floor Raphael.angle @mark.p0..., @mark.p2..., intersect.x, intersect.y
      angle -= 180 if angle > 180
      angle = 90 - Math.abs angle - 90
      angle = "#{angle}°"
    else
      angle = ''

    # NOTE: Don't call the setter! It calls this render function.
    @mark.label = angle

    @controls.moveTo if intersect?
      [intersect.x, intersect.y]
    else if @mark.p2[0] isnt @markDefaults.p2[0]
      [
        (@mark.p0[0] + @mark.p1[0] + @mark.p2[0] + @mark.p3[0]) / 4
        (@mark.p0[1] + @mark.p1[1] + @mark.p2[1] + @mark.p3[1]) / 4
      ]
    else
      [
        (@mark.p0[0] + @mark.p1[0]) / 2
        (@mark.p0[1] + @mark.p1[1]) / 2
      ]

module.exports = AxesTool
