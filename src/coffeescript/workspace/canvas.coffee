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

  setupBlinkEyeImage = (imageSrc, blinkDelay = 10000) ->
    blinkEyeLayer = new Kinetic.Layer()
    blinkEyeImage = new Image()
    $(blinkEyeImage).on("load", ->
      blinkEyeImage = new Kinetic.Image({
        x: 307
        y: 88
        image: blinkEyeImage
        width: blinkEyeImage.width
        height: blinkEyeImage.height
      })

      blinkEyeLayer.add(blinkEyeImage)
      myStage.add(blinkEyeLayer)
      blinkEyeLayer.hide()
      window.setInterval((->
        blinkEyeLayer.show()
        window.setTimeout((->
          blinkEyeLayer.hide()
        ), 100)
      ), blinkDelay)
    ).attr("src", imageSrc)

  getOriginalImage = (image) ->
    img = image.get(0)
    # Make in memory copy of image to avoid css issues
    

  ###
    Add sprite to the stage
    @param spriteImage: object  jQuery sprite image object
  ###
  addSprite = (spriteImage) ->
    spriteLayer = new Kinetic.Layer()

    if typeof spriteImage is "object"
      # if spriteImage is jQuery object
      $("<img/>").on("load", ->
        addImageToSpriteLayer(this, spriteLayer)
      ).attr("src", spriteImage.attr("src"))
    else if typeof spriteImage is "string"
      # if we pass a "type" of sprite to function args instead of "image" object
      # e.g. we can pass "hat1" or "glasses2" and considering sprite image will be loaded
      spriteImage = new Image()
      $(spriteImage).on("load", ->
        addImageToSpriteLayer(spriteImage, spriteLayer)
      ).attr("src", "/assets/img/sprite-#{spriteImage}.png")
    else
      console.error("Can't add sprite #{spriteImage} to the #{spriteLayer}")

    spriteLayer.on("mouseover", ->
      document.body.style.cursor = "pointer"
    ).on("mouseout", ->
      document.body.style.cursor = "default"
    ).on("mouseup", (e) ->
      # remove sprite layer from the stage on right click
      if e.evt.button == MOUSE_BUTTON.right
        spriteLayer.remove()
    )

  ###
    @param spriteImage: Image object  image which will be added
    @param spriteLayer: Layer object  layer on which we want to add an image
    @param options: {
             width: number
             height: number
           }
  ###
  addImageToSpriteLayer = (spriteImage, spriteLayer, options) ->
    if not spriteLayer
      spriteLayer = new Kinetic.Layer()
    bg = new Kinetic.Image({
      x: 100
      y: 100
      image: spriteImage
      width: options?.width || spriteImage.width
      height: options?.height || spriteImage.height
      draggable: true
    })
    # add the shape to the layer
    spriteLayer.add(bg)
    # add the layer to the stage
    myStage.add(spriteLayer)

  saveAsImage = ->
    myStage.toDataURL({
      callback: (dataUrl) -> window.open(dataUrl)
    })

  ###
    Init canvas settings
  ###
  init = ->
    setupBackgroundImage("/assets/img/doge.jpg")
    setupBlinkEyeImage("/assets/img/doge_blink_eye.png")

  init()

  return {
    saveAsImage: saveAsImage
    addSprite: addSprite
    canvasSelector: myDogeCanvasSelector
  }
)
