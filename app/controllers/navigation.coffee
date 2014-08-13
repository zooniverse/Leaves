BaseController = require 'zooniverse/controllers/base-controller'

$html = $(document.querySelector('body').parentNode)

class Navigation extends BaseController
  className: 'navigation'
  template: require '../views/navigation'

  elements:
    'a': 'navLinks'

  events:
    'click #dark-mode-toggle': 'onClickDarkModeToggle'

  constructor: ->
    super
    window.addEventListener 'hashchange', @onHashChange, false
    setTimeout @onHashChange

  onHashChange: (e) =>
    @navLinks.removeClass 'active'
    @navLinks.filter (i) ->
      !window.location.hash.indexOf $(@).attr('href')
    .addClass 'active'

  onClickDarkModeToggle: (e) ->
    $html.toggleClass 'dark-mode'

module.exports = Navigation
