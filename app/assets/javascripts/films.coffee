showPicturesBar = () ->
 $('#slider-albums').animate {
   left: 0
 }, 200

hidePicturesBar = () ->
  $('#slider-albums').animate {
    left: -250
  }, 200


$(document).on('click', '#tool-picture', showPicturesBar)
$(document).on('click', '#button-back', hidePicturesBar)

$(document).on 'click', '.slider__picture', ->
  $('#slider-pictures').animate {
    left: 0
  }, 200

$(document).on 'click', '.slider__button-back', ->
  $('#slider-pictures').animate {
    left: -250
  }, 200