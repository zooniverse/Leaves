BaseController = require 'zooniverse/controllers/base-controller'

class Team extends BaseController
  className: 'team page'
  template: require '../views/team'

module.exports = Team
