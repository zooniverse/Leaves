$ = require 'jqueryify'
Classifier = require 'controllers/classifier'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
User = require 'zooniverse/models/user'

# Set up the UI.
classifier = new Classifier
classifier.el.appendTo '.classify.page'

api = new Api
  project: 'test'
  host: "http://localhost:8000"
  path: '/test/helpers/proxy'

topBar = new TopBar
topBar.el.appendTo 'body'

User.fetch()

module.exports = {classifier, api, topBar}
