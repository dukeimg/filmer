root = exports ? this

root.picturesUpload = ->
  $('#photo_image').click().fileupload({
    dataType: 'script',
    type: 'POST',
    autoUpload: 'true'
  })
  return
