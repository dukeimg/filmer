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

jQuery ->
  if $('#more').size() > 0
    $('.page-content').bindWithDelay 'scroll', ->
      more_posts_url = $('.pagination .next_page').attr('href')
      if more_posts_url && $('.mdl-layout__content').scrollTop() > $('.page-content').height() - $(window).height() - 120
        $.getScript more_posts_url
      return
    , 250