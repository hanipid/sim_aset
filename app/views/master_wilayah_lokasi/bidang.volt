{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Data Kepemilikan</h3>
  </div>
  <div class="panel-body">

    <div>

      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#bidang" class="btn" aria-controls="bidang" role="tab" data-toggle="tab">Bidang</a></li>
        <li role="presentation"><a href="#unitBidang" class="btn" aria-controls="unitBidang" role="tab" data-toggle="tab" disabled>Unit Bidang</a></li>
        <li role="presentation"><a href="#subUnit" class="btn" aria-controls="subUnit" role="tab" data-toggle="tab" disabled>Sub Unit/Satuan Kerja</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="bidang">
          <div class="pull-right">
            <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalTambah">Tambah</a>
          </div>
          <div class="row">
            <div class="col-md-9 col-md-offset-1">
              <form action="">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                  </span>
                </div>
              </form>
            </div>
          </div> <!-- .row -->

          <div class="row">
            <div class="col-md-12">
              
              <table class="table table-condensed">
                <thead>
                  <tr>
                    <th>Kode</th>
                    <th>Nama Bidang</th>
                    <th></th>
                  </tr>
                </thead>

                <tbody>
                  <tr onclick="pindah()">
                    <td>01</td>
                    <td>SEKWAN/DPRD</td>
                    <td>
                      <a href="{{ url('master_wilayah_lokasi/editBidang') }}" class="btn btn-primary btn-sm">Edit</a>
                    </td>
                  </tr>
                  <tr>
                    <td>02</td>
                    <td></td>
                    <td>
                      <a href="{{ url('master_wilayah_lokasi/editBidang') }}" class="btn btn-primary btn-sm">Edit</a>
                    </td>
                  </tr>
                  <tr>
                    <td>03</td>
                    <td></td>
                    <td>
                      <a href="{{ url('master_wilayah_lokasi/editBidang') }}" class="btn btn-primary btn-sm">Edit</a>
                    </td>
                  </tr>
                  <tr>
                    <td>04</td>
                    <td></td>
                    <td>
                      <a href="{{ url('master_wilayah_lokasi/editBidang') }}" class="btn btn-primary btn-sm">Edit</a>
                    </td>
                  </tr>
                  <tr>
                    <td>05</td>
                    <td></td>
                    <td>
                      <a href="{{ url('master_wilayah_lokasi/editBidang') }}" class="btn btn-primary btn-sm">Edit</a>
                    </td>
                  </tr>
                  <tr>
                    <td>06</td>
                    <td></td>
                    <td>
                      <a href="{{ url('master_wilayah_lokasi/editBidang') }}" class="btn btn-primary btn-sm">Edit</a>
                    </td>
                  </tr>
                </tbody>
              </table>

              <nav aria-label="Page navigation">
                <ul class="pagination">
                  <li>
                    <a href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li>
                    <a href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>

            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
</div> <!-- .panel -->

<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form class="form-horizontal">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Input Bidang</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="kode" class="col-sm-3 control-label">Kode</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="kode" placeholder="Kode">
            </div>
          </div>
          <div class="form-group">
            <label for="nama_bidang" class="col-sm-3 control-label">Nama Bidang</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="nama_bidang" placeholder="Nama Bidang">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
  function pindah() {
    document.location.href = "{{ url('master_wilayah_lokasi/unitBidang') }}";
  }
</script>