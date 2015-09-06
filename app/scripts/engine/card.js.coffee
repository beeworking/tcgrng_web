class Game.Card
  constructor: (@game, @sprite) ->
    console.log "Card: Creating"
    @game.load.image(@sprite, '../../assets/card/1.png');
    Game.onCreate.add(@render)

  render: =>
    console.log "Card: rendering card"
    card = @game.add.sprite(0,0, @sprite)
    card.inputEnabled = true
    card.input.enableDrag()
    card.input.enableSnap(120, 150, false, true)
    card.events.onDragStart.add(@onPick, @)
    card.events.onDragStop.add(@onDrop, @)

  onPick: (card, pointer) =>
    console.log "Card: picked up (#{pointer.x},#{pointer.y})"

  onDrop: (card, pointer) =>
    console.log "Card: dropped (#{pointer.x},#{pointer.y})"
