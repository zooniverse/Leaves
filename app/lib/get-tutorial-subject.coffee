Subject = require 'zooniverse/models/subject'

module.exports = ->
  new Subject
    location: standard: './subjects/standard/514092d13ae74064ba00000e.jpg'

    coords: [0, 0]

    metadata:
      tutorial: true
      file_name: 'TUTORIAL_SUBJECT'

    workflow_ids: ['514092d13ae74064ba000002']
