{{ content() }}

<form method="post" autocomplete="off" class="form-horizontal">

	<div class="form-group">
	  <label for="name" class="col-sm-2 control-label">Nama Menu</label>
	  <div class="col-sm-5">
	  	<input type="text" name="name" class="form-control" placeholder="Nama Menu">
	  </div>
	</div>

	<div class="form-group">
	  <label for="url" class="col-sm-2 control-label">URL</label>
	  <div class="col-sm-5">
	  	<input type="text" name="url" class="form-control" placeholder="controller/action">
	  </div>
	</div>


	<div class="form-group">
	  <label for="fieldParent" class="col-sm-2 control-label">Parent</label>
	  <div class="col-sm-5">
	    <select name="parent" class="form-control">
	    	<option value="0">None</option>
	    	{% for p in parent %}
	    		<option value="{{p.id}}">{{p.name}}</option>
	    	{% endfor %}
	    </select>
	  </div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">Profiles</label>
		<div class="col-sm-5">
	    {% for p in profiles %}
				<div class="checkbox">
	      	<label>
	          <input type="checkbox" name="profiles[]" value="{{p.id}}"> {{p.name}}
	        </label>
	      </div>
	    {% endfor %}
		</div>
	</div>

	<div class="form-group">
	  <div class="col-sm-offset-2 col-sm-10">
	    {{ submit_button('Save', 'class': 'btn btn-primary') }}
	  </div>
	</div>

</form>