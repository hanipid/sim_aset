{{ content() }}

<div class="previous pull-left">
	{{ link_to("users/index", "&larr; Go Back", "class": "btn btn-default") }}
</div>
<div class="pull-right">
	{{ link_to("users/create", "Create users", "class": "btn btn-primary") }}
</div>

{% for user in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>Profile</th>
			<th>Banned?</th>
			<th>Suspended?</th>
			<th>Confirmed?</th>
		</tr>
	</thead>
{% endif %}
	<tbody>
		<tr>
			<td>{{ user.id }}</td>
			<td>{{ user.name }}</td>
			<td>{{ user.email }}</td>
			<td>{{ user.profile.name }}</td>
			<td>{{ user.banned == 'Y' ? 'Yes' : 'No' }}</td>
			<td>{{ user.suspended == 'Y' ? 'Yes' : 'No' }}</td>
			<td>{{ user.active == 'Y' ? 'Yes' : 'No' }}</td>
			<td width="12%" class="text-center">{{ link_to("users/edit/" ~ user.id, '<i class="icon-pencil"></i> Edit', "class": "btn btn-warning") }}</td>
			<td width="12%" class="text-center">{{ link_to("users/delete/" ~ user.id, '<i class="icon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
		</tr>
	</tbody>
{% if loop.last %}
	<tbody>
		<tr>
			<td colspan="10" align="right">
				<nav aria-label="Page navigation">
          <ul class="pagination">
            <li>
              <a href='{{ url("users/search") }}' aria-label="First">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
              <li>
                <a href='{{ url("users/search/"~page.before) }}' aria-label="Previous">
                  <span aria-hidden="true">&lsaquo;</span>
                </a>
              </li>
            <li><a href="">Page {{ page.current~" from "~page.total_pages }} pages.</a></li>
            <li>
              <a href='{{ url("users/search/"~page.next) }}' aria-label="Next">
                <span aria-hidden="true">&rsaquo;</span>
              </a>
            </li>
            <li>
              <a href='{{ url("users/search/"~page.last) }}' aria-label="Last">
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
	No users are recorded
{% endfor %}
