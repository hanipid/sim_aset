<div class="row">
	{% for a in akun %}
		<div class="col-md-4">
			<a href="#" onclick="loadList({{a.idak}})" data-dismiss="modal" data-toggle="modal" data-target="#listModal" class="btn btn-default btn-block">{{a.nama|upper}}</a>
		</div>
	{% endfor %}
</div>