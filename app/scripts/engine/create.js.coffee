@create = ->
  console.log "Phaser: Create"
  game.stage.backgroundColor = '#505050'
  game.create.grid('uiGrid', 800, 600, 64, 64, "#ff5500")
  game.add.sprite(0, 0, 'uiGrid')
