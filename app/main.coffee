{ Router } = require 'director'

Api = require 'zooniverse/lib/api'
api = new Api project: 'leaf'

window.app = app = {}
$app = $('#app')

homeController = new (require './controllers/home')
classifyController = new (require './controllers/classifier')
aboutController = new (require './controllers/about')
profileController = new (require './controllers/profile')

homeController.el.appendTo $app
classifyController.el.appendTo $app
aboutController.el.appendTo $app
profileController.el.appendTo $app

router = Router
  '/': homeController.show
  '/classify': classifyController.show
  '/about/:section': aboutController.show
  '/profile': profileController.show

router.init '/'

TopBar = require 'zooniverse/controllers/top-bar'
topBar = new TopBar
topBar.el.appendTo 'body'

Navigation = require './controllers/navigation'
navigation = new Navigation
navigation.el.prependTo document.body

User = require 'zooniverse/models/user'
User.fetch()

browserDialog  = require 'zooniverse/controllers/browserDialog'
browserDialog.check()

GoogleAnalytics = require 'zooniverse/lib/google-analytics'
# TODO: new GoogleAnalytics account: '1234567890'

window.app = { router, api, topBar }
