<%@ include file="/apps/slingdemo/global.jsp"%>
<!DOCTYPE html>
<html lang="en" ng-app="myMoneyApp">
<head>
	<title>Add bills</title>
	<sling:include resource="<%=resource%>" replaceSelectors="head" />
	<script src="/content/mymoney/assets/mymoney/bills.js"></script>
</head>
<body>
	<div class="container">
		<sling:include resource="<%=resource%>" replaceSelectors="menu" />
		<div class="jumbotron">
			<h1>Add bills</h1>
			<p>Here you can add some bills</p>
			<p>
				Since it's a Sling demo - here is a path to this resource:
				<code><%=resource.getPath()%></code>
			</p>
		</div>
		<div ng-controller="billsCtrl" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-list-alt"></span> Bill
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-inline" role="form">
					<div class="input-group">
						<span class="input-group-addon">Desc:</span>
						<input type="text" class="form-control" id="desc" placeholder="Description">
					</div>
					<div class="input-group">
						<span class="input-group-addon">Date:</span>
						<input type="text" class="form-control" id="date" datepicker-popup="dd-MMMM-yyyy" ng-model="dt" is-open="opened" min-date="minDate" max-date="'2015-06-22'" datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
						<span class="input-group-btn">
			            	<button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
			            </span>
					</div>
					<button type="submit" class="btn btn-default" id="createBill">Submit</button>
				</form>
				<br>
				<table class="table table-hover">
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
	                          <td class="col-md-9"><em>{{product.name}}</em></h4></td>
	                          <td class="col-md-1" style="text-align: center"> 1 </td>
	                          <td class="col-md-1 text-center">{{product.value}}</td>
	                          <td class="col-md-1 text-center">{{product.value}}</td>
	                      </tr>
	                       <tr>
	                          <td>   </td>
	                          <td>   </td>
	                          <td class="text-right"><strong>Total: </strong></td>
	                          <td class="text-center text-danger"><strong>{{total}}</strong></td>
	                      </tr>
	                  </tbody>
	              </table>
				<form class="form-inline" role="form" ng-submit="addProduct()">
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-pushpin"> Name:</span></span>
						<input type="text" class="form-control" id="name" ng-model="enteredName" placeholder="Name">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-usd"> Value:</span></span>
						<input type="text" class="form-control" id="name" ng-model="enteredValue" placeholder="Value">
					</div>
			      	<button type="submit" class="btn btn-default" id="addProduct">Add</button>
			    </form>
			</div>				
		</div>
	</div>
</body>
</html>