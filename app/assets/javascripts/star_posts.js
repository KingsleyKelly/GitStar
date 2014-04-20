
App.controller("starPostController",  ['$modal', '$scope', 'StarPosts', function ($modal, $scope, StarPosts){

    $scope.stars = StarPosts.query();
    // $scope.star = StarPosts.get({}, {'id':1});
    $scope.totalItems = 100;
    $scope.maxSize = 5;
    $scope.currentPage = 1;
    $scope.last_update = function(star){return moment(star.updated_at).format("MMMM Do YYYY")}
    $scope.order = 'name'

    $scope.page = function(list){
      return list.slice(($scope.currentPage-1)*10, $scope.currentPage*10);
    }
    $scope.filterName = function(filter){ $scope.filtering = filter}
    $scope.colors = { "Ruby" : "red",
                      "Clojure" : "blue",
                      "JavaScript" : "yellow",
                      "Python": "green",
                      "CSS" : "pink"};
    $scope.backColor = function(arg){ return $scope.colors[arg];};

}]);
