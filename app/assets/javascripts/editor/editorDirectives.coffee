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

        stage.canvas.height = h
        stage.canvas.width = w

        stage.update()

      # Drop

      getDropType = (e, ui) ->
        switch $('.tool').attr('id')
          when 'picture' then pictureRender(e, ui)

      # Pictures

      pictureRender = (e, ui) ->

        canvas = document.getElementById('editorWindow')

        coords = {
          x: getMousePos(canvas, event).x
          y: getMousePos(canvas, event).y
        }

        picturePreload = (e, ui) ->
          queue = new createjs.LoadQueue()
          queue.on("fileload", dropPicture)
          queue.loadFile({
            src: '/images/medium/missing.png'
            type: createjs.AbstractLoader.IMAGE
          })
          return

        dropPicture = (e) ->
          image = new createjs.Bitmap(e.result)
          image.x = coords.x
          image.y = coords.y
          console.log(image.x, image.y)
          stage.addChild(image)

          stage.update()

        picturePreload()


      $('#editorWindow').droppable({
        accept: '.tool'
        drop: getDropType
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