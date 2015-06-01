controllerFunction = ($scope, $http) ->
    $scope.products = []
    $scope.expression = ''
    $scope.return_sum = null
    $scope.input = ''
    $scope.user = ''
    $scope.total_error = ''
    $scope.follower_expression = ''

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


    $scope.sum_product = ->
        request = {
            product_name: $scope.input
        }

        $.ajax
            method: 'POST',
            url: '/request_sum.json',
            data: request, 
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
            success: (data) ->
                $scope.return_sum = data.total
                $scope.$apply()
            error: (xhr)->
                console.log(xhr)
                $scope.total_error = "The Product does not exist"
                $scope.$apply()


    $scope.get_followers = ->
        request = {
            request_user: $scope.user
        }

        $.ajax
            method: 'POST',
            url: '/get_followers.html',
            data: request, 
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
            success: (data) ->
                $scope.getHtml = (html)->
                    return $sce.trustAsHtml(html)
                $scope.follower_expression = data
                $scope.$apply()



filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)


angular
    .module('myApp', [])
    .controller('myCtrl', controllerFunction)
	.filter('html', filterFunction)
    	