<div class="page-header">
	<h1>Search result</h1>
</div>

{{ content() }}

<div class="row">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Id</th>
			<th>Name</th>
			<th>Parent</th>
			<th>Type</th>

				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		{% if page.items is defined %}
		{% for categorie in page.items %}
			<tr>
				<td>{{ categorie.id }}</td>
			<td>{{ categorie.name }}</td>
			<td>{{ categorie.parent }}</td>
			<td>{% if categorie.type == 1 %}Post{% else %}Product{% endif %}</td>

				<td>{{ link_to("categories/edit/"~categorie.id, "Edit", "class":"btn btn-warning") }}</td>
				<td>{{ link_to("categories/delete/"~categorie.id, "Delete", "class":"btn btn-danger", "onclick":"return confirm('Are you sure?')") }}</td>
			</tr>
		{% endfor %}
		{% endif %}
		</tbody>
	</table>
</div>

<div class="row">
	<div class="col-sm-1">
		<p class="pagination" style="line-height: 1.42857;padding: 6px 12px;">
			{{ page.current~"/"~page.total_pages }}
		</p>
	</div>
	<div class="col-sm-11">
		<nav aria-label="Page navigation">
      <ul class="pagination">
        <li>
          <a href='{{ url("categories/search") }}' aria-label="First">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
          <li>
            <a href='{{ url("categories/search/"~page.before) }}' aria-label="Previous">
              <span aria-hidden="true">&lsaquo;</span>
            </a>
          </li>
        <li><a href="">Page {{ page.current~" from "~page.total_pages }} pages.</a></li>
        <li>
          <a href='{{ url("categories/search/"~page.next) }}' aria-label="Next">
            <span aria-hidden="true">&rsaquo;</span>
          </a>
        </li>
        <li>
          <a href='{{ url("categories/search/"~page.last) }}' aria-label="Last">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
	</div>
</div>
