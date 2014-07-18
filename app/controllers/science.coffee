BaseController = require 'zooniverse/controllers/base-controller'
StackOfPages = require 'stack-of-pages'

class Science extends BaseController
  className: 'science page'
  template: require '../views/science'

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

module.exports = Science
