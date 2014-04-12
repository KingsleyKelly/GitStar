var App = angular.module("gitStar", ['ngResource']);
App.factory('StarPosts', function($resource) {
  var x = $resource('/stars').query();
  console.log(x);
  return x;
})
