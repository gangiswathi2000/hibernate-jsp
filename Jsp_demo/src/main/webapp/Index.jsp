<!DOCTYPE html>
<html>
<head>
<%@page import="com.demo.mypackage.StoreData"%>
<jsp:useBean id="obj" class="com.demo.mypackage.Employee">
</jsp:useBean>
<jsp:setProperty property="*" name="obj" />

<title>submit details</title>

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
}.icon{
margin-left: 1650px;
}
.but3{
margin-left:1750px;
}
</style>
</head>
<body style="background-color: #C6F1E7">

	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #F4F9F9;">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a style="color: black"
				class="nav-link" href="servlet"><strong>Home</strong></a></li>
			</ul>
					
		<form class="form-inline my-2 my-lg-0"></form>
<ul  class="navbar-nav mr-auto but3">
		<li><a href="Home.jsp">
			<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
		</a></li>
		</ul>
	</nav>
	<div align="center" class="fixed-top">
		<h3>Enter the details</h3>
		<br> <br>
		<form action="fetch" method="Post">
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
				name="saved" class="button" value="Save" />
		</form>
	</div>
</body>
</html>