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

stack = new Stack
  className: "main #{Stack::className}"
  el: '#app .main'

  controllers:
    home: HomePage
    science: SciencePage
    classify: Classifier
    profile: class extends Page then className: "content #{Page::className}", content: new Profile
    team: class extends Page then content: '''
      <h1>The team</h1>

      <h2>The Field Museum</h2>
      <ul>
        <li>Matt von Konrat</li>
        <li>Juan Larrain</li>
        <li>Beth Crownover</li>
        <li>Eve Gaus</li>
        <li>Jessica Hankey</li>
        <li>Kristina Lugo</li>
      </ul>

      <h2>Duke University</h2>
      <ul>
        <li>Blanka Shaw</li>
      </ul>

      <h2>Wilbur Wright College</h2>
      <ul>
        <li>Matt Greif</li>
      </ul>

      <h2>Roosevelt University</h2>
      <ul>
        <li>Mike Bryson</li>
      </ul>

      <h2>Northeastern Illinois University</h2>
      <ul>
        <li>Tom Campbell</li>
        <li>John Kasmer</li>
        <li>Oana Vadineanu</li>
      </ul>

      <h2>Zooniverse</h2>
      <ul>
        <li>Arfon Smith</li>
        <li>Michael Parrish</li>
        <li>Brian Carstensen</li>
        <li>David Miller</li>
        <li>Kelly Borden</li>
      </ul>
    '''

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
