require 'json2ify'
require 'es5-shimify'

require 'ghost-mouse'

$ = require 'jqueryify'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
User = require 'zooniverse/models/user'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
Page = require './controllers/page'
HomePage = require './controllers/home-page'
Classifier = require './controllers/classifier'
Profile = require 'zooniverse/controllers/profile'
browserDialog  = require 'zooniverse/controllers/browserDialog'
GoogleAnalytics = require 'zooniverse/lib/google-analytics'

stack = new Stack
  className: "main #{Stack::className}"
  el: '#app .main'

  controllers:
    home: HomePage
    science: class extends Page then content: $('''
      <p>Go into more detail about the science here.</p>
      <p>Include example images, etc.</p>
      <p>Depending on how much information we want, we can split this into multiple pages.</p>
    ''')
    classify: Classifier
    profile: class extends Page then className: "content #{Page::className}", content: new Profile
    team: class extends Page then content: $('''
      <p>Photo and description of each team member here.</p>
    ''')

  routes:
    '/': 'home'
    '/science': 'science'
    '/classify': 'classify'
    '/profile': 'profile'
    '/team': 'team'

  default: 'home'

Route.setup()

api = new Api project: 'leaf'

topBar = new TopBar

topBar.el.appendTo 'body'

User.fetch()

browserDialog.check()

# new GoogleAnalytics account: '1234567890'

module.exports = {stack, api, topBar}
