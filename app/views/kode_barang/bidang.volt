{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Kode Barang</h3>
  </div>
  <div class="panel-body">
    
    <div>

      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="{{ url('kode_barang/golongan') }}" class="btn">Golongan</a></li>
        <li role="presentation" class="active"><a href="#" class="btn" aria-controls="bidang" role="tab" data-toggle="tab">Bidang</a></li>
        <li role="presentation"><a href="#" class="btn" disabled="disabled" aria-controls="kelompok" role="tab" data-toggle="tab">Kelompok</a></li>
        <li role="presentation"><a href="#" class="btn" disabled="disabled" aria-controls="sub-kelompok" role="tab" data-toggle="tab">Sub Kelompok</a></li>
        <li role="presentation"><a href="#" class="btn" disabled="disabled" aria-controls="sub-sub-kelompok" role="tab" data-toggle="tab">Sub Sub Kelompok</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="bidang">
          <div class="pull-right">
            <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalTambah">Tambah</a>
          </div>
          <div class="row">
            <div class="col-md-8 col-md-offset-1">
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
            <div class="col-md-6">
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-primary">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning" data-toggle="modal" data-target="#modalEdit">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-success">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-info">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-warning">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-danger">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>                          
              
            </div>
            <div class="col-md-6">
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-o-primary">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-o-success">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-o-info">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-o-warning">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>              
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/kelompok') }}" class="btn btn-block btn-o-danger">Tanah</a>
                </div>
                <div class="col-xs-2">
                  <a href="" class="btn btn-warning">Edit</a>
                </div>
              </div>                          
              
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
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
</div>

<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Tambah Bidang</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="form-group">
            <label for="kode" class="col-sm-2 control-label">Kode</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="kode" placeholder="Kode">
            </div>
          </div>
          <div class="form-group">
            <label for="nama_bidang" class="col-sm-2 control-label">Nama Bidang</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nama_bidang" placeholder="Nama Bidang">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Bidang</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="form-group">
            <label for="kode" class="col-sm-2 control-label">Kode</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="kode" placeholder="Kode" value="1">
            </div>
          </div>
          <div class="form-group">
            <label for="nama_bidang" class="col-sm-2 control-label">Nama Bidang</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nama_bidang" placeholder="Nama Bidang" value="Tanah">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->