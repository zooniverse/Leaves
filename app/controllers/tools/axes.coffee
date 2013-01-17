$ = require 'jqueryify'
{Mark, Tool} = require 'marking-surface'

doc = $(document)

class AxesMark extends Mark
  first: null
  second: null
  third: null
  fourth: null

  constructor: ->
    super

    @first = [-20, -20]
    @second = [-20, -20]
    @third = [-20, -20]
    @fourth = [-20, -20]

class AxesTool extends Tool
  @Mark: AxesMark

  c0: null
  c1: null
  c2: null
  c3: null
  cross: null

  moves: 0

  cursors:
    c0: 'move', c1: 'move', c2: 'move', c3: 'move'

  constructor: ->
    super

    @cross = @addShape 'path', 'M 0 0'

    for name in ['c0', 'c1', 'c2', 'c3']
      @[name] = @addShape 'circle', 0, 0, 5, fill: 'black'

  onInitialClick: (e) ->
    super
    {x, y} = @surface.mouseOffset e
    points = if @moves is 0 then ['first', 'second'] else ['third', 'fourth']
    @mark.set point, [x, y] for point in points
    @moves += 1

  onInitialDrag: (e) ->
    super
    {x, y} = @surface.mouseOffset e
    point = if @moves in [1, 2] then 'second' else 'fourth'
    @mark.set point, [x, y]
    @moves +=1 if @moves in [1, 3]

  isComplete: ->
    @moves is 4

  'on drag c0': (e) ->
    {x, y} = @surface.mouseOffset e
    @mark.set 'first', [x, y]

  'on drag c1': (e) ->
    {x, y} = @surface.mouseOffset e
    @mark.set 'second', [x, y]

  'on drag c2': (e) ->
    {x, y} = @surface.mouseOffset e
    @mark.set 'third', [x, y]

  'on drag c3': (e) ->
    {x, y} = @surface.mouseOffset e
    @mark.set 'fourth', [x, y]

  render: ->
    for point, i in ['first', 'second', 'third', 'fourth']
      continue unless @mark[point]?
      @["c#{i}"].attr cx: @mark[point][0], cy: @mark[point][1]

    @cross.attr path: [
      "M #{@mark.first[0]} #{@mark.first[1]}" if @mark.first[0]?
      "L #{@mark.second[0]} #{@mark.second[1]}" if @mark.second[0]?
      "M #{@mark.third[0]} #{@mark.third[1]}" if @mark.third[0]?
      "L #{@mark.fourth[0]} #{@mark.fourth[1]}" if @mark.fourth[0]?
    ].join ','

    @deleteButton.css left: (@mark.first[0] + @mark.second[0] + @mark.third[0] + @mark.fourth[0]) / 4
    @deleteButton.css top: (@mark.first[1] + @mark.second[1] + @mark.third[1] + @mark.fourth[1]) / 4

module.exports = AxesTool
