myMoneyApp.controller('billsCtrl', function($scope) {
	$scope.products = [ {
		"name" : "Majonez",
		"value" : 3.5
	}, {
		"name" : "Papryka",
		"value" : 3
	}, {
		"name" : "Bulka",
		"value" : 2
	} ];

	$scope.addProduct = function() {
		name = $scope.enteredValue
		$scope.products.push({
			"name" : $scope.enteredName,
			"value" : $scope.enteredValue
		});
		$scope.enteredName = '';
		$scope.enteredValue = '';
		
		$scope.total = 0;
		angular.forEach($scope.products, function(value, key) {
			$scope.total = $scope.total + +value.value;
		});
	};

	$scope.open = function($event) {
		$event.preventDefault();
		$event.stopPropagation();

		$scope.opened = true;
	};
});