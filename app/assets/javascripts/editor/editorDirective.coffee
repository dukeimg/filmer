angular.module('filmer').directive 'document', ->

    template = () ->
      '<canvas id="editorWindow" width ="500px" height = "500px"></canvas>'

    getMousePos = (canvas, evt) ->
      rect = canvas.getBoundingClientRect()
      return {
        x: evt.clientX - rect.left
        y: evt.clientY - rect.top
      }

    drawEditor = (scope, element, attribute) ->
      canvas = new fabric.Canvas('editorWindow')
      canvas.backgroundColor = 'rgba(255, 194, 93, 0.4)'
      canvas.allowTouchScrolling = false

      # Window resize

      handleWindowResize = () ->
        w = $('#window').width()
        h = $('#window').height()

        canvas.setWidth(w)
        canvas.setHeight(h)
        canvas.calcOffset()

      window.addEventListener("resize", handleWindowResize)
      handleWindowResize() #initialization

      # Drop

      getDropType = (e, ui) ->
        switch ui.draggable.data('type')
          when 'picture' then dropPicture(e, ui)

      $('#editorWindow').droppable({
        accept: '.draggable'
        drop: getDropType
      })

      # Drop Picture
      dropPicture = (e, ui) ->

        stage = document.getElementById('editorWindow')

        coords = {
          x: getMousePos(stage, e).x
          y: getMousePos(stage, e).y
        }

        renderPicture = (pic) ->
          pic.left = coords.x - (pic.width / 2)
          pic.top = coords.y - (pic.height / 2)
          pic.opacity = 1
          pic.lockUniScaling = true
          pic.centeredScaling = true
          pic.centeredRotation = true
          canvas.add(pic)

        image = new fabric.Image.fromURL '/images/medium/missing.png', renderPicture

    return {
      restrict: 'E',
      template: template,
      scope: {},
      link: (scope, element, attribute) ->
        drawEditor(scope, element, attribute)
    }

angular.module('filmer').directive 'sidebar', (Resource, $compile) ->

  template = ''

  initSideBar = (s, e, a) ->
    $(document).on 'click', '#all-photos', ->
      console.log('clicked')
      Resource.getAllPhotos().then (result) ->
        d = result.data
        pics = for n, pic of d
          "<div class='draggable slider__picture' id='photo-#{n}' style='background: url(#{pic.thumb}) center / cover'></div>"
        template = "<div class='slider__button-back' id='button-back__all-photos'><i class='material-icons'>arrow_back</i>" +
            "<span>Back</span></div>" +
            pics
        $('#slider-pictures').empty().removeClass('slider-pictures')
        $('#slider-pictures').append(template)

  return {
    restrict: 'E',
    template: template,
    scope: {},
    link: (scope, element, attributes) ->
      initSideBar(scope, element, attributes)
  }