angular.module('filmer').factory 'SidebarService',  ($http) ->
  Resource = {}

  Resource.getAllPhotos = () ->
    $http.get('/photos.json')

  Resource.getAlbum = () ->
    $http.get()


  Resource