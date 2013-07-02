require 'json2ify'
require 'es5-shimify'
require 'jqueryify'
require 'spine'

{Stack} = require 'spine/lib/manager'
Route = require 'spine/lib/route'

Page = require './controllers/page'
HomePage = require './controllers/home-page'
SciencePage = require './controllers/science-page'
Classifier = require './controllers/classifier'
Profile = require 'zooniverse/controllers/profile'
TeamPage = require './controllers/team-page'

stack = new Stack
  className: "main #{Stack::className}"
  el: '#app .main'

  controllers:
    home: HomePage
    science: SciencePage
    classify: Classifier
    profile: class extends Page then className: "content #{Page::className}", content: new Profile
    team: TeamPage

  routes:
    '/': 'home'
    '/science': 'science'
    '/classify': 'classify'
    '/profile': 'profile'
    '/team': 'team'

  default: 'home'

Route.setup()

Api = require 'zooniverse/lib/api'
api = new Api project: 'leaf'

TopBar = require 'zooniverse/controllers/top-bar'
topBar = new TopBar
topBar.el.appendTo 'body'

User = require 'zooniverse/models/user'
User.fetch()

browserDialog  = require 'zooniverse/controllers/browserDialog'
browserDialog.check()

GoogleAnalytics = require 'zooniverse/lib/google-analytics'
# TODO: new GoogleAnalytics account: '1234567890'

module.exports = {stack, api, topBar}
