{Controller} = require 'spine'
$ = require 'jqueryify'

class Page extends Controller
  content: null

  className: "page"

  constructor: ->
    super

    if typeof @content is 'string' or @content instanceof $
      @el.append @content
      @el.addClass 'content'

    else if @content.el instanceof $
      @el.append @content.el

module.exports = Page
