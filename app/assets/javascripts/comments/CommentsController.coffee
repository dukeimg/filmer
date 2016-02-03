angular.module('filmer').controller 'CommentsController', ['commentsInitializer', (commentsInitializer) ->

  store = this
  store.comments = []

  $scope.init = (photo_id) ->
    GetComments.query({id: photo_id}).$promise.then (data) ->
      store.comments = data
      return
  return

]