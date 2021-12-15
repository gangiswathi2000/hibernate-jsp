<%@page import="com.demo.mypackage.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update details</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">	
	
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/9e363b886a.js"></script>
<style type="text/css">
body
{
color:black;
background-color:#B1D0E0;
}
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
	background-color: #5584AC;
	box-shadow: #84DFFF;
	color: #fff;
	transform: translateY(-7px);
}
.icon {
	margin-left: 1680px;
}
</style>
</head>
<body><%
	
	boolean isLoggedIn = (request.getSession().getAttribute("admin") == null) ? false : true;
	if (!isLoggedIn) {
	response.sendRedirect("Home.jsp");
	}
	%>
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
					<li><a class="dropdown-item" href="servlet">GetAll</a></li>
				</ul></li>
		</ul>

		<form class="form-inline my-2 my-lg-0"></form>

		<a href="Home.jsp">
			<button class="btn btn-outline-danger my-2 my-sm-0 icon" type="submit">Logout</button>
		</a>
	</nav>
	<%
	Employee e = (Employee) session.getAttribute("user");
	%>
	<form action="updateServlet" method="post">
	<div align="center" class="fixed-top">
		<h3>Edit details</h3>
		<br> <br>

		<table>
			<tr>
				<td>Id</td>
				<td><input class="form-control-sm" placeholder="@1" type="text"
				  value=<%=e.getId() %> disabled="disabled"	name="id" required /></td>
			</tr>

			<tr>
				<td>First name</td>
				<td><input class="form-control-sm" placeholder="@Rohit"
					value=<%=e.getFname()%>	 type="text" name="fname" required /></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input class="form-control-sm" placeholder="@Sharma"
					value=<%=e.getLname()%> type="text" name="lname" required /></td>
			</tr>

		</table>
		<br> <br> <input name="update_details"  type="submit" class="button" value="Save" />
	</div>
	</form>

</body>
</html>