angular.module('filmer').directive 'document', ->

    template = () ->
      '<canvas id="editorWindow" style="background-color: rgba(255, 194, 93, 0.4)" width ="500px" height = "500px"></canvas>'

    getMousePos = (canvas, evt) ->
      rect = canvas.getBoundingClientRect()
      return {
        x: evt.clientX - rect.left
        y: evt.clientY - rect.top
      }

    drawEditor = (scope, element, attribute) ->
      canvas = new fabric.Canvas('editorWindow')

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
        switch $('.tool').attr('id')
          when 'picture' then dropPicture(e, ui)

      $('#editorWindow').droppable({
        accept: '.tool'
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
          canvas.add(pic)

        image = new fabric.Image.fromURL '/images/medium/missing.png', renderPicture

    return {
      restrict: 'E',
      template: template,
      scope: {},
      link: (scope, element, attribute) ->
        drawEditor(scope, element, attribute)
    }