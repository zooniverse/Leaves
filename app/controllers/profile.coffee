{Controller} = require 'spine'
User = require 'zooniverse/models/user'
Recent = require 'zooniverse/models/recent'
Paginator = require 'zooniverse/controllers/paginator'

class Profile extends Controller
  className: 'profile'
  recentsList: null

  constructor: ->
    super
    @recentsList = new Paginator type: Recent
    @recentsList.el.appendTo @el

module.exports = Profile
