{Controller} = require 'spine'
template = require 'views/classifier'
MarkingSurface = require 'marking-surface'
AxesTool = require './tools/axes'
LineTool = require './tools/line'
MeasurementTool = require './tools/measurement'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'

steps =
  scale:
    number: 1
    tool: MeasurementTool
    header: 'Measure the image scale'
    instruction: 'Look for a bar along the bottom of the image. Drag from its start to its end, then type the scale into the box.'
    next: 'stem'

  stem:
    number: 2
    tool: LineTool
    header: 'Measure the stem'
    instruction: 'Look for the stem and measure its width at the widest point.'
    next: 'lobules'

  lobules:
    number: 3
    tool: AxesTool
    header: 'Measure three lobules'
    instruction: 'Look for round bulges and measure across their widest and narrowest axes.'

class Classifier extends Controller
  surface: null

  currentStep: ''

  className: 'classifier'

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

    @surface.tool = MeasurementTool

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
    @el.attr 'data-step': @currentStep

    step = steps[@currentStep]
    @el.find('.step .number').html step.number
    @el.find('.step .text').html step.header
    @el.find('.step .instruction').html step.instruction
    @surface.tool = step.tool

  onClickNext: ->
    @loadStep steps[@currentStep].next

  onClickFinish: ->
    @classification.annotations.push @surface.marks...
    @classification.send()

  onNoMoreSubjects: =>
    @el.removeClass 'loading'

module.exports = Classifier
