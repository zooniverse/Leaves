MarkingSurface = require 'marking-surface'
{Tutorial} = require 'zootorial'
Vue = require 'vue'
translate = require 't7e'
Modal = require '../lib/modal'

BaseController = require 'zooniverse/controllers/base-controller'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'

selectTutorialSubject = require '../lib/select-tutorial-subject'
tutorialSteps = require '../lib/tutorial-steps'
{ loadImage } = require '../lib/utils'

AxesTool = require './tools/axes'
ClassificationSummary = require './classification-summary'

$ = window.jQuery
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
    '.examples img': 'exampleImages'

  events:
    'click .restart-tutorial': 'onClickRestartTutorial'
    'click .view-info': 'onClickViewInfo'
    'click .view-guide': 'onClickViewGuide'
    'click .favorite-subject': 'onClickFavorite'
    'click button[name="subject-action"]': 'onClickSubjectAction'

  constructor: ->
    super

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

    # meh
    @informationVM = new Vue
      el: @informationSection.get(0)
      template: require('../views/location-information')()
      data: subject: {}
      methods:
        formatCoords: ->
          return unless @hasCoords
          coords = (parseFloat(coord).toFixed(2) for coord in @subject.coords)
          "#{ coords[0] },#{ coords[1] }"
      computed:
        hasCoords: ->
          @subject.coords
          @subject?.coords?.length is 2 and !(@subject?.coords?[0] is 0)
        staticMapUrl: ->
          "http://maps.googleapis.com/maps/api/staticmap?center=#{ @formatCoords() }&zoom=7&size=640x200&markers=#{ @formatCoords() }"
        mapLink: ->
          "http://maps.google.com/?q=#{ @formatCoords() }"
        formattedCoords: ->
          if @hasCoords then @formatCoords() else "n/a"

    @exampleImages.on 'click', (e) ->
      new Modal src: e.currentTarget.src

    @el.on StackOfPages::activateEvent, @activate

  activate: =>
    # have to wait until home page animation is done
    setTimeout =>
      @tutorial.attach()
    , 500

  onUserChange: (e, user) =>
    if user?.project?.tutorial_done
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

    loadImage subject.location.standard, ({ src }) =>
      @loader.fadeOut { queue: false }
      @surface.image.attr { src: src }

      @subjectButton.removeClass 'disabled'

      @informationVM.$set 'subject', subject.toJSON()
      @surface.enable()

  onClickRestartTutorial: ->
    selectTutorialSubject()

  onClickViewGuide: ->
    $body.animate {
      scrollTop: @fieldGuideSection.position().top - 120
    }, 500, 'swing'

  onClickViewInfo: ->
    $body.animate {
      scrollTop: @informationSection.position().top - 120
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
        $currentTarget.text translate 'span', 'classifier.finished'
        @nextSubject()
      when 2
        $currentTarget.text translate 'span', 'classifier.nextImage'
        @finishSubject()

  onCreateMark: =>
    @el.trigger 'create-mark'

  finishSubject: ->
    @el.addClass 'showing-summary'

    classificationSummary = new ClassificationSummary
      classification: @classification
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
    @surface.marks[0].destroy() until @surface.marks.length is 0
    Subject.next()

  onNoMoreSubjects: ->
    alert 'All images have been classified!'

module.exports = Classifier
