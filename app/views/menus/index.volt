{{ content() }}

{%- macro print_menu_level(menu_level_items) %}

    {%- for menu_item in menu_level_items %}

        {% set next_menu_level_items = menu_item.getChilds() %}
        {% set isParents = menu_item.isParents() %}
        {% if loop.first %}
          {% if menu_item.parent == 0 %}
            <ol class="nav_menu_list">
          {% else %}
            <ol>
          {% endif %}
        {% endif %}

        <li data-id="{{ menu_item.id }}">


          <div class="row">
    				<div class="col-md-8">
    					{% if menu_item.parent == 0 %}
                  <i class="fa fa-arrows"></i>
              {% endif %}
              {{ menu_item.name }} 
              {% set menu_profiles = explode(',' , menu_item.profiles) %}
              <!-- {% for p in menu_profiles %} -->
                {% for p2 in profiles %}
                  <!-- {% if p == p2.id %} -->
                    {{p2.name}}
                  <!-- {% endif %} -->
                {% endfor %}
              <!-- {% endfor %} -->
    				</div>

    				<div class="col-md-4">
              {% if !next_menu_level_items %}
                  <a href="#" class="btn btn-danger cek" id="{{menu_item.id}}" cek="0">Delete</a>
              {% endif %}
    					<a href="{{ url('nav_menu/edit/'~menu_item.id) }}" class="btn btn-warning">Edit</a>
    				</div>
    			</div>

          {% if next_menu_level_items %}
              {{ print_menu_level(next_menu_level_items) }}
          {% endif %}

        </li>

        {% if loop.last %}
          </ol>
        {% endif %}

    {%- endfor %}

{%- endmacro %}

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">Menu Sidebar</h3>
      </div>
      <div class="panel-body">
        <!-- Button trigger modal -->
        <a href="{{ url('menus/create') }}" class="btn btn-primary btn-xs">
          <i class="fa fa-plus"></i> Add
        </a>
        {{ print_menu_level(menu_sidebar) }}
      </div>
    </div>
  </div>
</div>


<script>
/**
* JQUERY SORTABLE
**/
$(function  () {
	// nav_menu_list
	var group = $("ol.nav_menu_list").sortable({
		group: 'nav_menu_list',
		delay: 500,
		onDrop: function ($item, container, _super) {
			var data = group.sortable("serialize").get();
			var sorted = [];

			$('.nav_menu_list li').each(function(){
				sorted.push($(this).data('id'));
			});

			var jsonString = JSON.stringify(data, null, ' ');

			$.ajax({
				data: {id:sorted},
				type: 'POST',
				url: "{{url('menus/order')}}",
				success	: function(response){
					$("body").html(response);
				},
				fail : function(){
					alert("Gagal");
				}
			});
			_super($item, container);
		}
	});
});
</script>