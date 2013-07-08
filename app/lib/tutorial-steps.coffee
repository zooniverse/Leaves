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

module.exports =
  welcome: new Step
    header: 'Welcome to the Leaves Project!'
    details: 'This quick tutorial will guide you through your first classification.'
    attachment: '0.5 0.5 .marking-surface 0.5 0.5'
    block: '.subject-container, button[name="next-step"]'
    next: 'whatIsThis'

  whatIsThis: new Step
    header: 'What are we looking at?'
    details: '''
      We are looking through a microscope at a section of the underside of a plant.
      The rounded bulges, representing sac-like objects growing from either side are actually tiny modified leaves!
      Measuring the length and width of these modified leaves (lobules) can tell us what kind of plant we have.
      Let's start by marking the length of the first modified leaf.
    '''
    attachment: 'center bottom .marking-surface center bottom'
    block: '.subject-container, button[name="next-step"]'
    next: 'measureFirstLobule'

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

  # measureStem: new Step
  #   details: 'First we\'ll measure the thickness of the stem.'
  #   instruction: 'Drag from the left to the right of the stem at its widest point.'
  #   attachment: 'center bottom .subject-container center 0.4'

  #   demo: (callback) ->
  #     ghostMouse.run ->
  #       @move '.marking-surface', 0.39, 0.66
  #       @drag '.marking-surface', 0.53, 0.58
  #       @do 0, -> callback()

  #   next:
  #     'mouseup .marking-surface': 'nextAfterStem'

  # nextAfterStem: new Step
  #   details: 'When you\'re satisfied with your measurement, move on the the next step.'
  #   attachment: 'center bottom button[name="load-next-step"] center top'
  #   actionable: 'button[name="load-next-step"]'
  #   next: 'click button[name="load-next-step"]': 'measureFirstLobule'

  measureFirstLobule: new Step
    details: 'Let\'s start by marking the length of the first leaf.'
    instruction: 'Drag from the top to the bottom of the modified leaf at the top-left of the image.'
    attachment: 'left middle .subject-container 0.4 0.4'

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.159 + 0.05, 0.105 + 0.025
        @drag '.marking-surface', 0.233 + 0.025, 0.678 + 0.085
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': 'measureSecondAxis'

  measureSecondAxis: new Step
    details: '''
      Now, measure the width of this modified leaf by clicking and dragging the cursor across the widest section.
      As you drag, you'll be able to see the angle between the lines change.
      Keep it as close to 90° as possible!
    '''
    instruction: 'Now drag a line out perpendicular to the previous line to complete the cross.'
    attachment: 'left middle .subject-container 0.4 0.4'

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.056 + 0.025, 0.417 + 0.05
        @drag '.marking-surface', 0.333 + 0.025, 0.322 + 0.125
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': 'oneMore'

  oneMore: new Step
    details: 'Great! There\'s one more modified leaf fully visible in this image.'
    instruction: 'Mark the axes of the other modified leaf.'
    attachment: 'right top .marking-surface right top'

    onEnter: ->
      @markCreatedOnStep = false
      $(document).one 'create-mark', =>
        @markCreatedOnStep = true

      @mousesUp = 0

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.560 + 0.05, 0.255 + 0.075
        @drag '.marking-surface', 0.774 + 0.05, 0.761 + 0.075
        @move '.marking-surface', 0.540 + 0.05, 0.595 + 0.05
        @drag '.marking-surface', 0.765 + 0.05, 0.377 + 0.075
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': ->
        @mousesUp += 1 if @markCreatedOnStep
        if @mousesUp is 2 then 'finish' else 'oneMore'

    onExit: ->
      delete @mousesUp
      delete @markCreatedOnStep

  finish: new Step
    details: 'Now that we\'ve marked all the leaves, we can move on to the next image.'
    attachment: 'center bottom button[name="finish"] center top'
    actionable: 'button[name="finish"]'
    next: 'click button[name="finish"]': true
