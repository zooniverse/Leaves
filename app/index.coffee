$ = require 'jqueryify'
Classifier = require 'controllers/classifier'

# Set up the UI.
classifier = new Classifier
classifier.el.appendTo '.classify.page'

Api = require 'zooniverse/lib/api'

new Api
  project: 'test'
  host: "http://localhost:8000"
  path: '/test/helpers/proxy'

module.exports = {classifier}
