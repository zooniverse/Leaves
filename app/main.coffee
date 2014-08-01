Api = require 'zooniverse/lib/api'
api = new Api project: 'leaf'

StackOfPages = require 'stack-of-pages'
stack = new StackOfPages
  '#/': require './controllers/home'
  '#/classify': require './controllers/classifier'
  '#/science/*': require './controllers/science'
  '#/team': require './controllers/team'
  '#/education/*': require './controllers/education'
  '#/profile': require './controllers/profile'

document.querySelector('#app').appendChild stack.el

Footer = require 'zooniverse/controllers/footer'
footer = new Footer
footer.el.appendTo '#footer .container'

Navigation = require './controllers/navigation'
navigation = new Navigation
navigation.el.prependTo document.body

TopBar = require 'zooniverse/controllers/top-bar'
topBar = new TopBar
topBar.el.appendTo navigation.el

User = require 'zooniverse/models/user'
User.fetch()

GoogleAnalytics = require 'zooniverse/lib/google-analytics'
# new GoogleAnalytics account: '1234567890'

window.app = { stack, api, topBar }
