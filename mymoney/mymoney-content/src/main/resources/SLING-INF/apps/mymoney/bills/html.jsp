<%@ include file="/apps/slingdemo/global.jsp"%>
<!DOCTYPE html>
<html lang="en" ng-app="myMoneyApp">
<head>
<title>Add bills</title>
<sling:include resource="<%=resource %>" replaceSelectors="head" />
</head>
<body>
	<sling:include resource="<%=resource %>" replaceSelectors="menu" />
	<div class="jumbotron">
		<div class="container">
			<h1>Add bills</h1>
			<p>Here you can add some bills</p>
			<p>
				Since it's a Sling demo - here is a path to this resource:
				<code><%=resource.getPath() %></code>
			</p>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Bill</h3>
				</div>
				<div class="panel-body">
					<form class="form-inline" role="form">
						<div class="form-group">
							<label for="name">Name</label> <input type="text" class="form-control" id="name" placeholder="Name">
						</div>
						<div class="form-group date">
							<label for="date">Date</label> <input type="text" data-date-format="dd/mm/yy" class="form-control" id="cost" placeholder="Date">
						</div>						
						<button type="submit" class="btn btn-default" id="createBill">Submit</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>