<div class="wrapper">
	<nav id="sidebar">
		<!-- Sidebar Header -->
		<div class="sidebar-header">
			<h3>Vokuro</h3>
			<strong>VKR</strong>
		</div>

		<!-- Sidebar Links -->
		<ul class="list-unstyled components">
			<li {% if value == dispatcher.getControllerName() %}class="active"{% endif %} data-toggle="tooltip" data-placement="right" data-original-title="Home">
				<a href="#homeSubmenu">
					<i class="fa fa-home"></i>
					<span class="sidebar-text">Home</span>
				</a>
			</li>
			<li {% if value == dispatcher.getControllerName() %}class="active"{% endif %} data-toggle="tooltip" data-placement="right" data-original-title="Settings">
				<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">
					<i class="fa fa-cog"></i>
					<span class="sidebar-text">Settings</span>
				</a>
				<ul class="collapse list-unstyled" id="pageSubmenu">
					<li {% if value == dispatcher.getControllerName() %}class="active"{% endif %}><a href="{{ url('users') }}">Users</a></li>
					<li {% if value == dispatcher.getControllerName() %}class="active"{% endif %}><a href="{{ url('profiles') }}">Profiles</a></li>
					<li {% if value == dispatcher.getControllerName() %}class="active"{% endif %}><a href="{{ url('permissions') }}">Permissions</a></li>
				</ul>
			</li>
		</ul>
	</nav>

	<div id="content">
		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container-fluid">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<button type="button" id="sidebarCollapse" class="btn btn-primary navbar-btn">
						<i class="fa fa-bars"></i>
					</button>
				</div>

				<div class="collapse navbar-collapse" id="target-collapse">
{#
					<ul class="nav navbar-nav">

						{%- set menus = [
							'Home': null,
							'Settings': [
								'Users': 'users',
								'Profiles': 'profiles',
								'Permissions': 'permissions'
							]
						] -%}

						{%- macro drawMenu(menus = 0) %}
							{%- for key, value in menus %}
								<li {% if value == dispatcher.getControllerName() %}class="active"{% endif %}>
							{%- if value is type('array') %}
								<a href="#">{{ key }} <b class="caret"></b></a>
								<ul class="dropdown-menu">
									{{ drawMenu(value) }}
								</ul>
							{% else %}
								<a href="{{ url(value) }}">{{ key }}</a>
							{%- endif %}
							</li>

							{%- endfor %}
						{%- endmacro %}

						{{ drawMenu(menus) }}

					</ul>
#}
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ auth.getName() }} <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>{{ link_to('users/changePassword', 'Change Password') }}</li>
							</ul>
						</li>
						<li>{{ link_to('session/logout', 'Logout') }}</li>
					</ul>
				</div><!-- /navbar-collapse -->

			</div><!-- /container-fluid -->
		</nav>

		<div class="container-fluid">
			{{ content() }}
		</div>
	</div>
</div>