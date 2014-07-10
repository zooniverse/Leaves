{ Tool } = require 'marking-surface'
shapeStyle = require '../../lib/shape-style'

Raphael = window.Raphael
$ = window.$

LABEL_WIDTH = 35
LABEL_HEIGHT = 12

NEW_SCALE = 970 / 800
MICONS_PER_PIXEL = (100 / 115) * NEW_SCALE

RENDER_FPS = 30

LARGE_CONSTANT = 5000

closestPointOnLine = (x, y, x1, y1, x2, y2) ->
  A = x - x1
  B = y - y1
  C = x2 - x1
  D = y2 - y1

  dot = A * C + B * D
  len_sq = C * C + D * D
  param = dot / len_sq

  if (param < 0 || (x1 == x2 && y1 == y2))
    xx = x1
    yy = y1
  else if param > 1
    xx = x2
    yy = y2
  else
    xx = x1 + param * C
    yy = y1 + param * D

  return [xx, yy]

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

  onFirstClick: (e) =>
    {x, y} = @mouseOffset e
    points = if @clicks is 0 then ['p0', 'p1'] else ['p2', 'p3']
    @mark.set point, [x, y] for point in points

  onFirstDrag: (e) =>
    {x, y} = @mouseOffset e
    points = if @clicks is 0 then ['p1'] else ['p3']

    [x, y] = @ensureAngle [x, y] if 'p3' in points
    @mark.set point, [x, y] for point in points

  isComplete: =>
    @clicks is 2

  ensureAngle: ([x, y], index = 3) =>
    switch index
      when 2
        otherPoint = @mark.p3
        minorPath = "M #{x} #{y}, L #{ otherPoint.split ' ' }"
      when 3
        otherPoint = @mark.p2
        minorPath = "M #{@mark.p2[0]} #{@mark.p2[1]}, L #{x} #{y}"

    majorPath = "M #{@mark.p0[0]} #{@mark.p0[1]}, L #{@mark.p1[0]} #{@mark.p1[1]}"
    minorPath ?= "M #{@mark.p2[0]} #{@mark.p2[1]}, L #{x} #{y}"

    [intersect] = Raphael.pathIntersection majorPath, minorPath
    return [x, y] unless intersect?

    angle = Math.floor Raphael.angle @mark.p0..., otherPoint..., intersect.x, intersect.y

    remainder = angle %% 10
    angle = if remainder < 5
      angle - remainder
    else
      angle + (10 - remainder)

    minorLength = Raphael.getTotalLength minorPath
    radian = Raphael.rad angle

    aX = otherPoint[0] + LARGE_CONSTANT * Math.sin radian
    aY = otherPoint[1] + LARGE_CONSTANT * Math.cos radian

    return closestPointOnLine x, y, otherPoint[0], otherPoint[1], aX, aY

  'on drag grabbers': (e, shape) =>
    index = $.inArray shape, @grabbers
    {x, y} = @mouseOffset e
    [x, y] = @ensureAngle [x, y], index if index in [2, 3]
    @mark.set "p#{index}", [x, y]

  onMarkChange: =>
    return if @renderTimeout
    @renderTimeout = setTimeout (=> @render arguments...; @renderTimeout = NaN), 1000 / RENDER_FPS

  render: =>
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
