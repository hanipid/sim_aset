{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">
    	Pengadaan Barang
    </h3>
  </div>
  <div class="panel-body">
  	<form class="form-horizontal" method="post" name="createKibA">
  		<div class="form-group">
  			<label class="control-label col-md-3">Luas Tanah (m²)</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="luas_tanah" placeholder="Luas Tanah (m²)">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Letak Alamat</label>
  			<div class="col-md-9">
  				<textarea class="form-control" name="alamat" placeholder="Alamat"></textarea>
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Status Tanah</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="status_tanah" placeholder="Status Tanah">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Tanggal Sertifikat</label>
  			<div class="col-md-3">
  				<input type="date" class="form-control" name="tanggal_sertifikat" placeholder="Tanggal Sertifikat">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Nomor Sertifikat</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="nomor_sertifikat" placeholder="Nomor Sertifikat">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Penggunaan</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="penggunaan" placeholder="Penggunaan">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Nilai Perolehan</label>
  			<div class="col-md-9">
  				<input type="numeric" class="form-control" name="nilai_perolehan" placeholder="Nilai Perolehan">
  			</div>
  		</div>
      <div class="form-group">
        <label class="control-label col-md-3">Nilai Realisasi</label>
        <div class="col-md-9">
          <input type="numeric" class="form-control" name="nilai_realisasi" placeholder="Nilai Realisasi">
        </div>
      </div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Keterangan</label>
  			<div class="col-md-9">
  				<textarea class="form-control" name="keterangan" placeholder="Keterangan"></textarea>
  			</div>
  		</div>
  		<div class="form-group">
  			<div class="col-md-3 col-md-offset-3">
  				<input type="hidden" name="id_tmp_kontrak" value="{{id_tmp_kontrak}}">
  				<input type="hidden" name="idak" value="{{idak}}">
  				<input type="hidden" name="jumlah" value="{{jumlah}}">
  				<input type="hidden" name="is_new" value="1">
  				<button type="submit" class="btn btn-primary">Simpan</button>
  			</div>
  		</div>
  	</form>
  </div> <!-- .panel-body -->
</div> <!-- .panel -->