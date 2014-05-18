# Asset paths and some sprites

define([], () ->
  MAIN_DIR = "assets"
  IMG_DIR = "#{MAIN_DIR}/img"

  DOGE_BG = "#{IMG_DIR}/doge.jpg"
  DOGE_BLINK_EYE = "#{IMG_DIR}/doge_blink_eye.png"

  return {
    IMG_DIR: IMG_DIR
    DOGE_BG: DOGE_BG
    DOGE_BLINK_EYE: DOGE_BLINK_EYE
  }
)
