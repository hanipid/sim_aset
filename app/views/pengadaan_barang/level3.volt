<div class="row">
	{% for a in akun %}
		<div class="col-md-4">
			<a href="{{url('pengadaan_barang/listAkun/'~a.idak)}}" class="btn btn-default btn-block">{{a.nama|upper}}</a>
		</div>
	{% endfor %}
</div>