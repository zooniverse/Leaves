$ = require 'jqueryify'
{ToolControls, Mark} = require 'marking-surface'
LineTool = require './line'

class MeasurementControls extends ToolControls
  input: null

  constructor: ->
    super

    @el.append '''
      <div class="more">
        <input name="scale" placeholder="Scale" />
      </div>
    '''

    @el.on 'keydown', 'input[name="scale"]', @onScaleInputChange

    @input = @el.find 'input[name="scale"]'

  onScaleInputChange: =>
    setTimeout =>
      value = @input.val()

      @tool.mark.set scale: value
      @el.trigger 'change-scale', [value]

      # Trigger this weird event so we know when to move on from the tutorial step.
      @el.trigger "change-scale-#{value.replace /\D/g, ''}", [value]

class MeasurementTool extends LineTool
  @Controls: MeasurementControls

  onFirstRelease: ->
    @controls.input.focus()

module.exports = MeasurementTool
