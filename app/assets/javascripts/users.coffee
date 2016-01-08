root = exports ? this

uploader = '<div class="mdl-spinner mdl-js-spinner is-active" style="width: 150px; height: 150px"></div>'

root.avatar_upload = ->
  $('#user_avatar').click().fileupload({
    dataType: 'script'
    type: 'POST'
    autoUpload: 'true'
    start: (e, data) ->
      componentHandler.upgradeDom()
      $('#card').empty().addClass('flexbox flex-center').append(uploader)
      componentHandler.upgradeDom()
  })
  return

$(document).on('click', '#btn-close', ->
  $('.popup').remove()
  return
)