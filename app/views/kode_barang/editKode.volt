<div class="form-group">
  <label for="toggleChangeParent" class="col-sm-3 control-label">Change Parent</label>
  <div class="col-sm-9">
      <input id="toggleChangeParent" type="checkbox" autocomplete="off">
      <div class="notif"></div>
  </div>
</div>
<div id="changeParent" style="display:none">
  <div class="form-group">
    <label for="level_edit" class="col-sm-3 control-label">Level</label>
    <div class="col-sm-9">
      <select name="level_edit" id="level_edit" onchange="changeParentsList(this.value - 1)">
        <option value="2" {% if VKodeBarang.level == 2 %}selected{% endif %}>Akun</option>
        <option value="3" {% if VKodeBarang.level == 3 %}selected{% endif %}>Kelompok</option>
        <option value="4" {% if VKodeBarang.level == 4 %}selected{% endif %}>Jenis</option>
        <option value="5" {% if VKodeBarang.level == 5 %}selected{% endif %}>Objek</option>
        <option value="6" {% if VKodeBarang.level == 6 %}selected{% endif %}>Rincian Objek</option>
        <option value="7" {% if VKodeBarang.level == 7 %}selected{% endif %}>Sub Rincian Objek</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="parent_edit" class="col-sm-3 control-label">Parent</label>
    <div class="col-sm-9">
      <select name="parent_edit" id="parent_edit">
        {% for cp in cariParent %}
          <option value="{{cp.idak}}" kode="{{cp.kode}}" {% if cp.idak == VKodeBarang.parent %}selected{% endif %}>{{cp.nama}}</option>
        {% endfor %}
      </select>
    </div>
  </div>
</div>
<div class="form-group">
  <label for="kode" class="col-sm-3 control-label">Kode</label>
  <div class="col-sm-9">
    <input type="hidden" class="form-control" name="idak_edit" id="idak_edit" placeholder="Kode" value="{{ VKodeBarang.idak }}">
    <!-- <input type="hidden" class="form-control" name="level_edit" id="level_edit" placeholder="Level" value="'.$level.'">  -->
    <input type="hidden" class="form-control" name="kodeRanting_edit" id="kodeRanting_edit" placeholder="Kode Ranting" value="{{ kodeRanting }}">
    <div class="input-group">
    {% if VKodeBarang.level > 1 %}
      <span class="input-group-addon kode_ranting">{{ kodeRanting }}. </span>
    {% endif %}
    <input type="text" class="form-control" name="kodeDaun_edit" id="kodeDaun_edit" placeholder="Kode" value="{{ kodeDaun }}">
    </div>
  </div>
</div>
<div class="form-group">
  <label for="nama" class="col-sm-3 control-label">Uraian</label>
  <div class="col-sm-9">
    <input type="text" class="form-control" name="nama_edit" id="nama_edit" placeholder="Uraian" value="{{ VKodeBarang.nama }}">
  </div>
</div>
<div class="form-group">
  <div class="col-sm-9 col-sm-offset-3">
    <a href="#" class="btn btn-danger btn-sm deleteKode" onclick="return confirm(\'Apakah Anda yakin?\')">Delete</a>
    <div class="notif2"></div>
  </div>
</div>

<script>
function changeParentsList(level) {
  $.ajax({
    type: "post",
    url: "{{url('kode_barang/cariParents/')}}",
    dataType: "json",
    data: {level:level},
    success: function (response) {
      console.log(response);
      $("#parent_edit option").remove();
      for (var i = response.length - 1; i >= 0; i--) {
        $("#parent_edit").append($("<option></option>")
          .attr("value", response[i].idak)
          .attr("kode", response[i].kode)
          .text(response[i].nama));
      }
      // auto ganti kode ranting sesuai parent yang dipilih
      $(".kode_ranting").html($('option:selected', "#parent_edit").attr("kode") + '.');
    }
  });
}

// auto ganti kode ranting sesuai parent yang dipilih
$("#parent_edit").change(function () {
  $(".kode_ranting").html($('option:selected', "#parent_edit").attr("kode") + '.');
});

$("#toggleChangeParent").on("click", function () {
  let idak = "{{VKodeBarang.idak}}"
  $.ajax({
    type: "post",
    url: "{{url('kode_barang/cekPenggunaanKode/')}}",
    dataType: "json",
    data: {idak:idak},
    success: function (response) {
      console.log(response);
      if (response != 1) {
        if ($("#toggleChangeParent").prop("checked")) {
          $("#changeParent").show();
        } else {
          $("#changeParent").hide();
        }
      } else {
        $(".notif").html("Tidak bisa diubah. Kode ini sedang digunakan di catatan pengadaan barang.").show().fadeOut( 5000 );
      }
    }
  });
});

$(".deleteKode").on("click", function () {
  let idak = "{{VKodeBarang.idak}}"
  $.ajax({
    type: "post",
    url: "{{url('kode_barang/cekPenggunaanKode/')}}",
    dataType: "json",
    data: {idak:idak},
    success: function (response) {
      console.log(response);
      if (response == 1) {
        $(".notif2").html("Tidak bisa menghapus kode ini, sedang digunakan di catatan pengadaan barang.").show().fadeOut( 5000 );
      } else if (response == 2) {
        $(".notif2").html("Tidak bisa menghapus kode ini, sedang digunakan sebagai parent.").show().fadeOut( 5000 );
      } else {
        let c = confirm("Apakah Anda yakin?");
        if (c) {
          window.location = "{{url('kode_barang/deleteKode/'~VKodeBarang.idak)}}";
        }
      }
    }
  });
});
</script>