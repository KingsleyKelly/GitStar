var App = angular.module("gitStar",
                        ['ngResource',
                         'mgcrea.ngStrap',
                         'ui.bootstrap',
                         'ui.router']
                       );
App.factory('StarPosts', function($modal, $resource) {
  return $resource('/stars');
});
