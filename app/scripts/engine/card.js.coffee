class Game.Card
  constructor: (@game, @sprite) ->
    console.log "Card: Creating"
    @game.load.image @sprite, '../../assets/card/1.png'
    Game.onCreate.add @create
    Game.onUpdate.add @render
    @position = { x: 0, y: 0 }
    @draggable = true

  create: =>
    console.log "Card: rendering card"
    @card = @game.add.sprite 0,0, @sprite
    @card.inputEnabled = true
    @card.input.enableDrag()
    @card.input.dragFromCenter = true
    @card.input.enableSnap 120, 150, false, true
    @card.events.onDragStart.add @onPick
    @card.events.onDragStop.add @onDrop
    @card.events.onDragUpdate.add @onDrag

  render: =>
    @card.tint = 0xFFFFFF
    @card.tint = 0xff0000 unless @draggable

  onPick: (card, pointer) =>
    console.log "Card: picked up (#{pointer.x},#{pointer.y})"

  onDrop: (card, pointer) =>
    console.log "Card: dropped (#{pointer.x},#{pointer.y})"
    if @canBeDropped pointer.x, pointer.y
      @position.x = card.x
      @position.y = card.y
    else
      card.x = @position.x
      card.y = @position.y
      @draggable = @canBeDropped @position.x, @position.y

  onDrag: (card, pointer, dragX, dragY, snapPoint) =>
    @draggable = @canBeDropped pointer.x, pointer.y

  canBeDropped: (x, y) =>
    return false if x > 450
    true
