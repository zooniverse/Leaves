BaseController = require 'zooniverse/controllers/base-controller'
Classification = require 'zooniverse/models/classification'

REQUESTED_CLASSIFICATIONS = 5

class ClassificationSummary extends BaseController
  className: 'classification-summary'
  template: require '../views/classification-summary'

  askForSurvey: false

  constructor: ->
    super
    @askForSurvey = true if @seenThisSession() is REQUESTED_CLASSIFICATIONS

  # Because classification isn't sent until after the summary.
  seenThisSession: ->
    Classification.sentThisSession + 1

module.exports = ClassificationSummary