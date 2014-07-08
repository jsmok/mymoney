<%@ include file="/apps/slingdemo/global.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<title>Welcome to my money!</title>
  	<sling:include resource="<%=resource %>" replaceSelectors="head"/>
  </head>
  <body>  
  	<div class="jumbotron">
      <div class="container">
    	<h1>Welcome to MyMoney!</h1>
		<p>A demo project for Apache Sling framework.</p>
		<p>Since it's a Sling demo - here is a path to this resource: <code><%=resource.getPath() %></code></p>
		<p><a href="http://sling.apache.org/" class="btn btn-primary" role="button">Learn more &raquo;</a></p>
      </div>
    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/content/mymoney/assets/js/bootstrap.min.js"></script>
    
    <!-- Angular -->
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular.min.js"></script>
  </body>
</html>