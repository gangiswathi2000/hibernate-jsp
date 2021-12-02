<%@page import="com.demo.mypackage.StoreData"%>
<%@page import="com.demo.mypackage.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
	margin-left: 450px;
	font-family: arial, sans-serif;
	color: black;
	border-collapse: collapse;
	width: 50%;
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
	padding: 4px;
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
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #F4F9F9;">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="Index.jsp"><i
					class="fas fa-arrow-circle-left fa-2x"></i></a></li>
		</ul>

		<form class="form-inline my-2 my-lg-0"></form>

		<a href="Home.jsp">
			<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Exit</button>
		</a>
	</nav>
	<a href="servlet"><input style="margin: 110px; margin-left: 850px" class="button-73"
			type="submit" value="GetAll"></a>
			<%
            List<String> l_id  = (List<String>)request.getAttribute("names");
				   for(int i=0;i<l_id.size();i++)
				   {
					   int id=Integer.parseInt(l_id.get(i));
					   StoreData.delete(id);
		
				   }
			
            %>
	<form action="delete" method="post">
		<%
		String ans = (String) request.getAttribute("getall");
		if ("true".equals(ans)) {
			List<Employee> l = StoreData.getAll();
		%>
		<table>
			<tr>
				<th></th>
				<th>Id</th>
				<th>Fname</th>
				<th>Fname</th>
			</tr>
			<%
			for (Employee e : l) {
			%>
			<tr>
				<td><input type="checkbox" name="names" value=<%=e.getId()%>></td>
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
		<input type="submit" value="delete"/>
	</form>
</body>
</html>