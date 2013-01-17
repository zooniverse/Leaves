$ = require 'jqueryify'
Classifier = require 'controllers/classifier'

# Set up the UI.
classifier = new Classifier
classifier.el.appendTo '.classify.page'

module.exports = {classifier}
