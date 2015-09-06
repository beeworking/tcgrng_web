window.Game = { }

class Game.Engine
  constructor: () ->
    card_w = 120
    card_h = 150
    @game = new Phaser.Game(
      card_w * 10,
      card_h * 4,
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
