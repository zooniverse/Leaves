BaseController = require 'zooniverse/controllers/base-controller'
StackOfPages = require 'stack-of-pages'

class About extends BaseController
  className: 'about page'
  template: require '../views/about'

  constructor: ->
    super
    @el.on StackOfPages::activateEvent, @activate

  activate: ({ originalEvent: { detail }}) =>
    @el.find('[data-section]').removeClass 'active'

    activeSection = unless @el.find("[data-section=\"#{ detail._ }\"]").length
      "summary"
    else
      detail._

    @el.find("[data-section=#{ activeSection }]").addClass 'active'

module.exports = About
