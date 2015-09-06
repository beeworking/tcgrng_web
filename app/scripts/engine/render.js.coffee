Game.onRender = new Phaser.Signal()
Game.render = ->
  Game.onRender.dispatch()
