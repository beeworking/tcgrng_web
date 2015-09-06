window.Game = { }

class Game.Engine
  constructor: () ->
    @game = new Phaser.Game(
      800,
      600,
      Phaser.AUTO,
      'game-view',
      {
        preload: Game.preload,
        init: Game.init,
        create: Game.create,
        update: Game.update,
        render: Game.render
      }
    )

$ ->
  gg = new Game.Engine
