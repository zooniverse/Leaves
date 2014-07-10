{ Router } = require 'director'

Api = require 'zooniverse/lib/api'
api = new Api project: 'leaf'

window.app = app = {}

StackOfPages = require 'stack-of-pages'
stack = new StackOfPages
  '#/': require './controllers/home'
  '#/classify': require './controllers/classifier'
  '#/about/*': require './controllers/about'
  '#/profile': require './controllers/profile'

document.querySelector('#app').appendChild stack.el

TopBar = require 'zooniverse/controllers/top-bar'
topBar = new TopBar
topBar.el.appendTo 'body'

Footer = require 'zooniverse/controllers/footer'
footer = new Footer
footer.el.appendTo '#footer .container'

Navigation = require './controllers/navigation'
navigation = new Navigation
navigation.el.prependTo document.body

User = require 'zooniverse/models/user'
User.fetch()

browserDialog  = require 'zooniverse/controllers/browserDialog'
browserDialog.check()

GoogleAnalytics = require 'zooniverse/lib/google-analytics'
# TODO: new GoogleAnalytics account: '1234567890'

window.app = { stack, api, topBar }
