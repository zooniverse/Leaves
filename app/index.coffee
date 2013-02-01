require 'json2ify'
require 'es5-shimify'

$ = require 'jqueryify'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
User = require 'zooniverse/models/user'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
Page = require 'controllers/page'
HomePage = require 'controllers/home-page'
Classifier = require 'controllers/classifier'
Profile = require 'controllers/profile'
browserDialog  = require 'zooniverse/controllers/browserDialog'

stack = new Stack
  className: "main #{Stack::className}"
  el: '#app .main'

  controllers:
    home: class extends Page then content: (new HomePage).el
    classify: class extends Page then content: new Classifier
    profile: class extends Page then content: new Profile

  routes:
    '/': 'home'
    '/classify': 'classify'
    '/profile': 'profile'

  default: 'home'

api = new Api
  project: 'planet_four'
  # host: "http://localhost:8000"
  # path: '/test/helpers/proxy'

Route.setup()

topBar = new TopBar

topBar.el.appendTo 'body'

User.fetch()

browserDialog.check()

module.exports = {stack, api, topBar}
