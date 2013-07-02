{Controller} = require 'spine'
template = require '../views/classifier'
MarkingSurface = require 'marking-surface'
AxesTool = require './tools/axes'
# LineTool = require './tools/line'
# MeasurementTool = require './tools/measurement'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'
{Tutorial} = require 'zootorial'
getTutorialSubject = require '../lib/get-tutorial-subject'
tutorialSteps = require '../lib/tutorial-steps'
$ = require 'jqueryify'

IMAGE_WIDTH = 720
IMAGE_HEIGHT = 536

class Classifier extends Controller
  surface: null
  tutorial: null

  className: 'classifier page'

  steps:
    # scale: tool: MeasurementTool, label: 'Scale', marks: 1
    # stem: tool: LineTool, label: 'Stem', marks: 1
    lobules: tool: AxesTool, label: 'Lobule', marks: Infinity
    summary: tool: null

  events:
    'click .controls button[name="load-next-step"]': 'onClickNextStep'
    'click .controls button[name="restart-tutorial"]': 'onClickRestartTutorial'
    'click .controls button[name="finish"]': 'onClickFinish'
    'click .controls button[name="next-subject"]': 'onClickNextSubject'

  constructor: ->
    super

    @html template
    @el.addClass 'loading'

    @surface ?= new MarkingSurface
      container: @el.find '.subject-container'
      width: IMAGE_WIDTH
      height: IMAGE_HEIGHT

    @surface.on 'create-mark', @onCreateMark

    User.on 'change', @onUserChange
    Subject.on 'get-next', @onGettingNextSubject
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects

    @tutorial = new Tutorial
      steps: tutorialSteps
      firstStep: 'welcome'
      parent: @el

    @loadStep 'lobules'

  onUserChange: (e, user) =>
    if user?.project.tutorial_done
      Subject.next()
    else
      @onClickRestartTutorial()

  onGettingNextSubject: =>
    @el.addClass 'loading'

  onSubjectSelect: (e, subject) =>
    @classification = new Classification {subject}
    @surface.marks[0].destroy() until @surface.marks.length is 0
    @surface.image.attr src: subject.location.standard
    @el.removeClass 'loading'
    @loadStep 'lobules'

  loadStep: (which) ->
    @currentStep = which

    stepEls = @el.find '.step'
    stepEls.removeClass 'active'
    stepEls.filter(".#{@currentStep}").addClass 'active'

    @surface.tool = @steps[@currentStep].tool

  onCreateMark: (e, mark, tool) =>
    @el.trigger 'create-mark', [mark]
    mark.set step: @currentStep
    currentMarks = (mark for {mark}, i in @surface.tools when mark.step is @currentStep) || []
    currentMarks.shift()?.destroy() until currentMarks.length <= @steps[@currentStep].marks

  onClickNextStep: (e) ->
    @loadStep $(e.currentTarget).val()

  onClickRestartTutorial: ->
    return if @tutorial.started?
    getTutorialSubject().select()
    @tutorial.start()

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
