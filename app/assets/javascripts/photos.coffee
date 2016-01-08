root = exports ? this

root.picturesUpload = ->
  $('#photo_image').click().fileupload
    dataType: 'script'
    type: 'POST'
    autoUpload: 'true'
    start: (e, data) ->
      $('.photo__upload-progressbar').fadeIn('slow')
      componentHandler.upgradeDom()
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('.progressbar').css('width', progress + '%')
      if progress == 100
        $('.photo__upload-progressbar').fadeOut('slow') if progress == 100
  return
