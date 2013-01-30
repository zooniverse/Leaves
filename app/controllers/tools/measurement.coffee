$ = require 'jqueryify'
{Mark} = require 'marking-surface'
LineTool = require './line'

class MeasurementTool extends LineTool
  controls: null
  input: null

  initialize: ->
    super
    @controls = $('<div class="measurement-controls"><input placeholder="Scale" /></div>')
    @controls.css position: 'absolute'
    @controls.appendTo @surface.container
    @input = @controls.find 'input'
    @input.on 'keydown', @onInputChange

  onInputChange: =>
    @mark.set scale: parseFloat @input.val()

  render: ->
    super
    @controls.css
      'margin-left': (@mark.start[0] + @mark.end[0]) / 2
      'margin-top': (@mark.start[1] + @mark.end[1]) / 2

  select: ->
    super
    @controls.show()

  deselect: ->
    super
    @controls.hide()

  destroy: ->
    super
    @input.off()
    @controls.remove()

module.exports = MeasurementTool
