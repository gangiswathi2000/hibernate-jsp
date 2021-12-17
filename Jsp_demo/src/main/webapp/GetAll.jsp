<%@page import="com.demo.mypackage.StoreData"%>
<%@page import="com.demo.mypackage.Employee"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- JavaScript Bundle with Popper -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/9e363b886a.js"></script>
<meta charset="ISO-8859-1">
<title>GetAllDetails</title>
<style type="text/css">
body {
	background-color: #E1E5EA;
}

.button-73 {
	appearance: none;
	background-color: #FFFFFF;
	border-radius: 40em;
	border-style: none;
	box-shadow: #98BAE7 0 -12px 6px inset;
	box-sizing: border-box;
	color: #000000;
	cursor: pointer;
	display: inline-block;
	font-family: -apple-system, sans-serif;
	font-size: 1.2rem;
	font-weight: 700;
	letter-spacing: -.24px;
	margin: 0;
	outline: none;
	padding: 1rem 1.3rem;
	quotes: auto;
	text-align: center;
	text-decoration: none;
	transition: all .15s;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.button-73:hover {
	background-color: #F7F7F7;
	box-shadow: #98BAE7 0 -6px 8px inset;
	transform: scale(1.125);
}

table {
	margin-top: 200px;
	margin-left: 450px;
	font-family: arial, sans-serif;
	color: black;
	border-collapse: collapse;
	width: 50%;
}

.icon {
	margin-left: 1650px;
}

tr {
	color: black;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #F4F9F9;
}

td, th {
	border: 1.2px solid #ddd;
	text-align: center;
	color: #000000;
	padding: 6px;
}

th {
	background-color: #ddd;
	color: black;
}

.button-73:active {
	transform: scale(1.025);
}

@media ( min-width : 768px) {
	.button-73 {
		font-size: 1.0rem;
		padding: .75rem 2rem;
	}
}
</style>
</head>
<body>
	<%
	boolean isLoggedIn = (request.getSession().getAttribute("admin") == null) ? false : true;
	if (!isLoggedIn) {
		System.out.println("logged out");
	response.sendRedirect("Home.jsp");
	}
	%>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i class="far fa-user-circle"></i>
				Dashboard</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a style="cursor: pointer;"
						class="nav-link" href="Index.jsp" title="click to save!"><i class="fas fa-user-plus"></i> Save </a></li>
					<li class="nav-item"><a style="cursor: pointer;"
						class="nav-link" title="click to edit!" onclick="editFun()"><i
							class="fas fa-user-edit "></i> Edit </a></li>
					<li class="nav-item"><a style="cursor: pointer;"
						class="nav-link" title="click to delete!" onclick="deleteFun()"><i
							class="fas fa-user-minus "></i> Delete</a></li>
							<li class="nav-item"><a style="cursor: pointer;"
						class="nav-link" title="click to undo!" onclick="undoFun()"><i class="fas fa-trash-restore-alt"></i> Undo </a></li>
				</ul>
			</div>
			<form class="form-inline my-2 my-lg-0">
				<input title="Search!" onkeyup="myFunction()"
					class="form-control mr-sm-2" type="text" id="myInput"
					placeholder="Search by Id" aria-label="Search">
				&nbsp;&nbsp;&nbsp;
			</form>
			<a href="LogoutController">
				<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">
					Logout</button>
			</a>
		</div>

	</nav>
	<form id="perform" method="post">
		<%
		String ans = (String) request.getAttribute("getall");
		if ("true".equals(ans)) {
			List<Employee> l = StoreData.getAll();
		%>
		<table id="mytable">
			<tr>
				<th></th>
				<th>Id</th>
				<th>Fname</th>
				<th>Lname</th>
			</tr>
			<%
			for (Employee e : l) {
			%>
			<tr>
				<td><input class="check" type="checkbox" name="names"
					value=<%=e.getId()%>></td>
				<td><%=e.getId()%></td>
				<td><%=e.getFname()%></td>
				<td><%=e.getLname()%></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>
		<!--  <button class="btn btn-outline-danger" id="delete" name="delete"  type="submit" >
			<i class="far fa-trash-alt"></i>
		</button>
		<button class="btn btn-outline-dark mod" name="update" type="submit" >
			<i class="fas fa-edit"></i>
		</button>-->
	</form>
	<script type="text/javascript">
		function deleteFun() {
			document.getElementById("perform").action = "delete?act=del";
			document.getElementById("perform").submit();
		}
		function editFun() {
			document.getElementById("perform").action = "delete?act=edit";
			document.getElementById("perform").submit();
		}
		function undoFun() {
			document.getElementById("perform").action = "delete?act=del&act1=undo";
			document.getElementById("perform").submit();
		}
		function myFunction() {
			var filter, table, tr, td, i, txtValue;
			filter = document.getElementById("myInput").value;
			table = document.getElementById("mytable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>
</html>