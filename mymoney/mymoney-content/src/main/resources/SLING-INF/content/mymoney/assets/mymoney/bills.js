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
		$scope.products.push({
			"name" : $scope.enteredName,
			"value" : $scope.enteredValue
		});
		$scope.enteredName = '';
		$scope.enteredValue = '';
	};

	$scope.open = function($event) {
		$event.preventDefault();
		$event.stopPropagation();

		$scope.opened = true;
	};
});