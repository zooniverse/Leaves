{Step} = require 'zootorial'
GhostMouse = require 'ghost-mouse'

ghostMouse = new GhostMouse

dragDemo = (start, end) ->
  (callback) ->
    newMark = null

    $(window).one 'create-mark', (e, mark) ->
      newMark = mark

    ghostMouse.run ->
      @move '.marking-surface', start...
      @drag '.marking-surface', end...
      @do 0, -> newMark?.destroy()
      @do 0, -> callback()

module.exports =
  welcome: new Step
    details: 'This tutorial will guide you through the classification steps.'
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
    demo: dragDemo([0.5, 0.5], [0.7, 0.5])

    next:
      'mouseup .marking-surface': (e) ->
        if e.originalEvent.ghostMouse?
          'measureStem'
        else
          'nextAfterStem'

  nextAfterStem: new Step
    details: 'Let\'s move on the the next step again.'
    attachment: 'center bottom button[name="load-next-step"] center top'
    actionable: 'button[name="load-next-step"]'
    next: 'click button[name="load-next-step"]': 'measureFirstAxis'

  measureFirstAxis: new Step
    details: 'Finally, we\'ll draw "&times;"s to measure the major and minor axes of three lobules.'
    instruction: 'Drag from the top to the bottom of the lobule at the top-right of the image.'

    demo: (callback) ->
      newMark = null

      $(window).one 'create-mark', (e, mark) ->
        newMark = mark

      ghostMouse.run ->
        @move '.marking-surface', 0.2, 0.1
        @drag '.marking-surface', 0.2, 0.3
        @do 0, -> newMark?.destroy()
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': (e) ->
        if e.originalEvent.ghostMouse?
          'measureFirstAxis'
        else
          'measureSecondAxis'

  measureSecondAxis: new Step
    details: 'Now the minor axis.'
    instruction: 'Drag perpendicular the previous line to complete the cross.'

    demo: (callback) ->
      # TODO: Find a better way to access the selection.
      selection = require('../index').stack.classify.surface.selection
      mark = selection.mark

      ghostMouse.run ->
        @move '.marking-surface', 0.1, 0.2
        @drag '.marking-surface', 0.3, 0.2

        @do 0, ->
          mark.set
            p2: [mark.p0[0], mark.p0[1]]
            p3: [mark.p1[0], mark.p1[1]]

          selection.clicks -= 1

        @do 0, -> callback()

    next:
      'mouseup .marking-surface': (e) ->
        if e.originalEvent.ghostMouse?
          'measureSecondAxis'
        else
          'twoMore'

  twoMore: new Step
    details: 'Great! Now try two more on your own.'
    instructions: 'Mark the axes of another lobule.'
    next: 'oneMore'

  oneMore: new Step
    details: 'Mark just one more!'
    instruction: 'Mark the axes of another lobule.'
