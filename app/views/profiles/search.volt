{{ content() }}

<div class="previous pull-left">
	{{ link_to("profiles/index", "&larr; Go Back", "class": "btn btn-default") }}
</div>
<div class="pull-right">
	{{ link_to("profiles/create", "Create profiles", "class": "btn btn-primary") }}
</div>

{% for profile in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Active?</th>
		</tr>
	</thead>
{% endif %}
	<tbody>
		<tr>
			<td>{{ profile.id }}</td>
			<td>{{ profile.name }}</td>
			<td>{{ profile.active == 'Y' ? 'Yes' : 'No' }}</td>
			<td width="12%" class="text-center">{{ link_to("profiles/edit/" ~ profile.id, '<i class="icon-pencil"></i> Edit', "class": "btn btn-warning") }}</td>
			<td width="12%" class="text-center">{{ link_to("profiles/delete/" ~ profile.id, '<i class="icon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
		</tr>
	</tbody>
{% if loop.last %}
	<tbody>
		<tr>
			<td colspan="10" align="right">
				<nav aria-label="Page navigation">
          <ul class="pagination">
            <li>
              <a href='{{ url("profiles/search") }}' aria-label="First">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
              <li>
                <a href='{{ url("profiles/search/"~page.before) }}' aria-label="Previous">
                  <span aria-hidden="true">&lsaquo;</span>
                </a>
              </li>
            <li><a href="">Page {{ page.current~" from "~page.total_pages }} pages.</a></li>
            <li>
              <a href='{{ url("profiles/search/"~page.next) }}' aria-label="Next">
                <span aria-hidden="true">&rsaquo;</span>
              </a>
            </li>
            <li>
              <a href='{{ url("profiles/search/"~page.last) }}' aria-label="Last">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
			</td>
		</tr>
	<tbody>
</table>
{% endif %}
{% else %}
	No profiles are recorded
{% endfor %}
