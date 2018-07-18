{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Aset Kategori</h3>
  </div>
  <div class="panel-body">

  	<a href="#" class="btn btn-default" onclick="loadDynamicContentModal('{{vkb.kode}}')" data-toggle="modal" data-target="#modalCreate"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

		<table class="table table-condensed">
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th class="text-center">Akun Aset</th>
					<th class="text-center">Label</th>
					<th class="text-center">Background</th>
				</tr>
			</thead>
			<tbody>
				{#{ drawMenu(akun) }#}
				{% for ak in asetKategori %}
					<tr>
						<td class="text-center">
							<a href="#" onclick="loadEditModal('{{ak.id_aset_kategori}}')" data-toggle="modal" data-target="#modalEdit"><span class="glyphicon glyphicon-edit"></span></a>
						</td>
						<td class="text-center">{{ ak.akun.nama }}</td>
						<td class="text-center">{{ ak.label|upper }}</td>
						<td class="text-center"><button class="btn" style="background-color:{{ ak.bg }};"></button></td>
					</tr>
				{% endfor %}
			</tbody>
		</table>

  </div> <!-- .panel-body -->
</div> <!-- .panel.panel-primary -->


<div class="modal fade" id="modalCreate" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Tambah Aset Kategori</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="formEditKode" method="post">
          <div id="load-create">
          	<div class="form-group">
	            <label for="akun_aset" class="col-sm-3 control-label">Akun Aset</label>
	            <div class="col-sm-9">
	            	<select class="form-control" id="akun_aset" name="akun_aset">
	            		{% for akn in akun %}
	            			<option value="{{ akn.idak }}">{{ akn.nama }}</option>
	            		{% endfor %}
	            	</select>
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="label" class="col-sm-3 control-label">Label</label>
	            <div class="col-sm-9">
	              <input type="text" class="form-control" name="label" id="label" placeholder="Label">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="background" class="col-sm-3 control-label">Background</label>
	            <div class="col-sm-2">
	              <input type="color" class="form-control" name="background" id="background" placeholder="Background">
	            </div>
	          </div>
          </div>
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="is_new" value="1">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
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
        <h4 class="modal-title">Edit Aset Kategori</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="formEditKode" method="post">
          <div id="load-edit">
          	
          </div>
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="is_edit" value="1">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
function loadEditModal($id) {
	$("#load-edit").load("{{ url('aset_kategori/edit/') }}"+$id);
}
</script>