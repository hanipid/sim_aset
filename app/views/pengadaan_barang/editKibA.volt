{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">
    	Ubah Data Pengadaan Barang
    </h3>
  </div>
  <div class="panel-body">
  	<form class="form-horizontal" method="post">
  		<div class="form-group">
  			<label class="control-label col-md-3">Luas Tanah (m²)</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="luas_tanah" placeholder="Luas Tanah (m²)" value="{{kib_a.luas}}">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Letak Alamat</label>
  			<div class="col-md-9">
  				<textarea class="form-control" name="alamat" placeholder="Alamat">{{kib_a.letak}}</textarea>
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Status Tanah</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="status_tanah" placeholder="Status Tanah" value="{{kib_a.sts_tanah}}">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Tanggal Sertifikat</label>
  			<div class="col-md-3">
  				<input type="date" class="form-control" name="tanggal_sertifikat" placeholder="Tanggal Sertifikat" value="{{kib_a.tgl_sertifikat}}">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Nomor Sertifikat</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="nomor_sertifikat" placeholder="Nomor Sertifikat" value="{{kib_a.no_sertifikat}}">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Penggunaan</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="penggunaan" placeholder="Penggunaan" value="{{kib_a.penggunaan}}">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Nilai Perolehan</label>
  			<div class="col-md-9">
  				<input type="text" class="form-control" name="nilai_perolehan" placeholder="Nilai Perolehan" value="{{kib_a.nilai_perolehan}}">
  			</div>
  		</div>
  		<div class="form-group">
  			<label class="control-label col-md-3">Keterangan</label>
  			<div class="col-md-9">
  				<textarea class="form-control" name="keterangan" placeholder="Keterangan">{{kib_a.ket}}</textarea>
  			</div>
  		</div>
  		<div class="form-group">
  			<div class="col-md-3 col-md-offset-3">
  				<button type="submit" class="btn btn-primary">Simpan</button>
  			</div>
  		</div>
  	</form>
  </div> <!-- .panel-body -->
</div> <!-- .panel -->