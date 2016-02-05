angular.module('filmer').controller 'CommentsController', ['$scope', 'commentsService', ($scope, commentsService) ->

  $scope.comments = []
  $scope.author = []
  $scope.authorAvatar = []

  $scope.init = (commentable_type, commentable_id, authorName, authorAvatar) ->

    $scope.author = authorName
    $scope.authorAvatar = authorAvatar

    commentsService.query({type: commentable_type, id: commentable_id}).$promise.then (data) ->
      $scope.comments = data
      return

    return

  $scope.create = (comment) ->

    if($scope.body == '')
      return

    comment.author = $scope.author
    comment.authorAvatar = $scope.authorAvatar

    $scope.comments.push(comment)
    $scope.comment = ''

    return
]

angular.module('filmer').factory 'commentsService', ['$resource', ($resource) ->
  $resource('/:type/:id/comments.json', null)
]