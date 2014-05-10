# Client code for adding random words to the body
# e.g. wow, so hat, such glasses, etc

define(["jQuery"], ($) ->

  myDogeVocabulary = {
    single: ["wow", "cool", "test", "hooroor"]
    multi: ["so", "such", "very"]
  }

  addRandomWord = (incomingWord) ->
    word = ""
    if incomingWord? and randomInt(0, 2) == 1
      randomIndex = randomInt(0, myDogeVocabulary.multi.length - 1)
      word = "#{myDogeVocabulary.multi[0]} #{incomingWord}"
    else
      randomIndex = randomInt(0, myDogeVocabulary.single.length - 1)
      word = myDogeVocabulary.single[randomIndex]
    wordSpan = $("<span></span>").text(word).addClass("doge-word")

    # we have c-1, c-2, ... classes with different font-color values
    wordSpan.addClass("c-#{randomInt(1, 5)}")
    wordOffset = {
      left: randomInt(10, $("body").width() - 50)
      top: randomInt(10, $("body").height() - 50)
    }
    # setup word position and font size
    wordSpan.css({
      top: "#{wordOffset.top}px"
      left: "#{wordOffset.left}px"
      fontSize: "#{randomInt(24, 48)}px"
    })

    $("body").append(wordSpan)
    wordSpan.fadeOut(2000)

  randomInt = (min, max) ->
    Math.floor(Math.random() * (max - min + 1)) + min

  return {
    addRandomWord: addRandomWord
  }
)
