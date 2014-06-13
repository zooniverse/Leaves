BaseController = require 'zooniverse/controllers/base-controller'

current = {} # sigh

class ApplicationController extends BaseController

  show: =>
    console.log @
    
    pageType = @className.split(' ').filter((klass) -> klass in ['page', 'sub-page'])[0]

    current[pageType] ?= @

    # $contentArea = $('body > .content-area')
    # $contentArea.toggleClass 'active', 'sub-page' is pageType

    current[pageType].el.removeClass 'active'
    @el.addClass 'active'
    current[pageType] = @

  navigate: (route) =>
    { router } = app
    router.setRoute route

module.exports = ApplicationController
