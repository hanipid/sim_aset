{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Edit Sub Unit</h3>
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
        <label for="nama_sub_unit" class="col-sm-3 control-label">Nama Sub Unit</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" id="nama_sub_unit" placeholder="Nama Sub Unit" value="Sekretaris">
        </div>
      </div>
      <a href="{{ url('master_wilayah_lokasi/subUnit') }}" type="button" class="btn btn-primary">Save changes</a>
    </form>

  </div>
</div>