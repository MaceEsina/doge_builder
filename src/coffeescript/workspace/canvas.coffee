# Client code for canvas stuff

define(["jQuery", "Kinetic"], ($, Kinetic) ->

  myStage = new Kinetic.Stage({
    container: "doge-canvas"
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
        width: 160
        height: 160
        draggable: true
      })

      # add the shape to the layer
      spriteLayer.add(bg)
      # add the layer to the stage
      myStage.add(spriteLayer)

      # bg.on("mouseover", ->
      #   bg.setStrokeWidth(1)
      #   bg.setStroke("Grey")
      #   spriteLayer.draw()
      # ).on("mouseout", ->
      #   bg.setStrokeWidth(0)
      #   bg.setStroke("Transparent")
      #   spriteLayer.draw()
      # )
    ).attr("src", "/assets/img/sprite-#{type}.png")

    spriteLayer.on("mouseover", ->
      document.body.style.cursor = "pointer"
    ).on("mouseout", ->
      document.body.style.cursor = "default"
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
  }
)
