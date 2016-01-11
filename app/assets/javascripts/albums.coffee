jQuery ->
  if $('#more').size() > 0
    $('.mdl-layout__content').bindWithDelay 'scroll', ->
      more_posts_url = $('.pagination .next_page').attr('href')
      if more_posts_url && $('.mdl-layout__content').scrollTop() > $('#photos').height() - $(window).height() - 60
        $.getScript more_posts_url
      return
    , 250