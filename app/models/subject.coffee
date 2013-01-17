{Model} = require 'spine'

class Subject extends Model
  @configure 'Subject', 'location'

  @getTutorial: =>
    new @
      id: 'TUTORIAL_SUBJECT'
      location: standard: ['//placehold.it/800x472.png']

module.exports = Subject
