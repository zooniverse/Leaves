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

    User.on 'change', @onUserChange
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects

  onUserChange: (e, user) =>
    if user?.project.tutorial_done
      if @classification.subject.metadata.tutorial
        console.log 'Discard current tutorial'
        Subject.next()
    else
      console.log 'Load tutorial'
      Subject.next()

  onSubjectSelect: (e, subject) =>
    console.log 'Selected subject', subject
    @surface.image.attr src: subject.location.standard

  onNoMoreSubjects: =>
    console.log "No more subjects!"

module.exports = Classifier
