{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">
    	<a href="{{url('pengadaan_barang/edit/'~id_tmp_kontrak)}}"><span class="glyphicon glyphicon-chevron-left"></span></a>List Data Barang
    </h3>
  </div>
  <div class="panel-body" style="padding:0 15px;">
  	<div class="" style="position: -webkit-sticky;position: sticky;top:0px;background:#FFF; padding:8px 0;">
			<div class="">
		  	<form method="get" action="">
		        {% if keywords != null or keywords != '' %}
				    <input type="text" class="form-control input-sm" id="keywords" name="keywords" value ="{{keywords}}" placeholder="Cari...">
		        {% else %}
		        <input type="text" class="form-control input-sm" id="keywords" name="keywords" placeholder="Cari...">
		        {% endif %}
		  	</form>
		  </div>
			<table class="table table-condensed" style="margin-bottom:0">
				<thead>
					<tr>
						<th width="20" class="text-center">#</th>
						<th>Kode Aset</th>
						<th width="240">Nomor Sertifikat</th>
						<th width="240">Tanggal Sertifikat</th>
					</tr>
				</thead>
			</table>
		</div>

		<table class="table table-condensed">
			<tbody>
				{% for kib_a in paginator.items %}
					<tr>
						<td>
							<a href="{{url('pengadaan_barang/editKibA/'~kib_a.id_tmp_kib_a)}}"><span class="glyphicon glyphicon-edit"></span></a>
							<a href="{{url('pengadaan_barang/deleteKibA/'~kib_a.id_tmp_kib_a)}}" style="color:#FF0000;" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini? (tidak bisa diulang)')"><span class="glyphicon glyphicon-trash"></span></a>
						</td>
						<td>{{kib_a.nama_aset}} ({{kib_a.kode_aset}})</td>
						<td width="240">{{kib_a.no_sertifikat}}</td>
						<td width="240">{{kib_a.tgl_sertifikat}}</td>
					</tr>
				{% endfor %}
			</tbody>
		</table>

	</div> <!-- .panel-body -->

</div> <!-- .panel -->