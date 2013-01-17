{Controller} = require 'spine'
MarkingSurface = require 'marking-surface'
AxesTool = require './tools/axes'
template = require 'views/classifier'

class Classifier extends Controller
  surface: null

  className: 'classifier'

  constructor: ->
    super

    @html template

    @surface ?= new MarkingSurface
      container: @el.find '.subject-container'
      width: 800
      height: 472

    @surface.tool = AxesTool

module.exports = Classifier
