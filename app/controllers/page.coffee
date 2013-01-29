{Controller} = require 'spine'

class Page extends Controller
  content: null

  className: "page"

  constructor: ->
    super
    @el.append @content

module.exports = Page
