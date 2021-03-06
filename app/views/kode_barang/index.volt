{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Kode Barang</h3>
  </div>
  <div class="panel-body" style="padding:0 15px;">
		<div class="" style="position: -webkit-sticky;position: sticky;top:0px;background:#FFF; padding:8px 0;">
			<div class="">
		  	<form method="get" action="">
		  		<div class="form-group">
		        {% if keywords != null or keywords != '' %}
				    <input type="text" class="form-control input-sm" id="keywords" name="keywords" value ="{{keywords}}" placeholder="Cari...">
		        {% else %}
		        <input type="text" class="form-control input-sm" id="keywords" name="keywords" placeholder="Cari...">
		        {% endif %}
		      </div>
		  	</form>
		  </div>
		</div>
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th class="text-center"><a href="#" data-toggle="modal" data-target="#modalTambahAkun"><span class="glyphicon glyphicon-plus"></span></a></th>
					<th width="70" class="text-center">Akun</th>
					<th width="70" class="text-center">Kelompok</th>
					<th width="70" class="text-center">Jenis</th>
					<th width="70" class="text-center">Objek</th>
					<th width="70" class="text-center">Rincian Objek</th>
					<th width="70" class="text-center">Sub Rincian Objek</th>
					<th width="70" class="text-center">Sub Sub Rincian Objek</th>
					<th>Uraian</th>
				</tr>
			</thead>
			<tbody>
				{#{ drawMenu(akun) }#}
				{% for vkb in paginator.items %}
					<tr
          {% if vkb.level == 1 %}
            style="background:#4F8AFF; font-weight:700;"
          {% elseif vkb.level == 2 %}
            style="background:#6FA2FF; font-weight:700;"
          {% elseif vkb.level == 3 %}
            style="background:#8EBAFF; font-weight:700;"
          {% elseif vkb.level == 4 %}
            style="background:#AED1FF; font-weight:700;"
          {% elseif vkb.level == 5 %}
            style="background:#CDE9FF; font-weight:700;"
          {% elseif vkb.level == 6 %}
            style="background:#E8FFFF; font-weight:700;"
          {% endif %} >
						<td class="text-center">
							{% if vkb.level < 7 %}<a href="#" onclick="loadModalTambah('{{vkb.kode}}')" data-toggle="modal" data-target="#modalTambah"><span class="glyphicon glyphicon-plus"></span></a>&nbsp;{% endif %}
							<a href="#" onclick="loadDynamicContentModal('{{vkb.kode}}')" data-toggle="modal" data-target="#modalEdit"><span class="glyphicon glyphicon-edit"></span></a>
						</td>
						<td class="text-center">{{ vkb.kode_level1 }}</td>
						<td class="text-center">{{ vkb.kode_level2 }}</td>
						<td class="text-center">{{ vkb.kode_level3 }}</td>
						<td class="text-center">{{ vkb.kode_level4 }}</td>
						<td class="text-center">{{ vkb.kode_level5 }}</td>
						<td class="text-center">{{ vkb.kode_level6 }}</td>
						<td class="text-center">{{ vkb.kode_level7 }}</td>
						<td>{{ vkb.nama|upper }}</td>
					</tr>
				{% endfor %}
			</tbody>
		</table>

		<nav aria-label="Page navigation" style="position: -webkit-sticky;position: sticky;bottom:0px;background:#FFF;">
		  {% if paginator.total_pages > 1 %}
			  {% if keywords != null or keywords != '' %}
			  	{% set keywords = "keywords=" ~ keywords %}
			  {% endif %}

			  {% set controller = this.view.getControllerName()|lower  %}
			  {% set action = this.view.getActionName()|lower %}
			  {% set startIndex = 1 %}
			  {% if paginator.total_pages > 5 %}
			    {% if paginator.current > 3 %}
			        {% set startIndex = startIndex + paginator.current - 3 %}
			    {% endif %}
			    {% if paginator.total_pages - paginator.current < 5 %}
			        {% set startIndex = paginator.total_pages - 4 %}
			    {% endif %}
			  {% endif %}
		    <ul class="pagination pagination-sm m-t-none m-b-none">
		        {% if paginator.current > 1 %}
		            <li>{{ link_to(controller ~ '/' ~ action ~ '?' ~ keywords, 'data-page' : paginator.first, '<i class="fa fa-angle-double-left"></i>', 'title' : 'Go to page ' ~ paginator.next) }}</li>
		        {% endif %}
		        {% for pageIndex in startIndex..paginator.total_pages %}
		            {% if pageIndex is startIndex + 5 %}
		                {% break %}
		            {% endif %}

		            <li {% if pageIndex is paginator.current %}class="active"{% endif %}>
		                {{ link_to(controller ~ '/' ~ action ~ '?p=' ~ pageIndex ~ '&' ~ keywords, pageIndex, 'data-page' : pageIndex, 'title' : 'Go to page ' ~ pageIndex) }}
		            </li>
		        {% endfor %}

		        {% if paginator.current < paginator.total_pages %}
		            <li>{{ link_to(controller ~ '/' ~ action ~ '?p=' ~ paginator.last ~ '&' ~ keywords, 'data-page' : paginator.last, '<i class="fa fa-angle-double-right"></i>', 'title' : 'Go to page ' ~ paginator.last) }}</li>
		        {% endif %}
		    </ul>
		  {% endif %}
		</nav>
	</div> <!-- .panel-body -->
</div> <!-- .panel.panel-primary -->

<div class="modal fade" id="modalTambahAkun" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Buat Kode Barang</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="formCreateKode" method="post" action="{{url('kode_barang/createKode/')}}">
         	<div class="form-group">
            <label for="kode" class="col-sm-3 control-label">Kode</label>
            <div class="col-sm-9">
              <input type="hidden" class="form-control" name="parentLevel" id="parentLevel" placeholder="Level" value="0">
              <div class="input-group">
                <input type="text" class="form-control" name="kode" id="kode" placeholder="Kode">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="nama" class="col-sm-3 control-label">Uraian</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="nama" id="nama" placeholder="Uraian">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Buat Kode Barang</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="formCreateKode" method="post" action="{{url('kode_barang/createKode/')}}">
          <div id="load-tambah"></div>
      </div>
      <div class="modal-footer">
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
        <h4 class="modal-title">Edit Kode Barang</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="formEditKode">
          <div id="load-edit"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
  function loadModalTambah(kode) {
    var options = {
      modal : true,
      height : 300,
      width : 500
    };
    $('#load-tambah').load('{{ url("kode_barang/createKode/") }}'+kode);
  }
  $("#formEditKode").submit(function(e){
  	let $form 			= $(this), 
  			idak 				= $('input[name=idak_edit]').val(),
  			kodeRanting	= $('input[name=kodeRanting_edit]').val(),
  			kodeDaun		= $('input[name=kodeDaun_edit]').val(),
      	level       = $('select[name=level_edit]').val(),
        parent      = $('select[name=parent_edit]').val(),
  			nama				= $('input[name=nama_edit]').val(),
  			url					= "{{url('kode_barang/editKode/"+kodeRanting+"."+kodeDaun+"')}}",
  			data 				= {
  				idak:idak,
  				kode:kodeDaun,
  				level:level,
  				parent:parent,
  				nama:nama
  			};
    alert(level+parent);
  	$.post(url,data).done(function(){
  		$('#modalEdit').modal('toggle');
  		window.location = "{{url('kode_barang')}}";
		});
		e.preventDefault();
  });
  function loadDynamicContentModal(kode) {
    var options = {
      modal : true,
      height : 300,
      width : 500
    };
    $('#load-edit').load('{{ url("kode_barang/editKode/") }}'+kode);
  }
</script>