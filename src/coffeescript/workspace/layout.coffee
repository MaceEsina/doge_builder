# Client code for changing layout stuff, binding events, etc..

define(["jQuery", "workspace/canvas", "workspace/background"], ($, canvas, background) ->

  myToolsPanelToggle = $(".tools-toggle")
  myCanvasTools = $("#canvas-tools")
  mySettingsTools = $("#settings-tools")
  mySpriteBtn = myCanvasTools.find(".sprite-btn")
  myActionBtn = mySettingsTools.find(".action-btn")

  myToolsPanelToggle.on("click", ->
    $(this).toggleClass("active")
    $(this).next(".tools-panel").toggle(200)
  )

  mySpriteBtn.on("click", ->
    spriteImagePreview = $(this).find(".sprite-preview")
    canvas.addSprite(spriteImagePreview)
    spriteType = $(this).data("type")
    background.addRandomWord(spriteType)
  )

  myActionBtn.on("click", ->
    action = $(this).data("action")
    if action == "save"
      canvas.saveAsImage()
  )

  # don't show browser context menu on right click in canvas
  $("body").on("contextmenu", "##{canvas.canvasSelector}", ->
    return false
  )

  return {}
)
