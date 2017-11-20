<div class="wrapper">
	<nav id="sidebar">
		<!-- Sidebar Header -->
		<div class="sidebar-header">
			<h3>Vokuro</h3>
			<strong>V</strong>
		</div>

		<!-- Sidebar Links -->
		<ul class="list-unstyled components">
			<li data-toggle="tooltip" data-placement="right" data-original-title="Home">
				<a href="#homeSubmenu">
					<i class="fa fa-home"></i>
					<span class="sidebar-text">Home</span>
				</a>
			</li>
			<li data-toggle="tooltip" data-placement="right" data-original-title="Posts">

				<a href="#postsSubmenu" data-toggle="collapse" {% if dispatcher.getControllerName() == "posts" %}aria-expanded="true"{% else %}aria-expanded="false"{% endif %}>
					<i class="fa fa-file-text"></i>
					<span class="sidebar-text">Posts</span>
				</a>

				<ul id="postsSubmenu" {% if dispatcher.getControllerName() == "posts" %}aria-expanded="true" class="collapse in list-unstyled"{% else %}aria-expanded="false" class="collapse list-unstyled"{% endif %}>

					<li {% if dispatcher.getControllerName() == "posts" and dispatcher.getActionName() == "index" %}class="active"{% endif %}>
						<a href="{{ url('posts/index') }}">All Posts</a>
					</li>

					<li {% if dispatcher.getControllerName() == "posts" and dispatcher.getActionName() == "create" %}class="active"{% endif %}>
						<a href="{{ url('posts/new') }}">New Post</a>
					</li>

				</ul>
			</li>
			<li data-toggle="tooltip" data-placement="right" data-original-title="Categories" {% if dispatcher.getControllerName() == "categories" %}class="active"{% endif %}>

				<a href="{{ url('categories') }}">
					<i class="fa fa-tags"></i>
					<span class="sidebar-text">Categories</span>
				</a>

			</li>
			<li data-toggle="tooltip" data-placement="right" data-original-title="Settings">

				<a href="#pageSubmenu" data-toggle="collapse" {% if dispatcher.getControllerName() == "basic_settings" or dispatcher.getControllerName() == "users" or dispatcher.getControllerName() == "profiles" or dispatcher.getControllerName() == "permissions" %}aria-expanded="true"{% else %}aria-expanded="false"{% endif %}>
					<i class="fa fa-cog"></i>
					<span class="sidebar-text">Settings</span>
				</a>

				<ul id="pageSubmenu" {% if dispatcher.getControllerName() == "basic_settings" or dispatcher.getControllerName() == "users" or dispatcher.getControllerName() == "profiles" or dispatcher.getControllerName() == "permissions" %}aria-expanded="true" class="collapse in list-unstyled"{% else %}aria-expanded="false" class="collapse list-unstyled"{% endif %}>

					<li {% if "basic_settings" == dispatcher.getControllerName() %}class="active"{% endif %}>
						<a href="{{ url('basic_settings') }}">Basic</a>
					</li>

					<li {% if "users" == dispatcher.getControllerName() %}class="active"{% endif %}>
						<a href="{{ url('users') }}">Users</a>
					</li>

					<li {% if "profiles" == dispatcher.getControllerName() %}class="active"{% endif %}>
						<a href="{{ url('profiles') }}">Profiles</a>
					</li>

					<li {% if "permissions" == dispatcher.getControllerName() %}class="active"{% endif %}>
						<a href="{{ url('permissions') }}">Permissions</a>
					</li>

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
			<div class="notif"><?php $this->flashSession->output() ?></div>
			{{ content() }}
		</div>
	</div>
</div>