root = exports ? this

root.pictures_upload = ->
  $('#user_avatar').click().fileupload({
    dataType: 'script',
    type: 'POST',
    autoUpload: 'true'
  })
  return