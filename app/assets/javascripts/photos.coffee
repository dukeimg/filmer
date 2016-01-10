root = exports ? this
uploader = '<div class="flexbox flex-center"><div class="mdl-spinner mdl-js-spinner is-active" style="width: 150px; height: 150px"></div></div>'

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

jQuery ->
  if $('#more').size() > 0
    $('.mdl-layout__content').bindWithDelay 'scroll', ->
      more_posts_url = $('.pagination .next_page').attr('href')
      if more_posts_url && $('.mdl-layout__content').scrollTop() > $('#photos').height() - $(window).height() - 60
        $.getScript more_posts_url
      return
    , 250