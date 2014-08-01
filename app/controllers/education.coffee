BaseController = require 'zooniverse/controllers/base-controller'
StackOfPages = require 'stack-of-pages'

class Education extends BaseController
  className: 'education page'
  template: require '../views/education'

  elements:
    '.sub-section-menu li a': 'menuLinks'

  constructor: ->
    super

    educationStack = new StackOfPages
      '#/education': require('../views/education/overview')()
      '#/education/activities': require('../views/education/activities')()
      '#/education/plant-relationships': require('../views/education/plant-relationships')()
      '#/education/videos': require('../views/education/videos')()
      '#/education/resources': require('../views/education/resources')()

    @el.get(0).querySelector('#education-stack').appendChild educationStack.el
    @el.on StackOfPages::activateEvent, @activate

  activate: ({ originalEvent: { detail }}) =>
    @menuLinks.removeClass 'active'
    @menuLinks.filter("[href=\"#{ detail.hash }\"]").addClass 'active'

module.exports = Education
