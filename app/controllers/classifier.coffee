{Controller} = require 'spine'
template = require 'views/classifier'
MarkingSurface = require 'marking-surface'
AxesTool = require './tools/axes'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'

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

    User.on 'change', ->
      console.log 'User changed'

module.exports = Classifier
