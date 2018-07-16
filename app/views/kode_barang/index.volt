{{ content() }}

{%- macro drawMenu(menus = 0) %}

  {%- for menu in menus %}
  	<tr>
  	{%  set haveChildren = menu.getChilds() %}
  	<td>{{ menu.kdak }}</td>
  	<td>
  		{% if menu.level == 2 %}
  			{{ menu.kdak }}
  		{% endif %}
  	</td>
  	<td>
  		{% if menu.level == 3 %}
  			{{ menu.kdak }}
  		{% endif %}</td>
  	<td>
  		{% if menu.level == 4 %}
  			{{ menu.kdak }}
  		{% endif %}</td>
  	<td>
  		{% if menu.level == 5 %}
  			{{ menu.kdak }}
  		{% endif %}</td>
  	<td>
  		{% if menu.level == 6 %}
  			{{ menu.kdak }}
  		{% endif %}
  	</td>
  	<td>
  		{% if menu.level == 7 %}
  			{{ menu.kdak }}
  		{% endif %}</td>
  	<td>{{ menu.nama }}</td>
  	<td>{{ menu.idak }}</td>
  	<td>{{ menu.kdak }}</td>
  	<td>{{ menu.parent }}</td>
    {%- if haveChildren %}
    	<tr>
    		{{ drawMenu(menu.getChilds()) }}
    	</tr>
    {%- endif %}
    </tr>
  {%- endfor %}
{%- endmacro %} 

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Kode Barang</h3>
  </div>
  <div class="panel-body">
  	<form method="get" action="">
  		<div class="form-group">
		    <input type="text" class="form-control input-sm" id="keywords" name="keywords" placeholder="Cari...">
		  </div>
  	</form>
		<table class="table table-condensed">
			<thead>
				<tr>
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
					<tr>
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

		<nav aria-label="Page navigation">
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