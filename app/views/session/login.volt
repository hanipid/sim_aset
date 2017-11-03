{{ content() }}

<div align="center" class="well">

	{{ form('class': 'form-search') }}

	<div align="left">
		<h2>Log In</h2>
	</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				{{ form.render('email') }}
				{{ form.render('password') }}
				{{ form.render('go') }}
			</div>
		</div>

		<div align="center" class="remember">
			{{ form.render('remember') }}
			{{ form.label('remember') }}
		</div>

		{{ form.render('csrf', ['value': security.getToken()]) }}

		<hr>

		<div class="forgot">
			{{ link_to("session/forgotPassword", "Forgot my password") }}
		</div>

	</form>

</div>