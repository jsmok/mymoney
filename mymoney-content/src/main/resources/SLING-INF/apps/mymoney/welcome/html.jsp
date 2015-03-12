<%@ include file="/apps/mymoney/global.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<title>Welcome to my money!</title>
  	<sling:include resource="<%=resource %>" replaceSelectors="head"/>
  </head>
  <body>
	<sling:include resource="<%=resource %>" replaceSelectors="menu"/>
  	<div class="jumbotron">
      <div class="container">
    	<h1>Welcome to MyMoney!</h1>
		<p>A demo project for Apache Sling framework.</p>
		<p>Since it's a Sling demo - here is a path to this resource: <code><%=resource.getPath() %></code></p>
		<p><a href="http://sling.apache.org/" class="btn btn-primary" role="button">Learn more &raquo;</a></p>
		<p><a href="./bills.html" class="btn btn-primary" role="button">Add some bills! &raquo;</a></p>
      </div>
    </div>
  </body>
</html>