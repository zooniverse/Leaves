BaseController = require 'zooniverse/controllers/base-controller'

class Navigation extends BaseController
  className: 'navigation'
  template: require '../views/navigation'

module.exports = Navigation
