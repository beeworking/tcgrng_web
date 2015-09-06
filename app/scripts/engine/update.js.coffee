Game.onUpdate = new Phaser.Signal()
Game.update = ->
  Game.onUpdate.dispatch()
