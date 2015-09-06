Game.onCreate = new Phaser.Signal()
Game.create = ->
  console.log "Phaser: Creating"
  @game.stage.backgroundColor = '#505050'
  @game.create.grid('uiGrid', @game.width, @game.height, 120, 150, "#ff5500")
  @game.add.sprite(0, 0, 'uiGrid')
  Game.onCreate.dispatch()
