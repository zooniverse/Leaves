BaseController = require 'zooniverse/controllers/base-controller'
StackOfPages = require 'stack-of-pages'
$ = window.jQuery

class Home extends BaseController
  className: 'home page'
  template: require '../views/home-page'

  headerSlideDelay: 150
  animationDuration: 333

  constructor: ->
    super
    @banner = $('#site-banner')

    @el.on StackOfPages::activateEvent, @activate
    @el.on StackOfPages::deactivateEvent, @deactivate

  # Swiped from condors
  activate: =>
    setTimeout @showBanner, @headerSlideDelay

  deactivate: ({originalEvent: {detail: params}}) =>
    if params.initial
      # This is the on-load deactivation
      @hideBanner 0
    else
      setTimeout @hideBanner, @headerSlideDelay

  showBanner: (duration = @animationDuration) =>
    @banner.slideDown duration
    @banner.animate {
      opacity: 1
    }, {
      duration: duration
      queue: false
    }

  hideBanner: (duration = @animationDuration) =>
    @banner.slideUp duration
    @banner.animate {
      opacity: 0
    }, {
      duration: duration * 0.5
      queue: false
    }

module.exports = Home
