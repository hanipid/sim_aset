{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Kode Barang</h3>
  </div>
  <div class="panel-body">
    
    <div>

      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#golongan" aria-controls="golongan" role="tab" data-toggle="tab">Golongan</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="bidang" role="tab" data-toggle="tab" disabled="disabled">Bidang</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="kelompok" role="tab" data-toggle="tab" disabled="disabled">Kelompok</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="sub-kelompok" role="tab" data-toggle="tab" disabled="disabled">Sub Kelompok</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="sub-sub-kelompok" role="tab" data-toggle="tab" disabled="disabled">Sub Sub Kelompok</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="golongan">
          <div class="row">
            <div class="col-md-10 col-md-offset-1">
              <a href="{{ url('kode_barang/bidang') }}" class="btn btn-block btn-o-primary">Golongan Tanah</a>
              <a href="{{ url('kode_barang/bidang') }}" class="btn btn-block btn-primary">Golongan Peralatan dan Mesin</a>
              <a href="{{ url('kode_barang/bidang') }}" class="btn btn-block btn-primary">Golongan Gedung dan Bangunan</a>
              <a href="{{ url('kode_barang/bidang') }}" class="btn btn-block btn-primary">Golongan Jalan, Irigasi dan Jaringan</a>
              <a href="{{ url('kode_barang/bidang') }}" class="btn btn-block btn-primary">Golongan Aset Tetap Lainnya</a>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
</div> <!-- .panel -->