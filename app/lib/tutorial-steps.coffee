GhostMouse = require 'ghost-mouse'
ghostMouse = new GhostMouse
  events: false
  swing: 0

translate = require 't7e'

module.exports =
  welcome:
    header: translate 'span', 'tutorial.welcome.header'
    content: translate 'span', 'tutorial.welcome.content'
    attachment: [0.5, 0.5, '.marking-surface', 0.5, 0.5]
    block: '.subject-container, button[name="next-step"]'
    next: 'whatIsThis'

  whatIsThis:
    header: translate 'span', 'tutorial.whatIsThis.header'
    content: translate 'span', 'tutorial.whatIsThis.content'
    attachment: ['center', 'bottom', '.marking-surface', 'center', 'bottom']
    block: '.subject-container, button[name="next-step"]'
    next: 'measureFirstLobule'

  measureFirstLobule:
    content: translate 'span', 'tutorial.measureFirstLobule.content'
    instruction: translate 'span', 'tutorial.measureFirstLobule.instruction'
    attachment: ['left', 'middle', '.marking-surface-container', '0.4', '0.4']

    demo: (callback) ->
      ghostMouse.run ->
        @move '.marking-surface', 0.159 + 0.05, 0.105 + 0.025
        @drag '.marking-surface', 0.233 + 0.025, 0.678 + 0.085
        @do 0, -> callback()

    next:
      'mouseup .marking-surface': 'measureSecondAxis'

  measureSecondAxis:
    content: translate 'span', 'tutorial.measureSecondAxis.content'
    instruction: translate 'span', 'tutorial.measureSecondAxis.instruction'
    attachment: ['left', 'middle', '.marking-surface-container', '0.4', '0.4']

    demo: ->
      ghostMouse.run ->
        @move '.marking-surface', 0.056 + 0.025, 0.417 + 0.05
        @drag '.marking-surface', 0.333 + 0.025, 0.322 + 0.125

    next:
      'mouseup .marking-surface': 'oneMore'

  oneMore:
    content: translate 'span', 'tutorial.oneMore.content'
    instruction: translate 'span', 'tutorial.oneMore.instruction'
    attachment: ['right', 'top', '.marking-surface', 'right', 'top']

    onLoad: ->
      @markCreatedOnStep ?= false
      $(document).one 'create-mark', =>
        @markCreatedOnStep = true

      @mousesUp ?= 0

    demo: ->
      ghostMouse.run ->
        @move '.marking-surface', 0.560 + 0.05, 0.255 + 0.075
        @drag '.marking-surface', 0.774 + 0.05, 0.761 + 0.075
        @move '.marking-surface', 0.540 + 0.05, 0.595 + 0.05
        @drag '.marking-surface', 0.765 + 0.05, 0.377 + 0.075

    next:
      'mouseup .marking-surface': ->
        @mousesUp += 1 if @markCreatedOnStep
        if @mousesUp is 2 then 'finish' else 'oneMore'

  finish:
    content: translate 'span', 'tutorial.finish.content'
    attachment: [0.5, 0.5, '.marking-surface', 0.5, 0.5]
    onLoad: ->
      delete @markCreatedOnStep
      delete @mousesUp
