# Client code for canvas stuff

define(["jQuery", "Kinetic"], ($, Kinetic) ->

  MOUSE_BUTTON = {
    left: 1
    right: 2
  }

  myDogeCanvasSelector = "doge-canvas"
  myStage = new Kinetic.Stage({
    container: myDogeCanvasSelector
    width: 675
    height: 506
  })

  ###
    Add doge image as background to the stage
    @param imageSrc: string   path to the background image asset
  ###
  setupBackgroundImage = (imageSrc) ->
    backgroundLayer = new Kinetic.Layer()
    backgroundImage = new Image()
    $(backgroundImage).on("load", ->
      bg = new Kinetic.Image({
        x: 0
        y: 0
        image: backgroundImage
        width: myStage.width()
        height: myStage.height()
      })

      # add the shape to the layer
      backgroundLayer.add(bg)
      # add the layer to the stage
      myStage.add(backgroundLayer)
    ).attr("src", imageSrc)

  addSprite = (type) ->
    if not type
      return
    spriteLayer = new Kinetic.Layer()
    spriteImage = new Image()
    $(spriteImage).on("load", ->
      bg = new Kinetic.Image({
        x: 100
        y: 100
        image: spriteImage
        width: this.width
        height: this.height
        draggable: true
      })

      # add the shape to the layer
      spriteLayer.add(bg)
      # add the layer to the stage
      myStage.add(spriteLayer)
    ).attr("src", "/assets/img/sprite-#{type}.png")

    spriteLayer.on("mouseover", ->
      document.body.style.cursor = "pointer"
    ).on("mouseout", ->
      document.body.style.cursor = "default"
    ).on("mousedown", (e) ->
      # remove sprite layer from the stage on right click
      if e.evt.button == MOUSE_BUTTON.right
        spriteLayer.remove()
    )

  saveAsImage = (callback) ->
    myStage.toDataURL({
      callback: (dataUrl) ->
        window.open(dataUrl)
    })

  ###
    Init canvas settings
  ###
  init = ->
    setupBackgroundImage("/assets/img/doge.jpg")

  init()

  return {
    saveAsImage: saveAsImage
    addSprite: addSprite
    canvasSelector: myDogeCanvasSelector
  }
)
