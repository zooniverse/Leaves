{Step} = require 'zootorial'
GhostMouse = require 'ghost-mouse'

ghostMouse = new GhostMouse events: false

module.exports =
  welcome: new Step
    header: 'Welcome to the Leaves Project!'
    details: 'This quick tutorial will guide you through the classification steps.'
    attachment: '0.5 0.5 .marking-surface 0.5 0.5'
    block: '.subject-container, button[name="next-step"]'
    next: 'measureStem'

  # scale: new Step
  #   details: 'First we\'ll calibrate our classification to the scale of each image.'
  #   instruction: 'Drag from the left to the right of the scale if the lower right of the image.'
  #   attachment: 'right bottom .marking-surface right 0.75'
  #   demo: dragDemo([0.75, 0.9], [0.95, 0.9])

  #   next:
  #     'mouseup .marking-surface': (e) ->
  #       if e.originalEvent.ghostMouse?
  #         'scale'
  #       else
  #         'typeScale'

  #  typeScale: new Step
  #   details: 'Good, now we have to type the scale value into the text input field.'
  #   instruction: 'Type "10" into the scale measurement\'s text field.'
  #   next: 'change-scale-10': 'nextAfterScale'

  # nextAfterScale: new Step
  #   details: 'Great. Now click "Next Step" to move on.'
  #   attachment: 'center bottom button[name="load-next-step"] center top'
  #   actionable: 'button[name="load-next-step"]'
  #   next: 'click button[name="load-next-step"]': 'measureStem'

  measureStem: new Step
    details: 'First we\'ll measure the thickness of the stem.'
    instruction: 'Drag from the left to the right of the stem at its widest point.'
    attachment: 'center bottom .subject-container center 0.4'

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.39, 0.66
        @drag '.marking-surface', 0.53, 0.58
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': 'nextAfterStem'

  nextAfterStem: new Step
    details: 'When you\'re satisfied with your measurement, move on the the next step.'
    attachment: 'center bottom button[name="load-next-step"] center top'
    actionable: 'button[name="load-next-step"]'
    next: 'click button[name="load-next-step"]': 'measureFirstLobule'

  measureFirstLobule: new Step
    details: 'Now we need to draw crosses to measure the major and minor axes of each of the lobules.'
    instruction: 'Drag from the top to the bottom of the lobule at the top-left of the image.'
    attachment: 'left middle .subject-container 0.4 0.4'

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.15963855421686746, 0.10503951362941576
        @drag '.marking-surface', 0.23313253012048193, 0.6781620432736846
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': 'measureSecondAxis'

  measureSecondAxis: new Step
    details: 'Now the minor axis.'
    instruction: 'Now drag a line out perpendicular to the previous line to complete the cross.'
    attachment: 'left middle .subject-container 0.4 0.4'

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.05602409638554217, 0.4172924780562932
        @drag '.marking-surface', 0.33313253012048194, 0.3224308179772418
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': 'oneMore'

  oneMore: new Step
    details: 'Great! There\'s one more lobule in this image.'
    instruction: 'Mark the axes of the other lobule.'
    attachment: 'right middle .marking-surface center middle'

    onEnter: ->
      @markCreatedOnStep = false
      $(document).one 'create-mark', =>
        @markCreatedOnStep = true

      @mousesUp = 0

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.15963855421686746, 0.10503951362941576
        @drag '.marking-surface', 0.23313253012048193, 0.6781620432736846
        @move '.marking-surface', 0.05602409638554217, 0.4172924780562932
        @drag '.marking-surface', 0.33313253012048194, 0.3224308179772418
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': ->
        @mousesUp += 1 if @markCreatedOnStep

        if @mousesUp is 2
          console.log 'To finish'
          'finish'
        else
          console.log 'Dont change steps'
          'oneMore'

    onExit: ->
      delete @mousesUp
      delete @markCreatedOnStep

  finish: new Step
    details: 'Now that we\'ve marked the stem and all the lobules, move on to the next image.'
    attachment: 'center bottom button[name="finish"] center top'
    actionable: 'button[name="finish"]'
    next: 'click button[name="finish"]': true
