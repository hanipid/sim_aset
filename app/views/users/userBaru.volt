{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Input User Baru</h3>
  </div>
  <div class="panel-body">

    <form action="" class="form-horizontal">
      
      <div class="form-group">
        <label for="nama_lengkap" class="control-label col-md-3">Nama Lengkap</label>
        <div class="col-md-9">
          <input type="text" name="nama_lengkap" id="nama_lengkap" class="form-control" placeholder="Nama Lengkap">
        </div>
      </div>
      
      <div class="form-group">
        <label for="username" class="control-label col-md-3">Username</label>
        <div class="col-md-9">
          <input type="text" name="username" id="username" class="form-control" placeholder="Username">
        </div>
      </div>
      
      <div class="form-group">
        <label for="password" class="control-label col-md-3">Password</label>
        <div class="col-md-9">
          <input type="password" name="password" id="password" class="form-control" placeholder="Password">
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
        <label for="telepon" class="control-label col-md-3">No. Telepon</label>
        <div class="col-md-9">
          <input type="text" name="telepon" id="telepon" class="form-control" placeholder="No. Telepon">
        </div>
      </div>
      
      <div class="form-group">
        <label for="email" class="control-label col-md-3">Email</label>
        <div class="col-md-9">
          <input type="text" name="email" id="email" class="form-control" placeholder="Email">
        </div>
      </div>

      <div class="col-md-9 col-md-offset-3">
        <a href="{{ url('users') }}" class="btn btn-primary">Simpan</a>
      </div>

    </form>
    
  </div>
</div> <!-- .panel -->