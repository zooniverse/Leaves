MarkingSurface = require 'marking-surface'
{Tutorial} = require 'zootorial'

BaseController = require 'zooniverse/controllers/base-controller'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'

selectTutorialSubject = require '../lib/select-tutorial-subject'
tutorialSteps = require '../lib/tutorial-steps'
{ loadImage } = require '../lib/utils'

AxesTool = require './tools/axes'
ClassificationSummary = require './classification-summary'
LocationInformation = require './location-information'

$ = window.$
$window = $(window)
$body = $('body')

IMAGE_WIDTH = 720
IMAGE_HEIGHT = 536

class Classifier extends BaseController
  className: 'classifier page'
  template: require '../views/classifier'

  surface: null
  tutorial: null
  step: 1

  elements:
    '.marking-surface-container': 'markingContainer'
    '#location-and-information': 'informationSection'
    '.field-guide': 'fieldGuideSection'
    '.favorite-subject i': 'favoriteIcon'
    '.loader': 'loader'
    'button[name="subject-action"]': 'subjectButton'

  events:
    'click .view-info': 'onClickViewInfo'
    'click .view-guide': 'onClickViewGuide'
    'click .favorite-subject': 'onClickFavorite'
    'click button[name="subject-action"]': 'onClickSubjectAction'

  constructor: ->
    super

    @el.addClass 'loading'

    @surface ?= new MarkingSurface
      tool: AxesTool
      height: IMAGE_HEIGHT
      width: IMAGE_WIDTH

    @markingContainer.prepend @surface.container
    @loader.appendTo @markingContainer

    @surface.on 'create-mark', @onCreateMark

    User.on 'change', @onUserChange
    Subject.on 'get-next', @onGettingNextSubject
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects

    @tutorial = new Tutorial
      steps: tutorialSteps
      first: 'welcome'
      parent: @el.get(0)

    locationInformation = new LocationInformation
    locationInformation.el.appendTo @informationSection

  onUserChange: (e, user) =>
    if user?.project.tutorial_done
      Subject.next()
    else
      selectTutorialSubject()

  onGettingNextSubject: =>
    @loader.fadeIn { queue: false }

  onSubjectSelect: (e, subject) =>
    @el.toggleClass 'is-tutorial-subject', subject.tutorial?

    if subject.tutorial
      @tutorial.start() unless @tutorial.started
    else
      @classification = new Classification {subject}

    @surface.disable()

    loadImage subject.location.standard, (@currentSubjectImage) =>
      @loader.fadeOut { queue: false }
      @surface.image.attr { src: @currentSubjectImage.src }

      @subjectButton.removeClass 'disabled'

      @surface.enable()

  onClickViewInfo: ->
    $body.animate {
      scrollTop: @informationSection.position().top - 110
    }, 500, 'swing'

  onClickViewGuide: ->
    $body.animate {
      scrollTop: @fieldGuideSection.position().top - 110
    }, 500, 'swing'

  onClickFavorite: ->
    if @classification?
      @classification.favorite = !@classification.favorite

      @favoriteIcon.toggleClass 'fa-heart', @classification.favorite
      @favoriteIcon.toggleClass 'fa-heart-o', !@classification.favorite

  onClickSubjectAction: ({ currentTarget }) ->
    @step = if @step is 1 then 2 else 1
    $currentTarget = $(currentTarget)
    
    switch @step
      when 1
        $currentTarget.text 'Finished'
        @nextSubject()
      when 2
        $currentTarget.text 'Next Image'
        @finishSubject()

  finishSubject: ->
    @el.addClass 'showing-summary'

    classificationSummary = new ClassificationSummary
    classificationSummary.el.appendTo @markingContainer
    classificationSummary.el.fadeIn()

    Subject.on 'get-next', =>
      @el.removeClass 'showing-summary'
      classificationSummary.el.fadeOut 300, ->
        classificationSummary.destroy()

  nextSubject: ->
    if @classification?
      @classification.annotations.push @surface.marks...
      @classification.send()

    @subjectButton.addClass 'disabled'
    Subject.next()

  onNoMoreSubjects: ->
    alert 'All images have been classified!'

  activate: ->
    super
    $(window).trigger 'resize'

module.exports = Classifier
