controllerFunction = ($scope, $http, $sce) ->
    $scope.products = []
    $scope.expression = ''

    $scope.product_json = ->
        $.ajax
            method: 'POST',
            url: '/request_product.json',  
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
            success: (data, status) ->
                $scope.products = data


    $scope.product_html = ->
        $.ajax
            method: 'POST',
            url: '/request_product.json',  
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
            success: (data, status) ->
                $scope.getHtml = (html)->
                    return $sce.trustAsHtml(html)

                $scope.expression = data


filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)


angular
    .module('myApp', [])
    .controller('myCtrl', controllerFunction)
	.filter('html', filterFunction)
    	