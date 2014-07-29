BaseController = require 'zooniverse/controllers/base-controller'
Profile = require 'zooniverse/controllers/profile'
User = require 'zooniverse/models/user'
Vue = require 'vue'

$ = window.jQuery

class ProfilePage extends BaseController
  className: 'profile page'
  template: require '../views/profile'

  elements:
    '#zooniverse-profile': 'zooniverseProfile'

  constructor: ->
    super

    profileVue = new Vue
      el: @el.get(0)
      data:
        user: User.current

    @profile = new Profile
    @zooniverseProfile.append @profile.el

    User.on 'change', (e, user) ->
      profileVue.$data = user: User.current
      # dislike
      if user
        profileVue.$set 'user', $.extend {}, user
      else
        profileVue.$set 'user', false

module.exports = ProfilePage
