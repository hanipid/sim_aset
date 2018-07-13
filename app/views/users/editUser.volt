{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Edit User</h3>
  </div>
  <div class="panel-body">

    <form action="" class="form-horizontal">
      
      <div class="form-group">
        <label for="nama_lengkap" class="control-label col-md-3">Nama Lengkap</label>
        <div class="col-md-9">
          <input type="text" name="nama_lengkap" id="nama_lengkap" class="form-control" placeholder="Nama Lengkap" value="Agung Saputra">
        </div>
      </div>
      
      <div class="form-group">
        <label for="username" class="control-label col-md-3">Username</label>
        <div class="col-md-9">
          <input type="text" name="username" id="username" class="form-control" placeholder="Username" value="agungsaputra">
        </div>
      </div>
      
      <div class="form-group">
        <label for="password_lama" class="control-label col-md-3">Password Lama</label>
        <div class="col-md-9">
          <input type="password" name="password_lama" id="password_lama" class="form-control" placeholder="Password Lama">
        </div>
      </div>
      
      <div class="form-group">
        <label for="password_baru" class="control-label col-md-3">Password Baru</label>
        <div class="col-md-9">
          <input type="password" name="password_baru" id="password_baru" class="form-control" placeholder="Password Baru">
        </div>
      </div>
      
      <div class="form-group">
        <label for="password_2" class="control-label col-md-3">Ulangi Password</label>
        <div class="col-md-9">
          <input type="password" name="password_2" id="password_2" class="form-control" placeholder="Ulangi Password">
        </div>
      </div>
      
      <div class="form-group">
        <label for="profile" class="control-label col-md-3">Profile</label>
        <div class="col-md-9">
          <select name="profile" id="profile" class="form-control">
            <option value="1">Administrator</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <label for="user_status" class="control-label col-md-3">Status User</label>
        <div class="col-md-9">
          <select name="user_status" id="user_status" class="form-control">
            <option value="1">Aktif</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <label for="telepon" class="control-label col-md-3">No. Telepon</label>
        <div class="col-md-9">
          <input type="text" name="telepon" id="telepon" class="form-control" value="0858923829">
        </div>
      </div>
      
      <div class="form-group">
        <label for="email" class="control-label col-md-3">Email</label>
        <div class="col-md-9">
          <input type="text" name="email" id="email" class="form-control" value="agung@email.com">
        </div>
      </div>

      <div class="col-md-9 col-md-offset-3">
        <a href="{{ url('users') }}" class="btn btn-primary">Simpan</a>
      </div>

    </form>
    
  </div>
</div> <!-- .panel -->