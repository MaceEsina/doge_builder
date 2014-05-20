# Client code for modal windows

define(["jQuery"], ($) ->

  class Modal
    onShownCallback: null
    onHiddenCallback: null

    constructor: (@modal) ->
      @modal.find(".modal-close").on("click", =>
        @hide()
      )
    show: ->
      @modal.show()
      @onShownCallback?()
    hide: ->
      @modal.hide()
      @onHiddenCallback?()
    toggle: ->
      if @modal.is(":hidden") then @show() else @hide()
    setShownCallback: (fxnCallback) ->
      @onShownCallback = fxnCallback
    setHiddenCallback: (fxnCallback) ->
      @onHiddenCallback = fxnCallback

  return {
    Modal: Modal
  }
)
