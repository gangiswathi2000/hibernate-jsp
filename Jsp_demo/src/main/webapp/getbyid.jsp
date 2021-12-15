
<%@page import="com.demo.mypackage.StoreData"%>
<%@page import="com.demo.mypackage.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="ISO-8859-1">
<title>id</title>
<style type="text/css">
body {
	background-color: #B9CCED;
	text-align: center;
	margin: 100px;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
	margin: 100px;
	margin-left: 50px;
}

td, th {
	border: 1px solid #000000;
	text-align: center;
	padding: 8px;
}

th {
	background-color: #DAF1F9;
}

.cls {
	font-family: Georgia, serif;
}

.btn {
	border: 2px solid #555555;
}
</style>
</head>
<body><%
	
	boolean isLoggedIn = (request.getSession().getAttribute("admin") == null) ? false : true;



	if (!isLoggedIn) {
		System.out.println("logged out");
	response.sendRedirect("Home.jsp");
	}
	
	%>
	<form action="adding">
		<br> <strong>Id: </strong> <input class="form-control-sm cls"
			type="text" name="id" required> <br> <br> <input
			class="btn btn-secondary btn" type="submit" value="submit"> <br>
		<%
		String res = (String) request.getAttribute("res");
		if ("true".equals(res)) {
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			Employee o = StoreData.getbyid(id);
			if (o == null) {
		%>
		<h3 style="text-align: center; margin:-200px;">
			<font color=red>Id not found!</font>
		</h3>
		<%
		} else {
		%>
		<table>
			<tr>
				<th>Id</th>
				<th>Fname</th>
				<th>Fname</th>
			</tr>
			<tr>
				<td><%=o.getId()%></td>
				<td><%=o.getFname()%></td>
				<td><%=o.getLname()%></td>
			</tr>
		</table>
		<%
		}
		}
		%>

	</form>

</body>
</html>