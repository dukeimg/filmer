root = exports ? this
uploader = '<div class="flexbox flex-center"><div class="mdl-spinner mdl-js-spinner is-active" style="width: 150px; height: 150px"></div></div>'
input = $('#input')

root.picturesUpload = ->
  $('#photo_image').click().fileupload
    dataType: 'script'
    type: 'POST'
    autoUpload: 'true'
    start: (e, data) ->
      $('#input').fadeOut('fast', ->
        $('.photo__upload-progressbar').fadeIn('fast')
        return)
      componentHandler.upgradeDom()
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('.progressbar').css('width', progress + '%')
    stop: (e, data) ->
      $('.photo__upload-progressbar').fadeOut('fast', ->
        $('#input').fadeIn('fast')
        return)
      componentHandler.upgradeDom()
  return

jQuery ->
  if $('#more').size() > 0
    $('.mdl-layout__content').bindWithDelay 'scroll', ->
      more_posts_url = $('.pagination .next_page').attr('href')
      if more_posts_url && $('.mdl-layout__content').scrollTop() > $('#photos').height() - $(window).height() - 60
        $.getScript more_posts_url
      return
    , 250