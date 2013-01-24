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
    @el.addClass 'loading'

    @surface ?= new MarkingSurface
      container: @el.find '.subject-container'
      width: 800
      height: 472

    @surface.tool = AxesTool

    User.on 'change', @onUserChange
    Subject.on 'get-next', @onGettingNextSubject
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects

  onUserChange: (e, user) =>
    if user?.project.tutorial_done
      if @classification.subject.metadata.tutorial
        Subject.next()
    else
      Subject.next()

  onGettingNextSubject: =>
    @el.addClass 'loading'

  onSubjectSelect: (e, subject) =>
    @classification = new Classification {subject}
    @classification.on 'send', -> Subject.next()
    @surface.image.attr src: subject.location.standard
    @el.removeClass 'loading'

  onNoMoreSubjects: =>
    @el.removeClass 'loading'

  onClickFinish: ->
    @classification.send()

  loadNextSubject: ->
    next = Subject.next()
    next.always =>
      @el.removeCLass 'loading'


module.exports = Classifier
