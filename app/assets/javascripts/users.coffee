root = exports ? this

root.upload = ->
  $('#user_avatar').click().fileupload({
    dataType: 'script',
    type: 'POST',
    autoUpload: 'true'
  })
  return

$(document).on('click', '#btn-close', ->
  $('.popup').remove()
  return
)