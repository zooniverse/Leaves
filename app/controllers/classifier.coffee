MarkingSurface = require 'marking-surface'
{Tutorial} = require 'zootorial'

User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'

selectTutorialSubject = require '../lib/select-tutorial-subject'
tutorialSteps = require '../lib/tutorial-steps'
{ loadImage } = require '../lib/utils'

ApplicationController = require './application-controller'
AxesTool = require './tools/axes'

$ = window.$

IMAGE_WIDTH = 720
IMAGE_HEIGHT = 536

class Classifier extends ApplicationController
  className: 'classifier page'
  template: require '../views/classifier'

  surface: null
  tutorial: null

  elements:
    '.subject-container': 'subjectContainer'

  events:
    'click button[name="load-next-step"]': 'onClickNextStep'
    'click button[name="restart-tutorial"]': 'onClickRestartTutorial'
    'click button[name="finish"]': 'onClickFinish'
    'click button[name="next-subject"]': 'onClickNextSubject'

  constructor: ->
    super

    @el.addClass 'loading'

    @surface ?= new MarkingSurface
      tool: AxesTool
      height: IMAGE_HEIGHT
      width: IMAGE_WIDTH

    @subjectContainer.prepend @surface.container

    @surface.on 'create-mark', @onCreateMark

    User.on 'change', @onUserChange
    Subject.on 'get-next', @onGettingNextSubject
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects

    # @tutorial = new Tutorial
    #   steps: tutorialSteps
    #   firstStep: 'welcome'
    #   parent: @el

  onUserChange: (e, user) =>
    if user?.project.tutorial_done
      Subject.next()
    else
      selectTutorialSubject()

  onGettingNextSubject: =>
    @el.addClass 'loading'

  onSubjectSelect: (e, subject) =>
    if subject.metadata.tutorial
      @tutorial.start() unless @tutorial.started
    else
      @classification = new Classification {subject}

    @surface.disable()

    loadImage subject.location.standard, (@currentSubjectImage) =>
      @surface.image.attr { src: @currentSubjectImage.src }
      @surface.enable()
      @el.removeClass 'loading'

  onClickFinish: ->
    @classification.annotations.push @surface.marks...
    @classification.send()
    @loadStep 'summary'
    @el.addClass 'summary'

  onClickNextSubject: ->
    @el.removeClass 'summary'
    Subject.next()

  onNoMoreSubjects: =>
    @el.removeClass 'loading'
    alert 'All images have been classified!'

  activate: ->
    super
    $(window).trigger 'resize'

module.exports = Classifier
