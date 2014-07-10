BaseController = require 'zooniverse/controllers/base-controller'
Profile = require 'zooniverse/controllers/profile'

class ProfilePage extends BaseController
  className: 'profile page'

  constructor: ->
    super
    @profile = new Profile
    @el.append @profile.el

module.exports = ProfilePage
