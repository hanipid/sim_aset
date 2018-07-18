<div class="wrapper">
	<nav id="sidebar">
		<!-- Sidebar Header -->
		<div class="sidebar-header">
			<h3>SIM ASET</h3>
			<strong>SA</strong>
		</div>

		<!-- Sidebar Links -->
		<ul class="list-unstyled components">

			<li data-toggle="tooltip" data-placement="right" data-original-title="Home">
				<a href="#homeSubmenu">
					<i class="fa fa-home"></i>
					<span class="sidebar-text">Home</span>
				</a>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Master Pegawai" {% if dispatcher.getControllerName() == "master_pegawai" %}class="active"{% endif %}>
				<a href="{{ url('master_pegawai') }}">
					<i class="fa fa-home"></i>
					<span class="sidebar-text">Master Pegawai</span>
				</a>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Kode Barang" {% if dispatcher.getControllerName() == "kode_barang" %}class="active"{% endif %}>
				<a href="{{ url('kode_barang') }}">
					<i class="fa fa-home"></i>
					<span class="sidebar-text">Kode Barang</span>
				</a>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Aset Kategori" {% if dispatcher.getControllerName() == "aset_kategori" %}class="active"{% endif %}>
				<a href="{{ url('aset_kategori') }}">
					<i class="fa fa-list"></i>
					<span class="sidebar-text">Aset Kategori</span>
				</a>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Pengadaan Barang" {% if dispatcher.getControllerName() == "pengadaan_barang" %}class="active"{% endif %}>
				<a href="{{ url('pengadaan_barang') }}">
					<i class="fa fa-list"></i>
					<span class="sidebar-text">Pengadaan Barang</span>
				</a>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Master Kepemilikan" {% if dispatcher.getControllerName() == "master_wilayah_lokasi" %}class="active"{% endif %}>
				<a href="{{ url('master_wilayah_lokasi/masterKepemilikan') }}">
					<i class="fa fa-home"></i>
					<span class="sidebar-text">Master Kepemilikan</span>
				</a>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Posts">

				<a href="#postsSubmenu" data-toggle="collapse" {% if dispatcher.getControllerName() == "posts" %}aria-expanded="true"{% else %}aria-expanded="false"{% endif %}>
					<i class="fa fa-thumb-tack"></i>
					<span class="sidebar-text">Posts</span>
				</a>

				<ul id="postsSubmenu" {% if dispatcher.getControllerName() == "posts" %}aria-expanded="true" class="collapse in list-unstyled"{% else %}aria-expanded="false" class="collapse list-unstyled"{% endif %}>

					<li {% if dispatcher.getControllerName() == "posts" and dispatcher.getActionName() == "index" %}class="active"{% endif %}>
						<a href="{{ url('posts/index') }}">All Posts</a>
					</li>

					<li {% if dispatcher.getControllerName() == "posts" and dispatcher.getActionName() == "create" %}class="active"{% endif %}>
						<a href="{{ url('posts/create') }}">Add New</a>
					</li>

				</ul>
			</li>



			<li data-toggle="tooltip" data-placement="right" data-original-title="Pages">

				<a href="#pagesSubmenu" data-toggle="collapse" {% if dispatcher.getControllerName() == "pages" %}aria-expanded="true"{% else %}aria-expanded="false"{% endif %}>
					<i class="fa fa-file-text"></i>
					<span class="sidebar-text">Pages</span>
				</a>

				<ul id="pagesSubmenu" {% if dispatcher.getControllerName() == "pages" %}aria-expanded="true" class="collapse in list-unstyled"{% else %}aria-expanded="false" class="collapse list-unstyled"{% endif %}>
					
					<li  {% if dispatcher.getControllerName() == "pages" and dispatcher.getActionName() == "index" %}class="active"{% endif %}>
						<a href="{{ url('pages/index') }}">All Pages</a>
					</li>
					
					<li  {% if dispatcher.getControllerName() == "pages" and dispatcher.getActionName() == "create" %}class="active"{% endif %}>
						<a href="{{ url('pages/create') }}">Add New</a>
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

				<a href="#settingsSubmenu" data-toggle="collapse" {% if dispatcher.getControllerName() == "basic_settings" or dispatcher.getControllerName() == "users" or dispatcher.getControllerName() == "profiles" or dispatcher.getControllerName() == "permissions" %}aria-expanded="true"{% else %}aria-expanded="false"{% endif %}>
					<i class="fa fa-cog"></i>
					<span class="sidebar-text">Settings</span>
				</a>

				<ul id="settingsSubmenu" {% if dispatcher.getControllerName() == "setting_lokasi" or dispatcher.getControllerName() == "basic_settings" or dispatcher.getControllerName() == "users" or dispatcher.getControllerName() == "profiles" or dispatcher.getControllerName() == "permissions" %}aria-expanded="true" class="collapse in list-unstyled"{% else %}aria-expanded="false" class="collapse list-unstyled"{% endif %}>

					<li {% if "setting_lokasi" == dispatcher.getControllerName() %}class="active"{% endif %}>
						<a href="{{ url('setting_lokasi') }}">Lokasi</a>
					</li>

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
		<nav class="navbar navbar-default navbar-static-top">
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