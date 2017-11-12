<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Welcome to Vökuró</title>
		{% if dispatcher.getControllerName() == "index" OR dispatcher.getControllerName() == "session" %}
			{{ stylesheet_link('css/telisir.css') }}
			{{ stylesheet_link('css/style.css') }}
		{% else %}
			{{ stylesheet_link('css/admin-bs3.css') }}
		{% endif %}
		{{ stylesheet_link('css/jquery.smartmenus.bootstrap.css') }}
	</head>
	<body>

		{{ content() }}

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!-- SmartMenus jQuery plugin -->
		{{ javascript_include('js/jquery.smartmenus.min.js') }}
		<!-- SmartMenus jQuery Bootstrap Addon -->
		{{ javascript_include('js/jquery.smartmenus.bootstrap.min.js') }}

		<script>
		$(document).ready(function () {
			$('#sidebarCollapse').on('click', function () {
				$('#sidebar').toggleClass('active');
			});
			$('[data-toggle="tooltip"]').tooltip();
		})
		</script>
	</body>
</html>