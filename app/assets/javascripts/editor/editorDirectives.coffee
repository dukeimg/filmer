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

      stage = new createjs.Stage('editorWindow')

      # Resize

      handleResize = () ->
        w = $('#window').width()
        h = $('#window').height()
        unit = h

        stage.canvas.height = h
        stage.canvas.width = w

        stage.update()

      # Drops

      getDropType = (e, ui) ->
        switch $('.tool').attr('id')
          when 'picture' then dropPicture(e, ui)

      dropPicture = (event, ui) ->
        canvas = document.getElementById('editorWindow')
        console.log('dropped')
        image = new createjs.Bitmap('/images/medium/missing.png')
        image.x = getMousePos(canvas, event).x
        image.y = getMousePos(canvas, event).y
        stage.addChild(image)

        stage.update()


      $('#editorWindow').droppable({
        accept: '.tool'
        drop: (e, ui) ->
          getDropType(e ,ui)
      })

      # initialization

      window.addEventListener("resize", handleResize)
      handleResize() #initialization


    return {
      restrict: 'E',
      template: template,
      scope: {},
      link: (scope, element, attribute) ->
        drawEditor(scope, element, attribute)
    }