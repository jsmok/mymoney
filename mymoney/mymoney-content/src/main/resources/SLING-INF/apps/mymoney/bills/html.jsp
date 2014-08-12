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
			<p>Here you can make some CRUD bills</p>
			<p>
				Since it's a Sling demo - here is a path to this resource:
				<code><%=resource.getPath()%></code>
			</p>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title">
					<span class="glyphicon glyphicon-list-alt"></span> Bill details:
				</div>
			</div>
			<div class="panel-body">
				<form name="form" class="form-inline" role="form" ng-submit="createBill()">
					<div class="input-group">
						<span class="input-group-addon">Desc:</span>
						<input type="text" class="form-control" id="desc" ng-model="desc" placeholder="Description">
					</div>
					<div class="input-group">
						<span class="input-group-addon">Date:</span>
						<input type="text" class="form-control" id="date" datepicker-popup="dd-MM-yyyy" ng-model="date" is-open="opened" min-date="minDate" max-date="'2015-06-22'" datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
						<span class="input-group-btn">
			            	<button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
			            </span>
					</div>
					<button type="submit" class="btn btn-default" id="createBill">Submit</button>
					{{ form.$valid }}		
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
							<td class="col-md-9"><em>{{product.name}}</em>
							</h4></td>
							<td class="col-md-1" style="text-align: center">1</td>
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
				<div class="panel panel-default">
					<div class="panel-heading">Add product:</div>
					<div class="panel-body">
						<form class="form-inline">
							<div class="form-group" class="form-inline">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-pushpin"> Name:</span></span> 
									<input type="text" class="form-control" id="name" ng-model="enteredName" placeholder="Name">
								</div>
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-usd"> Value:</span></span> 
									<input type="text" class="form-control" id="name" ng-model="enteredValue" placeholder="Value">
								</div>
								<button ng-click="addProduct()" class="btn btn-default"	id="addProduct">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>				
		</div>
		<div class="panel panel-default" ng-show='bills.length > 0'>
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon glyphicon-list"></span> Bills
				</h3>
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