
<div class="modal-header">
	<h3 class="modal-title">I'm a modal!</h3>
</div>
<div class="modal-body">
	<form class="form-inline">
		<div class="form-group" class="form-inline">
			<div class="input-group">
				<span class="input-group-addon"><span class="glyphicon glyphicon-pushpin"> Name:</span></span> 
				<input type="text" class="form-control" id="product.name" ng-model="product.name" placeholder="Name">
			</div>
			<div class="input-group">
				<span class="input-group-addon"><span class="glyphicon glyphicon-usd"> Value:</span></span> 
				<input type="text" class="form-control" id="product.value" ng-model="product.value" placeholder="Value">
			</div>								
		</div>
	</form>
</div>
<div class="modal-footer">
	<div class="btn-group">
		<button ng-click="ok()" class="btn btn-default glyphicon glyphicon-ok" id="addProduct">
		<button ng-click="cancel()" class="btn btn-default glyphicon glyphicon-remove" id="cancelAddProduct"></button>
	</div>
</div>