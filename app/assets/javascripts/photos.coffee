root = exports ? this

uploader = '<div class="photo__upload-progressbar flexbox flex-center mdl-color--white mdl-shadow--2dp"><div class="progress"><div class="mdl-progress mdl-js-progress"></div></div></div>'

root.picturesUpload = ->
  $('#photo_image').click().fileupload
    dataType: 'script'
    type: 'POST'
    autoUpload: 'true'
    start: (e, data) ->
      $('#upload').append(uploader).fadeIn('slow')
      componentHandler.upgradeDom()
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('.progressbar').css('width', progress + '%')
      if progress == 100
        $('.photo__upload-progressbar').fadeOut('slow', ->
          $('.photo__upload-progressbar').remove()
        ) if progress == 100
  return
