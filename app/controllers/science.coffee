BaseController = require 'zooniverse/controllers/base-controller'
StackOfPages = require 'stack-of-pages'
Modal = require '../lib/modal'

class Science extends BaseController
  className: 'science page'
  template: require '../views/science'

  elements:
    '.sub-section-menu li a': 'menuLinks'

  constructor: ->
    super

    scienceStack = new StackOfPages
      '#/science': require('../views/science/overview')()
      '#/science/about-bryophytes': require('../views/science/about-bryophytes')()
      '#/science/bryophyte-importance': require('../views/science/bryophyte-importance')()
      '#/science/origin': require('../views/science/origin')()
      '#/science/how-can-i-help': require('../views/science/how-can-i-help')()

    @el.find('#science-stack').append scienceStack.el
    @el.on StackOfPages::activateEvent, @activate

    setTimeout =>
      @el.find('.block-images img').on 'click', (e) ->
        new Modal src: e.currentTarget.src

  activate: ({ originalEvent: { detail }}) =>
    @menuLinks.removeClass 'active'
    @menuLinks.filter("[href=\"#{ detail.hash }\"]").addClass 'active'

module.exports = Science
