BaseController = require 'zooniverse/controllers/base-controller'
Classification = require 'zooniverse/models/classification'

class ClassificationSummary extends BaseController
  className: 'classification-summary'
  template: require '../views/classification-summary'

  classification: null
  askForSurvey: false
  requestedClassifications: 5

  elements:
    '#favorite': 'favoriteButton'
    '#favorite-icon': 'favoriteIcon'

  events:
    'click #favorite': 'onClickFavorite'

  constructor: (params) ->
    if @seenThisSession() is @requestedClassifications
      @askForSurvey = true

    super

    @setFavoriteButtonState()

  # Because classification isn't sent until after the summary.
  seenThisSession: ->
    Classification.sentThisSession + 1

  setFavoriteButtonState: ->
    if @classification?.favorite
      @favoriteIcon.removeClass('fa-heart-o').addClass('fa-heart')
    else
      @favoriteIcon.removeClass('fa-heart').addClass('fa-heart-o')

  onClickFavorite: ->
    @classification?.favorite = !@classification?.favorite
    @setFavoriteButtonState()

module.exports = ClassificationSummary
