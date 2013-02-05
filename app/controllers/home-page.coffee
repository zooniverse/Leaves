{Controller} = require 'spine'
template = require '../views/home-page'

class HomePage extends Controller
  className: 'home'
  template: template

  constructor: ->
    super
    @el.html @template

module.exports = HomePage
