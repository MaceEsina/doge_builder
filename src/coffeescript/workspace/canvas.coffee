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

  addRectangleLayer = ->
    hatLayer = new Kinetic.Layer()
    hatSprite = new Kinetic.Rect({
      x: 100
      y: 40
      width: 100
      height: 50
      fill: "#00D2FF"
      stroke: "black"
      strokeWidth: 4
      draggable: true
    })

    hatSprite.on("mouseover", ->
      document.body.style.cursor = "pointer"
    ).on("mouseout", ->
      document.body.style.cursor = "default"
    )

    hatLayer.add(hatSprite)
    myStage.add(hatLayer)

  saveAsImage = (callback) ->
    myStage.toDataURL({
      callback: (dataUrl) ->
        #window.open(dataUrl)
        callback?(dataUrl)
    })

  ###
    Init canvas settings
  ###
  init = ->
    setupBackgroundImage("/assets/img/doge.jpg")

  init()

  return {
    addRectangleLayer: addRectangleLayer
    saveAsImage: saveAsImage
  }
)
