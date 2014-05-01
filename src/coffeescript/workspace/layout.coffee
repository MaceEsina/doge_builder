# Client code for changing layout stuff, binding events, etc..

define(["jQuery", "workspace/canvas"], ($, canvas) ->
  myToolsPanelToggle = $(".doge-tools-toggle")
  myToolsPanelItem = $(".doge-tools-panel-item")

  myToolsPanelToggle.on("click", ->
    $(this).next(".doge-tools-panel").toggle(200)
  )

  myToolsPanelItem.on("click", ->
  	canvas.addRectangleLayer()
  )

  return {}
)
