{Controller} = require 'spine'
template = require 'views/profile'
itemTemplate = require 'views/profile-item-template'
LoginForm = require 'zooniverse/controllers/login-form'
Paginator = require 'zooniverse/controllers/paginator'
Recent = require 'zooniverse/models/recent'
User = require 'zooniverse/models/user'
signupDialog = require 'zooniverse/controllers/signup-dialog'

class Profile extends Controller
  className: 'profile'
  recentsList: null

  events:
    'click button[name="sign-up"]': 'onClickSignUp'

  constructor: ->
    super

    @el.html template @

    @loginForm = new LoginForm
      template: null
      el: @el.find '.sign-in-form'

    @recentsList = new Paginator
      type: Recent
      itemTemplate: itemTemplate
      el: @el.find '.recents'

    User.on 'change', =>
      @onUserChange arguments...

  onUserChange: (e, user) ->
    @el.toggleClass 'signed-in', user?

  onClickSignUp: ->
    signupDialog.show()

module.exports = Profile
