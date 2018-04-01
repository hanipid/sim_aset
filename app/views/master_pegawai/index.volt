{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Master Pegawai</h3>
  </div>
  <div class="panel-body">
    
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

    <br>

    <div class="row">
      <div class="col-md-12">
        
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Nama</th>
              <th>NIP</th>
              <th>Alamat</th>
              <th>Telp.</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>Agung Saputra</td>
              <td>987109273917</td>
              <td>Jl. Anggrek No.23</td>
              <td>08123456789</td>
              <td>
                <a href="{{ url('master_pegawai/edit') }}" class="btn btn-primary btn-sm">Detail</a>
              </td>
            </tr>
            <tr>
              <td>Agung Saputra</td>
              <td>987109273917</td>
              <td>Jl. Anggrek No.23</td>
              <td>08123456789</td>
              <td>
                <a href="#" class="btn btn-primary btn-sm">Detail</a>
              </td>
            </tr>
            <tr>
              <td>Agung Saputra</td>
              <td>987109273917</td>
              <td>Jl. Anggrek No.23</td>
              <td>08123456789</td>
              <td>
                <a href="#" class="btn btn-primary btn-sm">Detail</a>
              </td>
            </tr>
            <tr>
              <td>Agung Saputra</td>
              <td>987109273917</td>
              <td>Jl. Anggrek No.23</td>
              <td>08123456789</td>
              <td>
                <a href="#" class="btn btn-primary btn-sm">Detail</a>
              </td>
            </tr>
            <tr>
              <td>Agung Saputra</td>
              <td>987109273917</td>
              <td>Jl. Anggrek No.23</td>
              <td>08123456789</td>
              <td>
                <a href="#" class="btn btn-primary btn-sm">Detail</a>
              </td>
            </tr>
            <tr>
              <td>Agung Saputra</td>
              <td>987109273917</td>
              <td>Jl. Anggrek No.23</td>
              <td>08123456789</td>
              <td>
                <a href="#" class="btn btn-primary btn-sm">Detail</a>
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
</div> <!-- .panel -->

<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form class="form-horizontal">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Tambah Data Pegawai</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="nip" class="col-sm-3 control-label">NIP</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="nip" placeholder="NIP">
            </div>
          </div>
          <div class="form-group">
            <label for="nama_pegawai" class="col-sm-3 control-label">Nama Pegawai</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="nama_pegawai" placeholder="Nama Pegawai">
            </div>
          </div>
          <div class="form-group">
            <label for="alamat" class="col-sm-3 control-label">Alamat</label>
            <div class="col-sm-9">
              <textarea class="form-control" id="alamat" placeholder="Alamat"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label for="no_telepon" class="col-sm-3 control-label">No. Telepon</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="no_telepon" placeholder="No. Telepon">
            </div>
          </div>
          <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="email" placeholder="Email">
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