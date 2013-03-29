{Step} = require 'zootorial'
GhostMouse = require 'ghost-mouse'

ghostMouse = new GhostMouse

module.exports =
  welcome: new Step
    header: 'Welcome to the leaves project!'
    details: 'This tutorial will guide you through the classification steps.'
    attachment: '0.5 0.5 .marking-surface 0.5 0.5'
    next: 'scale'

  scale: new Step
    details: 'First we\'ll calibrate our classification to the scale of each image.'
    instruction: 'Drag from the left to the right of the scale if the lower right of the image.'
    attachment: 'right bottom .marking-surface right 0.75'
    demo: (callback) ->
      newMark = null
      $(window).one 'create-mark', (e, mark) ->
        newMark = mark

      ghostMouse.run ->
        @move '.marking-surface', 0.75, 0.9
        @down()
        @move '.marking-surface', 0.95, 0.9
        @up()
        @do 0, ->
          newMark?.destroy()

      setTimeout callback, 2000

    next:
      'mouseup .marking-surface': (e) ->
        if e.originalEvent.ghostMouse?
          'scale'
        else
          'typeScale'

  typeScale: new Step
    details: 'Good, now we have to type the scale value into the text input field.'
