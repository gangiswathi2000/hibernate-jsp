<!DOCTYPE html>
<html>
<head>


<title>submit details</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/9e363b886a.js"></script>
<style type="text/css">
td {
	padding: 20px;
	font-family: Georgia, serif;
}

div {
	margin-top: 200px;
}

h3 {
	text-align: center;
}
.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
</style>
</head>
<body style="background-color: #C6F1E7">

	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #F4F9F9;">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a style="color: black"
				class="nav-link" href="Index.jsp"><strong>Home</strong></a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Actions</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="Index.jsp">Add</a></li>
					<li><a class="dropdown-item" href="getbyid.jsp">GetById</a></li>
					<li><a class="dropdown-item" href="GetAll.jsp">GetAll</a></li>
				</ul></li>
		</ul>

		<form class="form-inline my-2 my-lg-0"></form>

		<a href="Home.jsp">
			<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
		</a>
	</nav>
	<div align="center" class="fixed-top">
		<h3>Enter the details</h3>
		<br> <br>
		<form action="register.jsp" method="post">
			<table>
				<tr>
					<td>Id</td>
					<td><input class="form-control-sm" placeholder="@1"
						type="text" name="id" required /></td>
				</tr>

				<tr>
					<td>First name</td>
					<td><input class="form-control-sm" placeholder="@Rohit"
						type="text" name="fname" required /></td>
				</tr>
				<tr>
					<td>Last name</td>
					<td><input class="form-control-sm" placeholder="@Sharma"
						type="text" name="lname" required /></td>
				</tr>

			</table>
			<br> <br> <input type="submit"
				class="button" value="Save" />
		</form>
	</div>
</body>
</html>