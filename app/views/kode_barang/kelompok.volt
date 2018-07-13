{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Kode Barang</h3>
  </div>
  <div class="panel-body">
    
    <div>

      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#kelompok" aria-controls="kelompok" role="tab" data-toggle="tab">Kelompok</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="jenis" role="tab" data-toggle="tab" disabled="disabled">Jenis</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="kelompok" role="tab" data-toggle="tab" disabled="disabled">Objek</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="sub-kelompok" role="tab" data-toggle="tab" disabled="disabled">Rincian Objek</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="sub-sub-kelompok" role="tab" data-toggle="tab" disabled="disabled">Sub Rincian Objek</a></li>
        <li role="presentation"><a href="#" class="btn" aria-controls="sub-sub-kelompok" role="tab" data-toggle="tab" disabled="disabled">Sub Sub Rincian Objek</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="golongan">
          <div class="row">
            <div class="col-md-10 col-md-offset-1">
              {% for a in akun %}
                <a href="{{ url('kode_barang/jenis/3/'~a.idak) }}" class="btn btn-block btn-primary">{{ a.nama }}</a>
              {% endfor %}
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
</div> <!-- .panel -->