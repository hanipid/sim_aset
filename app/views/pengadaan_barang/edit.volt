{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Pengadaan Barang</h3>
  </div>
  <div class="panel-body">
	  <form class="form-horizontal" method="post">
	  	<div class="form-group">
	  		<label for="" class="col-md-3 control-label">Nomor Kontrak</label>
	  		<div class="col-md-9">
	  			<input type="text" name="nomor_kontrak" class="form-control" placeholder="Nomor Kontrak" value="{{tmp_kontrak.no}}">
	  		</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="" class="col-md-3 control-label">Tanggal</label>
	  		<div class="col-md-3">
	  			<input type="date" name="tanggal" class="form-control" placeholder="Tanggal" value="{{tmp_kontrak.tgl}}">
	  		</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="" class="col-md-3 control-label">Nilai Kontrak</label>
	  		<div class="col-md-9">
	  			<input type="text" name="nilai_kontrak" class="form-control" placeholder="Nilai Kontrak" value="{{tmp_kontrak.nilai_kontrak}}">
	  		</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="" class="col-md-3 control-label">Sumber Dana</label>
	  		<div class="col-md-9">
	  			<input type="text" name="sumber_dana" class="form-control" placeholder="Sumber Dana" value="{{tmp_kontrak.dana}}">
	  		</div>
	  	</div>
	  	<div class="form-group">
	  		<div class="col-md-9 col-md-offset-3">
	  			<button type="submit" class="btn btn-primary">Simpan</button>
	  		</div>
	  	</div>
	  </form>

	  <hr>

	  {% for ak in aset_kategori %}
	  	<div class="col-md-4"><a href="#" onclick="loadModelLevel2({{ak.akun_id}})" class="btn btn-block btn-lg" style="background:{{ak.bg}};" data-toggle="modal" data-target="#level2">{{ak.label}}</a></div>
	  {% endfor %}
  </div> <!-- .panel-body -->
</div>

<div class="modal fade" id="level2" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <div id="demo-modal"></div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="listModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <div id="load-list"></div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
  function loadModelLevel2(akun_id) {
    $('#demo-modal').load('{{ url("pengadaan_barang/level3/") }}'+akun_id);
  }

  function loadList(idak) {
  	alert(idak)
  	$("#load-list").load('{{ url("pengadaan_barang/listAkun/") }}'+idak)
  }
</script>