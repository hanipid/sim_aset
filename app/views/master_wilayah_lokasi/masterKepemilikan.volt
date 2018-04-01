{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Data Kepemilikan</h3>
  </div>
  <div class="panel-body">

    <br>

    <div class="row">
      <div class="col-md-12">
        
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Kode</th>
              <th>Kepemilikan</th>
            </tr>
          </thead>

          <tbody>
            <tr onclick="pindah()">
              <td>12</td>
              <td>Kabupaten / Kota</td>
            </tr>
            <tr>
              <td>11</td>
              <td>Provinsi</td>
            </tr>
            <tr>
              <td>00</td>
              <td>Pusat</td>
            </tr>
          </tbody>
        </table>

      </div>
    </div>

  </div>
</div> <!-- .panel -->

<script>
  function pindah() {
    document.location.href = "{{ url('master_wilayah_lokasi/provinsi') }}";
  }
</script>