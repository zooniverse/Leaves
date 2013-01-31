{Controller} = require 'spine'
template = require 'views/profile'
itemTemplate = require 'views/profile-item-template'
LoginForm = require 'zooniverse/controllers/login-form'
signupDialog = require 'zooniverse/controllers/signup-dialog'
Paginator = require 'zooniverse/controllers/paginator'
Recent = require 'zooniverse/models/recent'
Favorite = require 'zooniverse/models/favorite'
User = require 'zooniverse/models/user'

class Profile extends Controller
  className: 'profile'
  recentsList: null

  events:
    'click button[name="sign-up"]': 'onClickSignUp'
    'click button[name="change-page"]': 'onClickChangePage'

  elements:
    'nav button[name="recents"]': 'recentsButton'
    'nav button[name="favorites"]': 'favoritesButton'
    '.page': 'pages'

  constructor: ->
    super

    @html template

    @loginForm = new LoginForm
      el: @el.find '.sign-in-form'

    @recentsList = new Paginator
      type: Recent
      itemTemplate: itemTemplate
      el: @el.find '.recents'

    @favoritesList = new Paginator
      type: Favorite
      itemTemplate: itemTemplate
      el: @el.find '.favorites'

    User.on 'change', =>
      @onUserChange arguments...

  onUserChange: (e, user) ->
    @el.toggleClass 'signed-in', user?

  onClickSignUp: ->
    signupDialog.show()

  onClickChangePage: (e) ->
    page = $(e.target).val()
    @pages.removeClass 'active'
    @pages.filter(".#{page}").addClass 'active'

module.exports = Profile
