ApplicationController = require './application-controller'

class Home extends ApplicationController
  className: 'home page content'
  template: require '../views/home-page'

module.exports = Home
