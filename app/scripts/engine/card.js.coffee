class Game.Card
  constructor: (@game, @sprite) ->
    console.log "Card: Creating"
    @game.load.image(@sprite, '../../assets/card/1.png');
    Game.onCreate.add(@render)

  render: =>
    console.log "rendering card"
    @game.add.sprite(0,0, @sprite)
