angular.module('filmer').factory 'Resource',  ($http) ->
  Resource = {}

  Resource.getAllPhotos = () ->
    $http.get('/photos.json')

  Resource.getAlbum = () ->
    $http.get()


  Resource