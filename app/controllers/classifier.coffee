{Controller} = require 'spine'
template = require 'views/classifier'
MarkingSurface = require 'marking-surface'
AxesTool = require './tools/axes'
LineTool = require './tools/line'
MeasurementTool = require './tools/measurement'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'

class Classifier extends Controller
  surface: null

  className: 'classifier'

  steps:
    scale: tool: MeasurementTool, marks: 1
    stem: tool: LineTool, marks: 1
    lobules: tool: AxesTool, marks: 3

  events:
    'click button[name="next"]': 'onClickNext'
    'click button[name="finish"]': 'onClickFinish'

  constructor: ->
    super

    @html template
    @el.addClass 'loading'

    @surface ?= new MarkingSurface
      container: @el.find '.subject-container'
      width: 800
      height: 472

    @surface.on 'create-mark', @onCreateMark

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
    @surface.marks[0].destroy() until @surface.marks.length is 0
    @surface.image.attr src: subject.location.standard
    @el.removeClass 'loading'
    @loadStep 'scale'

  loadStep: (which) ->
    @currentStep = which

    stepEls = @el.find '.step'
    stepEls.removeClass 'active'
    stepEls.filter(".#{@currentStep}").addClass 'active'

    @surface.tool = @steps[@currentStep].tool

  onCreateMark: (e, mark, tool) =>
    mark.set step: @currentStep
    currentMarks = (mark for {mark}, i in @surface.tools when mark.step is @currentStep) || []
    currentMarks.shift()?.destroy() until currentMarks.length <= @steps[@currentStep].marks

  onClickNext: (e) ->
    @loadStep $(e.target).val()

  onClickFinish: ->
    @classification.annotations.push @surface.marks...
    @classification.send()

  onNoMoreSubjects: =>
    @el.removeClass 'loading'

module.exports = Classifier
