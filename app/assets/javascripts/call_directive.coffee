controllerFunction = ($scope, $http, $sce) ->
    $scope.value = 'This is produced from a slim directive'

myCustomer = ->
	return {
		templateUrl: 'parit'
	}


angular
    .module('myApp2', [])
    .controller('myCtrl2', controllerFunction)
    .directive('myCustomer', myCustomer)

    	