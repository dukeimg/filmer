root = exports ? this

root.picturesUpload = ->
  $('#photo_image').click().fileupload
    dataType: 'script'
    type: 'POST'
    autoUpload: 'true'
    add: (e, data) ->
      data.context = $(tmpl('template-upload', data.files[0]))
      $('#new').append(data.context)
      data.submit()
      componentHandler.upgradeDom();
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10);
        data.context.find('.progressbar').css('width', progress + '%')
    done: (e, data) ->
      data.context.remove() if data.context
  return
