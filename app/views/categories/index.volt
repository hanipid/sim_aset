
{{ content() }}

{%- macro print_menu_level(menu_level_items) %}

  {%- for menu_item in menu_level_items %}

    {% if loop.first %}
      <ol class="categories_list">
    {% endif %}

    {% if menu_item.id == 0 %}
      <li data-id="{{ menu_item.id }}">

        <div class="row">
          <div class="col-md-8">
            {{ menu_item.name }}
          </div>

          <div class="col-md-4">
          </div>
        </div>

      </li>
    {% else %}
      <li data-id="{{ menu_item.id }}" {% if modul.status == 0 %}class="danger"{% elseif modul.status == 2 %}class="success"{% elseif modul.plugin_module == 1 %}class="warning"{% endif %} {% if modul.level == 2 %} style="color:rgba(0,100,100,0.9)" {% endif %}>

        <div class="row">
          <div class="col-md-12">
            {{ menu_item.name }}

            <div class="pull-right">
              <a href="{{ url('categories/edit/'~menu_item.type~'/'~menu_item.id) }}" class="btn btn-xs btn-warning">Edit</a>
              <a href="{{ url('categories/delete/'~menu_item.id) }}" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
            </div>
          </div>
        </div>

        {% set next_menu_level_items = menu_item.getChilds() %}
        {% if next_menu_level_items %}
          {{ print_menu_level(next_menu_level_items) }}
        {% endif %}

      </li>
    {% endif %}



    {% if loop.last %}
      </ol>
    {% endif %}

  {%- endfor %}

{%- endmacro %}

<div class="row">
  <div class="col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Post Categories</h3>
      </div>
      <div class="panel-body">
        <!-- Button trigger modal -->
        <a href="{{ url('categories/create/1') }}" class="btn btn-primary btn-xs">
          <i class="fa fa-plus"></i> Add
        </a>
        {{ print_menu_level(post_categories) }}
      </div>
    </div>
  </div>
  <div class="col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Product Categories</h3>
      </div>
      <div class="panel-body">
        <!-- Button trigger modal -->
        <a href="{{ url('categories/create/2') }}" class="btn btn-primary btn-xs">
          <i class="fa fa-plus"></i> Add
        </a>
        {{ print_menu_level(product_categories) }}
      </div>
    </div>
  </div>
</div>
