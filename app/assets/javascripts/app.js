var App = angular.module("gitStar", ['ngResource', 'mgcrea.ngStrap']);
App.factory('StarPosts', function($resource) {
  return $resource('/stars').query();
})
