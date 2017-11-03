<!DOCTYPE html>
<html>
	<head>
		<title>Welcome to Vökuró</title>
		<link href="//netdna.bootstrapcdn.com/bootswatch/3.3.7/cosmo/bootstrap.min.css" rel="stylesheet">
		{{ stylesheet_link('css/jquery.smartmenus.bootstrap.css') }}
		{{ stylesheet_link('css/style.css') }}
	</head>
	<body>

		{{ content() }}

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
		<!-- SmartMenus jQuery plugin -->
		{{ javascript_include('js/jquery.smartmenus.min.js') }}
		<!-- SmartMenus jQuery Bootstrap Addon -->
		{{ javascript_include('js/jquery.smartmenus.bootstrap.min.js') }}

		<script>
		$(document).ready(function () {
		})
		</script>
	</body>
</html>