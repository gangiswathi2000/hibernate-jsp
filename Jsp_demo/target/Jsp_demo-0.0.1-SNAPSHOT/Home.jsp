<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color:#D6E5FA;
}

.form-signin {
	max-width: 330px;
	max-height:700px;
	padding: 15px;
	margin: 0 auto;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0px 0px 10px #000;
}

.form-signin-heading {
	text-align: center;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[name="admin"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<form class="form-signin" role="form"
			action="adding"
			method="post">
			<h2 class="form-signin-heading">Login</h2>
			<input name="admin" type="text" class="form-control"
				placeholder="Username" required autofocus /> <input name="pass"
				type="password" class="form-control" placeholder="Password" required />
			<button class="btn btn-lg btn-primary btn-block" type="submit">Log
				in</button>
		</form>
	</div>
	<!-- /container -->
</body>
</body>
</html>