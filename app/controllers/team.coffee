BaseController = require 'zooniverse/controllers/base-controller'

class Team extends BaseController
  className: 'team page'
  template: require '../views/team'

  snakerize: (displayName) ->
    displayName.replace(/\s/g, '-').toLowerCase()

  keyerize: (displayName) ->
    displayName.split(' ').pop().toLowerCase()

module.exports = Team
