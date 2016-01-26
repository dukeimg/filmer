app = angular.module('comments', ['ngResource'])

app.controller 'CommentsController', ["$scope", "$resource", ($scope, $resource) ->
  $scope = this
  $scope.response = []

  source = $resource('/photos/:id.json', {id: '@id'})
  source.get(id: 3287).$promise.then (data) ->
    $scope.response = data.toJSON().comments
    console.log($scope.response)
    return
  return
]

