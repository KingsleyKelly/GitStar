
App.controller("starPostController",  ['$scope', 'StarPosts', function ($scope, StarPosts){

    $scope.stars = StarPosts.query();
    $scope.last_update = function(star){return moment(star.updated_at).format("MMMM Do YYYY")}
    $scope.order = 'name'


    $scope.filterName = function(filter){ $scope.filtering = filter}
    $scope.colors = { "Ruby" : "red", "Clojure" : "blue", "JavaScript" : "yellow", "Python": "green"};
    $scope.backColor = function(arg){ return $scope.colors[arg];};

}]);
