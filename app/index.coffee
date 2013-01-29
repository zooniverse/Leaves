$ = require 'jqueryify'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
User = require 'zooniverse/models/user'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
Page = require 'controllers/page'
Classifier = require 'controllers/classifier'
Profile = require 'controllers/profile'

stack = new Stack
  className: "main #{Stack::className}"
  el: '#app .main'

  controllers:
    classify: class extends Page then content: (new Classifier).el
    profile: class extends Page then content: (new Profile).el

  routes:
    '/classify': 'classify'
    '/profile': 'profile'

  default: 'classify'


api = new Api
  project: 'planet_four'
  # host: "http://localhost:8000"
  # path: '/test/helpers/proxy'

Route.setup()

topBar = new TopBar

topBar.el.appendTo 'body'

User.fetch()

module.exports = {stack, api, topBar}
