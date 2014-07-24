BaseController = require 'zooniverse/controllers/base-controller'
Profile = require 'zooniverse/controllers/profile'
User = require 'zooniverse/models/user'
Vue = require 'vue'

class ProfilePage extends BaseController
  className: 'profile page'
  template: require '../views/profile'

  elements:
    '#zooniverse-profile': 'zooniverseProfile'

  constructor: ->
    super
    
    Vue.config({ debug: true })
    profileVue = new Vue
      el: @el.get(0)
      data: user: User.current

    @profile = new Profile
    @zooniverseProfile.append @profile.el

    User.on 'change', ->
      profileVue.$set 'user', User.current

module.exports = ProfilePage
