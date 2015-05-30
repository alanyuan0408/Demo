controllerFunction = ($scope, $http) ->
    $scope.products = []
    $scope.expression = ''
    $scope.name = "Alany"

    $scope.product_json = ->
        $.ajax
            method: 'POST',
            url: '/request_product.json',  
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
            success: (data) ->
                $scope.products = data
                $scope.$apply()


    $scope.product_html = ->
        $.ajax
            method: 'POST',
            url: '/request_product.html',  
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
            success: (data) ->
                $scope.getHtml = (html)->
                    return $sce.trustAsHtml(html)
                $scope.expression = data
                $scope.$apply()     


filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)


directive = ->
    return {
        templateUrl: 'name.html' 
    }


angular
    .module("<%= module_name %>", ['templates'])
    .controller('myCtrl', controllerFunction)
	.filter('html', filterFunction)
    .directive('myCustomer', directive)
    	