controllerFunction = ($scope, $http, $sce) ->
    $scope.products = []
    $scope.expression = ''


angular
    .module('myApp2', [])
    .controller('myCtrl2', controllerFunction)

    	