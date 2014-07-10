BaseController = require 'zooniverse/controllers/base-controller'

class Navigation extends BaseController
  className: 'navigation'
  template: require '../views/navigation'

  elements:
    'a': 'navLinks'

  constructor: ->
    super
    window.addEventListener 'hashchange', @onHashChange, false
    setTimeout @onHashChange

  onHashChange: (e) =>
    @navLinks.removeClass 'active'
    @navLinks.filter (i) ->
      $(@).attr('href') is window.location.hash
    .addClass 'active'

module.exports = Navigation
