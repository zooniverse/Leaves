BaseController = require 'zooniverse/controllers/base-controller'
StackOfPages = require 'stack-of-pages'
Modal = require '../lib/modal'

class Education extends BaseController
  className: 'education page'
  template: require '../views/education'

  elements:
    '.sub-section-menu li a': 'menuLinks'
    'img': 'images'

  constructor: ->
    super

    educationStack = new StackOfPages
      '#/education': require('../views/education/overview')()
      '#/education/activities': require('../views/education/activities')()
      '#/education/plants-101': require('../views/education/plants')()
      '#/education/videos': require('../views/education/videos')()

    @el.find('#education-stack').append educationStack.el
    @el.on StackOfPages::activateEvent, @activate

    setTimeout =>
      @el.find('.block-images > img').on 'click', (e) ->
        new Modal src: e.currentTarget.src

  activate: ({ originalEvent: { detail }}) =>
    @menuLinks.removeClass 'active'
    @menuLinks.filter("[href=\"#{ detail.hash }\"]").addClass 'active'

module.exports = Education
