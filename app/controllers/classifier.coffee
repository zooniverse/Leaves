{Controller} = require 'spine'
template = require 'views/classifier'
MarkingSurface = require 'marking-surface'
AxesTool = require './tools/axes'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'

class Classifier extends Controller
  surface: null

  className: 'classifier'

  events:
    'click button[name="finish"]': 'onClickFinish'

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
    @classification = new Classification {subject}
    @classification.on 'send', -> Subject.next()
    @surface.image.attr src: subject.location.standard

  onNoMoreSubjects: =>
    console.log "No more subjects!"

  onClickFinish: ->
    @classification.send()

module.exports = Classifier
