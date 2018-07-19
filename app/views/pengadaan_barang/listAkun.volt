<form action="">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search">
    <span class="input-group-btn">
      <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
    </span>
  </div>
</form>
{{akun.kdak}}
<table>
	<thead>
		<tr>
			<th>#</th>
			<th>KODE</th>
			<th>NAMA</th>
		</tr>
	</thead>

	<tbody>
		{% for vkb in VKodeBarang %}
			<tr>
				<td></td>
				<td>{{vkb.kode}}</td>
				<td>{{vkb.nama}}</td>
			</tr>
		{% endfor %}
	</tbody>
</table>