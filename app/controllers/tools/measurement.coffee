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

    @el.on 'change', 'input[name="scale"]', @onScaleInputChange

    @input = @el.find 'input[name="scale"]'

  onScaleInputChange: =>
    @tool.mark.set scale: @input.val()

class MeasurementTool extends LineTool
  @Controls: MeasurementControls

  onFirstRelease: ->
    @controls.input.focus()

module.exports = MeasurementTool
