
App.controller("starPostController",  ['$scope', 'StarPosts', function ($scope, StarPosts){
    $scope.stars = StarPosts;
    $scope.modal = {
      "title": "Title",
      "content": "Sweet Modal Bro"
    };
  }]);
