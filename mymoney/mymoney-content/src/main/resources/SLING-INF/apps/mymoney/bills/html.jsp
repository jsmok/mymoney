<%@ include file="/apps/mymoney/global.jsp"%>
<!DOCTYPE html>
<html lang="en" ng-app="myMoneyApp">
<head>
	<title>Bills</title>
	<sling:include resource="<%=resource%>" replaceSelectors="head" />
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="/content/mymoney/assets/mymoney/bills.js"></script>
</head>
<body>
	<div class="container" ng-controller="billsCtrl">
		<sling:include resource="<%=resource%>" replaceSelectors="menu" />
		<div class="jumbotron">
			<h1>Bills</h1>
			<p>Here you can make some CRUD operations bills</p>
			<p>
				Since it's a Sling demo - here is a path to this resource:
				<code><%=resource.getPath()%></code>
			</p>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title">
					<span class="glyphicon glyphicon-list-alt"></span> <label>Bill details</label>
				</div>
			</div>
			<div class="panel-body">
				<form name="form" class="form-inline" role="form" ng-submit="createOrUpdateBill()">
					<div class="input-group">
						<span class="input-group-addon">Desc:</span>
						<input type="text" class="form-control" id="billName" ng-model="billName" placeholder="Name">
					</div>
					<div class="input-group">
						<span class="input-group-addon">Date:</span>
						<input type="text" class="form-control" id="billDate" datepicker-popup="dd-MM-yyyy" ng-model="billDate" is-open="opened" min-date="minDate" max-date="'2015-06-22'" datepicker-options="dateOptions" date-disabled="disabled(billDate, mode)" ng-required="true" close-text="Close" />
						<span class="input-group-btn">
			            	<button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
			            </span>
					</div>
				</form>
				<br>
				<table class="table table-hover" ng-show='products.length > 0'>
					<thead>
						<tr>
							<th>Product</th>
							<th style="text-align: center">#</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="product in products">
							<td class="col-md-9"><em>{{product.name}}</em></td>
							<td class="col-md-1" style="text-align: center">{{product.index}}</td>
							<td class="col-md-1 text-center">{{product.value}}</td>
							<td class="col-md-1 text-center">{{product.value}}</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="text-right"><strong>Total: </strong></td>
							<td class="text-center text-danger"><strong>{{total}}</strong></td>
						</tr>
					</tbody>
				</table>
				<div class="panel panel-default" ng-hide="toggleAddProduct">
					<div class="panel-heading"><label>Add product</label> <button ng-click="showAddProduct()" class="btn btn-default glyphicon glyphicon-plus" id="showAddProduct"></button></div>
				</div>
				<div class="panel panel-default" ng-show="toggleAddProduct">
					<div class="panel-heading"><label>Add product</label></div>
					<div class="panel-body">
						<form class="form-inline">
							<div class="form-group" class="form-inline">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-pushpin"> Name:</span></span> 
									<input type="text" class="form-control" id="productName" ng-model="productName" placeholder="Name">
								</div>
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-usd"> Value:</span></span> 
									<input type="text" class="form-control" id="productValue" ng-model="productValue" placeholder="Value">
								</div>
								<div class="btn-group">
									<button ng-click="addProduct()" class="btn btn-default glyphicon glyphicon-ok" id="addProduct">
									<button ng-click="cancelAddProduct()" class="btn btn-default glyphicon glyphicon-remove" id="cancelAddProduct"></button>
								</div>
								
							</div>
						</form>
					</div>
				</div>
				<div class="btn-group">
					<button ng-click="createOrUpdateBill()" class="btn btn-default glyphicon glyphicon-ok" id="createBill"></button>
					<button ng-click="cancelBillCreation()" class="btn btn-default glyphicon glyphicon-remove"	id="cancelBillCreation"></button>
				</div>
			</div>				
		</div>
		<div class="panel panel-default" ng-show='bills.length > 0'>
			<div class="panel-heading">
				<div class="panel-title">
					<span class="glyphicon glyphicon glyphicon-list"></span> <label>Bills</label>
				</div>
			</div>
			<!-- Table -->
			<table class="table">
				<thead>
					<tr>
						<th>Date</th>
						<th>Desc</th>
						<th>Total</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="bill in bills">
						<td>{{bill.date | date:'yyyy-MM-dd'}}</td>
						<td>{{bill.name}}</td>
						<td>{{bill.total}}</td>
						<td>
							<div class="btn-group">
  								<button ng-click="editBill(bill['jcr:path'])" type="button" class="btn btn-default glyphicon glyphicon-pencil"></button>
  								<button ng-click="deleteBill(bill['jcr:path'])" type="button" class="btn btn-default glyphicon glyphicon-trash"></button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>