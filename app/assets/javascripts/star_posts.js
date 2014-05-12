
App.controller("starPostController",  [
                                        '$modal',
                                        '$scope',
                                        'StarPosts',
                                        '$http',
                                        function ($modal, $scope, StarPosts, $http){


    $scope.star_call = function(){ $scope.stars = StarPosts.query() };
    $scope.star_call();
    // $scope.star = StarPosts.get({}, {'id':1});
    $scope.totalItems = 100;
    $scope.maxSize = 5;
    $scope.currentPage = 1;
    $scope.last_update = function(star){return moment(star.updated_at).format("MMMM Do YYYY")}

    $scope.order = 'users';
    $scope.page = function(list){
      return list.slice(($scope.currentPage-1)*10, $scope.currentPage*10);
    }
    $scope.get_user = function(){ $scope.stars = StarPosts.query({user: $scope.user})};
    $scope.getUsers = function(){ $http.get('/users').then(function(res){ $scope.users = res.data;});};
    $scope.getUsers();
    $scope.filterName = function(filter){ $scope.filtering = filter}
    $scope.colors = { "Ruby" : "red",
                      "Clojure" : "blue",
                      "JavaScript" : "yellow",
                      "Python": "green",
                      "CSS" : "pink"};
    $scope.$watch('user', function(){$scope.get_user()});
    $scope.item_order = 'star'
    $scope.set_as = "Ruby";
    $scope.backColor = function(arg){ return $scope.colors[arg];};
    $scope.reverse = 'reverse'

    $scope.getOrder= function(val){
      return val === $scope.order;
    };

    $scope.setOrder = function(val){
      $scope.order = val;
    };

    $scope.star_selected = {color:'red'};
    $scope.user_selected = {color:'red'};

    $scope.selectedOrder = function(val){
      if (val === 'users'){
        $scope.user_selected = {color:'red'};
        $scope.name_selected = {};
      } else {
        $scope.user_selected = {};
        $scope.name_selected = {color:'red'};

      }
    };

    $scope.selectedFilter = function(val){
      if (val === 'new'){
        $scope.new_selected = {color:'red'};
        $scope.star_selected = {};
      } else {
        $scope.new_selected = {};
        $scope.star_selected = {color:'red'};

      }
    };

}]);
