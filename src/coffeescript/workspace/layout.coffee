# Client code for changing layout stuff, binding events, etc..

define(["jQuery", "workspace/canvas"], ($, canvas) ->
  myToolsPanelToggle = $(".doge-tools-toggle")
  myCanvasTools = $(".doge-canvas-tools")
  myCanvasToolsPanelItem = myCanvasTools.find(".doge-tools-panel-item")
  mySettingsTools = $(".doge-settings-tools")
  mySettingsToolsPanelItem = mySettingsTools.find(".doge-tools-panel-item")

  myToolsPanelToggle.on("click", ->
    $(this).toggleClass("active")
    $(this).next(".doge-tools-panel").toggle(200)
  )

  myCanvasToolsPanelItem.on("click", ->
    spriteType = $(this).data("type")
    canvas.addSprite(spriteType)
  )

  mySettingsToolsPanelItem.on("click", ->
    action = $(this).data("action")
    if action == "save"
      canvas.saveAsImage()
  )

  # don't show browser context menu on right click in canvas
  $('body').on("contextmenu", "##{canvas.canvasSelector}", ->
    return false
  )

  return {}
)
