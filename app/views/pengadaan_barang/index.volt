{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Data Barang Belum Teregister</h3>
  </div>
  <div class="panel-body" style="padding:0 15px;">
  	<div class="" style="position: -webkit-sticky;position: sticky;top:0px;background:#FFF; padding:8px 0;">
			<div class="">
		  	<form method="get" action="">
		        {% if keywords != null or keywords != '' %}
				    <input type="text" class="form-control input-sm" id="keywords" name="keywords" value ="{{keywords}}" placeholder="Cari...">
		        {% else %}
		        <input type="text" class="form-control input-sm" id="keywords" name="keywords" placeholder="Cari...">
		        {% endif %}
		  	</form>
		  </div>
			<table class="table table-condensed" style="margin-bottom:0">
				<thead>
					<tr>
						<th width="20" class="text-center">#</th>
						<th width="240">Nomor Kontrak</th>
						<th width="240">Tanggal Kontrak</th>
						<th width="240">Sumber Dana</th>
						<th width="80">Jumlah Barang</th>
					</tr>
				</thead>
			</table>
		</div>

		<table class="table table-condensed table-bordered table-hover">
			{% for tk in paginator.items %}
				<tr>
					<td width="20" class="text-center">
						<a href="{{url('pengadaan_barang/edit/'~tk.id_tmp_kontrak)}}"><span class="glyphicon glyphicon-edit"></span></a>
					</td>
					<td width="240">{{tk.no}}</td>
					<td width="240">{{tk.tgl}}</td>
					<td width="240">{{tk.dana}}</td>
					<td width="80">{{tk.jumlah_barang}}</td>
				</tr>
			{% endfor %}
		</table>



		<nav aria-label="Page navigation" style="position: -webkit-sticky;position: sticky;bottom:0px;background:#FFF;">
		  {% if paginator.total_pages > 1 %}
			  {% if keywords != null or keywords != '' %}
			  	{% set keywords = "keywords=" ~ keywords %}
			  {% endif %}

			  {% set controller = this.view.getControllerName()|lower  %}
			  {% set action = this.view.getActionName() %}
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
</div> <!-- .panel -->