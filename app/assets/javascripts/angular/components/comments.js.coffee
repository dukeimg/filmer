app = angular.module('comments', ['ngResource'])

app.controller 'CommentsController', ['$scope', 'GetComments', ($scope, GetComments) ->

  store = this
  store.comments = []

  $scope.init = (photo_id) ->
    GetComments.query({id: photo_id}).$promise.then (data) ->
      store.comments = data
      return
  return
]

app.factory 'GetComments', ['$resource', ($resource) ->
  $resource('/photos/:id.json', null)
]

app.controller 'NewCommentController', ->
  this.comment = {}


  this.create = (store) ->
    console.log(store)
    store.comments.push(this.comment)
