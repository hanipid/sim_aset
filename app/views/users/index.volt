{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Setting Users</h3>
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
              <th>Username</th>
              <th>Profile</th>
              <th>Telepon</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            <tr onclick="pindah()">
              <td>Imron Sadewa</td>
              <td>imron</td>
              <td>Super User</td>
              <td>0856789123</td>
              <td>
                <a href="{{ url('users/editUser') }}" class="btn btn-primary btn-sm">Edit</a>
              </td>
            </tr>
            <tr onclick="pindah()">
              <td>Imron Sadewa</td>
              <td>imron</td>
              <td>Super User</td>
              <td>0856789123</td>
              <td>
                <a href="{{ url('users/editUser') }}" class="btn btn-primary btn-sm">Edit</a>
              </td>
            </tr>
            <tr onclick="pindah()">
              <td>Imron Sadewa</td>
              <td>imron</td>
              <td>Super User</td>
              <td>0856789123</td>
              <td>
                <a href="{{ url('users/editUser') }}" class="btn btn-primary btn-sm">Edit</a>
              </td>
            </tr>
            <tr onclick="pindah()">
              <td>Imron Sadewa</td>
              <td>imron</td>
              <td>Super User</td>
              <td>0856789123</td>
              <td>
                <a href="{{ url('users/editUser') }}" class="btn btn-primary btn-sm">Edit</a>
              </td>
            </tr>
            <tr onclick="pindah()">
              <td>Imron Sadewa</td>
              <td>imron</td>
              <td>Super User</td>
              <td>0856789123</td>
              <td>
                <a href="{{ url('users/editUser') }}" class="btn btn-primary btn-sm">Edit</a>
              </td>
            </tr>
            <tr onclick="pindah()">
              <td>Imron Sadewa</td>
              <td>imron</td>
              <td>Super User</td>
              <td>0856789123</td>
              <td>
                <a href="{{ url('users/editUser') }}" class="btn btn-primary btn-sm">Edit</a>
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
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Tambah User</h4>
      </div>
      <div class="modal-body text-center">
        <a href="{{ url('users/userBaru') }}" class="btn btn-lg btn-default">User Baru</a>
        <a href="#" class="btn btn-lg btn-default" data-toggle="modal" data-target="#modalData">Data Pegawai</a>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modalData" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">List Data Pegawai</h4>
      </div>
      <div class="modal-body text-center" style="max-height: 500px; overflow-x: auto;">
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
                  <th>Nama</th>
                  <th>NIP</th>
                  <th></th>
                </tr>
              </thead>

              <tbody>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
                <tr onclick="pindah()">
                  <td>Agung</td>
                  <td>98172937917401</td>
                  <td>
                    <a href="{{ url('users/tambahUserDataPe') }}" class="btn btn-primary btn-sm">Pilih</a>
                  </td>
                </tr>
              </tbody>
            </table>

          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- <div class="row">
  <div class="col-md-6 col-md-offset-3">
    <div align="right">
      {{ link_to("users/create", "<i class='icon-plus-sign'></i> Create Users", "class": "btn btn-primary") }}
    </div>

    <form class="form" method="post" action="{{ url("users/search") }}" autocomplete="off">

      <div class="center">

        <h2>Search users</h2>

        <div class="clearfix">
          <label for="id">Id</label>
          {{ form.render("id") }}
        </div>

        <div class="clearfix">
          <label for="name">Name</label>
          {{ form.render("name") }}
        </div>

        <div class="clearfix">
          <label for="email">E-Mail</label>
          {{ form.render("email") }}
        </div>

        <div class="clearfix">
          <label for="profilesId">Profile</label>
          {{ form.render("profilesId") }}
        </div>

        <div class="clearfix">
          {{ submit_button("Search", "class": "btn btn-primary") }}
        </div>

      </div>

    </form>
  </div>
</div> -->