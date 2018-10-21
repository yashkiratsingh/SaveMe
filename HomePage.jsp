<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SEP</title>
<link rel='stylesheet' type="text/css" href="HomePage.css">
<script>
	var divs = [ "Menu1", "Menu2", "Menu3", "Menu4", "Menu5", "Menu6",
			  ];
	var visibleDivId = null;
	function toggleVisibility(divId) {
		if (visibleDivId === divId) {
			visibleDivId = null;
		} else {
			visibleDivId = divId;
		}
		hideNonVisibleDivs();
	}
	function hideNonVisibleDivs() {
		var i, divId, div;
		for (i = 0; i < divs.length; i++) {
			divId = divs[i];
			div = document.getElementById(divId);
			if (visibleDivId === divId) {
				div.style.display = "block";
			} else {
				div.style.display = "none";
			}
		}
	}
</script>
</head>
<body>
	<div class="nav">
		<h1>SaveMe</h1>
		<ul>
			<li><a href="#" onclick="toggleVisibility('Menu6')">About Us</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu5')">Advisor
					Panel</a></li>
			<li><a>Advisor</a>
				<ul>
					<li><a href="#" onclick="toggleVisibility('Menu2')">Login</a></li>
				</ul></li>
			<li><a>User</a>
				<ul>
					<li><a href="#" onclick="toggleVisibility('Menu3')">Sign
							Up</a></li>
					<li><a href="#" onclick="toggleVisibility('Menu4')">Login</a></li>
				</ul></li>
			<li><a href="#" onclick="toggleVisibility('Menu1')">Home</a></li>
		</ul>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="body">
		<br>
		<div id="Menu1">
			<p>Helping Hand for Helpless</p>
		</div>
		<div id="Menu3" style="display: none">
			<h3>User Sign Up</h3>
				<form action="UserSignup.jsp" method="post">
			<table cellspacing="20">
					<tr>
						<td>Name: </td>
						<td><input type="text" name="name" required autofocus
							placeholder="Name"></td>
					</tr>
					<tr>
						<td>Age: </td>
						<td><input type="number" name="age" required autofocus
							placeholder="Age"></td>
					</tr>
					<tr>
						<td>Gender: </td>
						<td><input type="radio" name="gender" value="Male">Male
							<input type="radio" name="gender" value="Female">Female <input
							type="radio" name="gender" value="Other">Other</td>
					</tr>
				<tr>
					<td>Email: </td>
					<td><input type="text" name="email" required autofocus
						placeholder="Email"></td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input required autofocus type="password" name="pass"
						placeholder="Enter Password"></td>
				</tr>
				<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Sign Up"></td>
					</tr>
			</table>
				</form>
		</div>
		<div id="Menu4" style="display: none">
			<h3>User Log In</h3>
			<table cellspacing="20">
				<form action="UserLogin.jsp" method="post">
					<tr>
					<td>UserID </td>
					<td><input type="text" name="username" required autofocus
						placeholder="Email"></td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input required autofocus type="password" name="pass"
						placeholder="Password"></td>
				</tr>
				<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Log In"></td>
					</tr>
			</form>
			</table>
		</div>
				<div id="Menu2" style="display: none">
			<h3>Advisor Log In</h3>
			<table cellspacing="20">
				<form action="mailer.jsp" method="post">
					<tr>
					<td>Advisor ID: </td>
					<td><input type="text" name="email" required autofocus
						placeholder="Email"></td>
				</tr>
				 
				<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Log In"></td>
					</tr>
			</form>
			</table>
		</div>
		<div id="Menu5" style="display: none">
			<h3>Advisor Panel</h3>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection co1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st1 = co1.createStatement();

				ResultSet rs2 = st1.executeQuery("select * from exp_info");

				ResultSetMetaData rsmd2 = rs2.getMetaData();

				int columns2 = rsmd2.getColumnCount();
			%>

			<table border="2px" bordercolor="white" cellspacing="5px"
				style="border-collapse: collapse; padding: 0;">
				<tr>
					<th>Name</th>
					<th>Advisor ID</th>
					<th>Field</th>
					<th>Contact</th>
					<th>Email</th>
					<th>Organization</th>
				</tr>
				<%
					while (rs2.next()) {
						out.println("<tr>");
						for (int i = 1; i <= columns2; i++) {
							String columnName = rsmd2.getColumnName(i);

							String columnData = rs2.getString(columnName);
							out.println("<td>" + columnData + "</td>");
						}
						out.println("</tr>");
					}
					co1.close();
				%>
			</table>
		</div>
<div id="Menu6" style="display: none">
			<h2>About Us</h2>
			<h4>   
			We are here to help, counsel you, without sharing your information to anyone, feel free to ask from our experienced expert panel. <br>
			
			Email us at:- demoapi786@gmail.com,
			We would like to recieve further suggestions about making this portal Better. 
			</h4></div>
	</div>
		<hr>
		<footer>
		<h2>&copy All Right Reserved</h2>
		</footer>
</body>
</html>
