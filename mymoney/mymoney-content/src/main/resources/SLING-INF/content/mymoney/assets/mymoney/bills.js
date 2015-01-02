myMoneyApp.controller('billsCtrl', function($scope, $modal, $log, $http) {
	$scope.destFolder = '/content/mymoney/bill-data/';
//	bills list
	$scope.bills = [];
//  products section in bill create / update	
	$scope.products = [];
	$scope.product = {
		name: '',
		value: ''
	}
	
	$scope.bill = {
		name: '',
		date: '',
		total: 0
	}
	
	$scope.isEditMode = false;
	$scope.currentPath = '';
	

	
	getSimpleDate = function(date) {
		var yyyy = date.getFullYear().toString();
		var mm = (date.getMonth() + 1).toString();
		mm = mm[1] ? mm : "0" + mm[0];
		var dd = date.getDate().toString();
		dd = dd[1] ? dd : "0" + dd[0];
		var simpleDate = {
			year  :  yyyy,
			month : mm,
			day   : dd
		};
		return simpleDate;
	}
	
	getSimpleDateString = function(date) {
		var simpleDate = getSimpleDate(date);
		return simpleDate.year + '-' + simpleDate.month + '-' + simpleDate.day
	}
	
	$scope.createOrUpdateBill = function() {
		$scope.createBill();
	}

	$scope.createBill = function() {		
		var simpleDate = getSimpleDate($scope.bill.date);

		var params = {};
		params["sling:resourceType"] = "mymoney:bill";
		params["name"] = $scope.bill.name;
		params["date@TypeHint"] = "Date";
		params["date"] = $scope.bill.date;
		params["total"] = $scope.bill.total;
		params["total@TypeHint"] = "Double";
		angular.forEach($scope.products, function(value, key) {
			params['products/' + value.name + '/value'] = value.value;
		});
		
		$http({
			method : 'POST',
			url : '/content/mymoney/bill-data/' + simpleDate.year
					+ '/' + simpleDate.month + '/' + simpleDate.day + '/'
					+ $scope.bill.name,
			data : $.param(params), // jQuery needed - why AngularJS, why?
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
			// set the headers so angular passing info as
			// form data (not request payload)
		})
		.success(function(data) {
			if($scope.isEditMode) {
				params[":operation"] = 'delete';
				console.log(params);
				$http({
					method : 'POST',
					url : $scope.currentPath,
					data : $.param(params),
					headers : {
						'Content-Type' : 'application/x-www-form-urlencoded'
					}
				}).success(function(data) {
					$scope.tidyBillsView();
				});
			} else {
				$scope.tidyBillsView();
			}
		});
	}
	
	$scope.tidyBillsView = function() {
		$scope.isEditMode = false;
		$scope.bill.name = '';
		$scope.bill.date = '';
		$scope.products = [];
		$scope.getBills();
	}
	
	$scope.editBill = function(path) {
		 $http({
			 method : 'GET',
			 url : path+".harray.infinity.json"
	     })
	     .success(function(data) {
	    	 console.log(data);
	    	 $scope.bill.name = data.name;
	    	 $scope.bill.date = new Date(data.date);
	    	 if(data.__children__) {
	    		 $scope.products = data.__children__[0].__children__;
	    	 } else {
	    		 $scope.products = [];
	    	 }
	    	 $scope.bill.total = 0;
	    	 angular.forEach($scope.products, function(value, key) {
	 			value.name = value.__name__;
	 			$scope.bill.total = $scope.bill.total + +value.value;
	 		 });
	    	 $scope.isEditMode = true;
	    	 $scope.currentPath = path;
	    	 console.log( $scope.currentPath);
	    	 console.log( JSON.stringify($scope.products));
	     });
	}
	
	$scope.deleteBill = function(path) {
		$http({
			method : 'POST',
			url : path,
			data : $.param({
				":operation": 'delete'
			}),
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
		})
		.success(function(data) {
			console.log(data);
			$scope.getBills();
		});
	}
	
	$scope.getBills = function() {
        $http({
        	method : 'GET',
        	url : "/content.query.tidy.inifinity.json?queryType=xpath&statement=//*[@sling:resourceType = 'mymoney:bill'] order by @date descending&property=total&property=date"
        })
        .success(function(data, status) {
        	console.log(data);
        	angular.forEach(data, function(value, key) {
    			value.date = new Date(value.date);
    		});
        	$scope.bills = data;
        });
    };
    $scope.bills = $scope.getBills();
    
	$scope.addProduct = function(product) {
		$scope.products.push({
			"name" : product.name,
			"value" : product.value
		});

		$scope.bill.total = 0;
		angular.forEach($scope.products, function(value, key) {
			$scope.bill.total = $scope.bill.total + +value.value;
		});
	};
    
//	datepicker
	$scope.open = function($event) {
		$event.preventDefault();
		$event.stopPropagation();

		$scope.opened = true;
	};

	$scope.openModal = function (size) {
	    var modalInstance = $modal.open({
	      templateUrl: 'bills.popup.html',
	      controller: 'ModalInstanceCtrl',
	      size: size,
	      resolve: {
        	product: function () {
	          return $scope.product;
	        }
	      }
	    });
	    modalInstance.result.then(function (result) {
	    	$log.info('Modal dismissed at: ' + new Date());
	    	$log.info('Product: ' + JSON.stringify(result));
	    	$scope.addProduct(result);
	    });
	};
});
myMoneyApp.controller('ModalInstanceCtrl', function ($scope, $modalInstance) {
	$scope.product = {
		name: '',
		value: ''
	};

	$scope.ok = function () {
		$modalInstance.close($scope.product);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});	