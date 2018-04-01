{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Edit Kota/Kabupaten</h3>
  </div>
  <div class="panel-body">
    
    <form class="form-horizontal">
      <div class="form-group">
        <label for="kode" class="col-sm-3 control-label">Kode</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" id="kode" placeholder="Kode" value="01">
        </div>
      </div>
      <div class="form-group">
        <label for="nama_kota_kab" class="col-sm-3 control-label">Nama Kota/Kabupaten</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" id="nama_kota_kab" placeholder="Nama Kota/Kabupaten" value="Kabupaten Aceh Besar">
        </div>
      </div>
      <a href="{{ url('master_wilayah_lokasi/kabupaten') }}" type="button" class="btn btn-primary">Save changes</a>
    </form>

  </div>
</div>