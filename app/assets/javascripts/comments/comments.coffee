angular.module('filmer').controller 'CommentsController', ['$scope', 'commentsService', ($scope, commentsService) ->

  $scope.comments = []
  $scope.author = []
  $scope.authorAvatar = []

  $scope.init = (commentable_type, commentable_id, authorName, authorAvatar) ->

    $scope.commentable_type = commentable_type
    $scope.commentable_id = commentable_id
    $scope.author = authorName
    $scope.authorAvatar = authorAvatar

    commentsService.query({type: commentable_type, id: commentable_id}).$promise.then (data) ->
      $scope.comments = data
      return

    return

  $scope.create = (comment) ->

    if(comment.body == '')
      return

    comment.author = $scope.author
    comment.authorAvatar = $scope.authorAvatar

    commentsService.save({type: $scope.commentable_type, id: $scope.commentable_id, body: comment.body}).$promise.then (data) ->
      $scope.comments.push(comment)
      $scope.comment = ''

    return
]

angular.module('filmer').factory 'commentsService', ['$resource', ($resource) ->
  $resource('/:type/:id/comments.json', {type: '@type', id: '@id', body: '@body'}, {
    charge: { method: 'POST' }, find: { method: 'POST' }
  })
]