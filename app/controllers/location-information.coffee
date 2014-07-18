BaseController = require 'zooniverse/controllers/base-controller'
Subject = require 'zooniverse/models/subject'

class LocationInformation extends BaseController
  className: 'location-information'
  template: require '../views/location-information'

  constructor: ->
    super
    Subject.on 'select', @onSubjectSelect

  onSubjectSelect: (e, @subject) =>
    @renderTemplate()

module.exports = LocationInformation
