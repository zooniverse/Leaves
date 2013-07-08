Subject = require 'zooniverse/models/subject'

module.exports = ->
  new Subject
    id: '51dafc9f3ae7401701000730'
    zooniverse_id: 'ALF00001f4'

    location: standard: './images/tutorial-subject.jpg'

    coords: [0, 0]

    metadata:
      tutorial: true
      original_filename: 'tutorial-subject.jpg'
      original_dimensions: [800, 593]
      microns_per_px: 1.05

    workflow_ids: ['5154abce3ae740898b000002']
