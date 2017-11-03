{{ content() }}

<div align="center" class="well">

	{{ form('class': 'form-search') }}

	<div align="left">
		<h2>Forgot Password?</h2>
	</div>

    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        {{ form.render('email') }}
        {{ form.render('Send') }}
      </div>
    </div>

		<hr>

	</form>

</div>