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

  elements:
    '.subject-container': 'subjectContainer'
    '.location-and-information': 'informationSection'
    '.field-guide': 'fieldGuideSection'
    '.favorite-subject i': 'favoriteIcon'

  events:
    'click .view-info': 'onClickViewInfo'
    'click .view-guide': 'onClickViewGuide'
    'click .favorite-subject': 'onClickFavorite'
    'click .finish-subject': 'onClickFinish'

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

    @tutorial = new Tutorial
      steps: tutorialSteps
      first: 'welcome'
      parent: @el.get(0)

  onUserChange: (e, user) =>
    if user?.project.tutorial_done
      Subject.next()
    else
      selectTutorialSubject()

  onGettingNextSubject: =>
    @el.addClass 'loading'

  onSubjectSelect: (e, subject) =>
    @el.toggleClass 'is-tutorial-subject', subject.metadata.tutorial?

    if subject.metadata.tutorial
      # @tutorial.start() unless @tutorial.started
    else
      @classification = new Classification {subject}

    @surface.disable()

    loadImage subject.location.standard, (@currentSubjectImage) =>
      @surface.image.attr { src: @currentSubjectImage.src }
      @surface.enable()
      @el.removeClass 'loading'

  onClickViewInfo: ->
    $body.animate {
      scrollTop: @informationSection.position().top - 110
    }, 500, 'easing'

  onClickViewGuide: ->
    $body.animate {
      scrollTop: @fieldGuideSection.position().top - 110
    }, 500, 'easing'

  onClickFavorite: ->
    if @classification?
      @classification.favorite = !@classification.favorite

      @favoriteIcon.toggleClass 'fa-heart', @classification.favorite
      @favoriteIcon.toggleClass 'fa-heart-o', !@classification.favorite

  onClickFinish: ->
    @classification.annotations.push @surface.marks...
    @classification.send()

  onClickNextSubject: ->
    Subject.next()

  onNoMoreSubjects: =>
    @el.removeClass 'loading'
    alert 'All images have been classified!'

  activate: ->
    super
    $(window).trigger 'resize'

module.exports = Classifier
