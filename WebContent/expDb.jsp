<%@page import="javax.mail.Session"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<link rel='stylesheet' type="text/css" href="DashBoard.css">
<script>
	var divs = [ "Menu0", "Menu1", "Menu2", "Menu3", "Menu4", "Menu5", "Menu6",
			"Menu7", "Menu8", "Menu9" ];
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
		<pre>SaveMe</pre>
		<ul>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">Log Out</a></li>
		</ul>
	</div>
	<div class="sidebar">
		<ul>
			<li><a href="#" onclick="toggleVisibility('Menu0')">Home</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu1')">My
					Profile</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu2')">Questions</a></li>
			<li><a href="#" onclick="togleVissibility('Menu3')">Solved</a></li>
		</ul>
	</div>

	<br>
	<br>
	<br>
	<br>
	<div class="main">
		<div id="Menu0">Home</div>
		<div id="Menu1" style="display: none">
			<h3>Profile</h3>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st = co.createStatement();
             String e=(String)(session.getAttribute("em"));
				ResultSet rs1 = st.executeQuery("select * from exp_info where email="+e);
				while (rs1.next()) {
			%>

			<table border="2px" bordercolor="white" cellspacing="5px"
				style="border-collapse: collapse; padding: 0;">
				<tr>
					<td>Name:</td>
					<td><%=rs1.getString("name")%>
				</tr>
				<tr>
					<td>Advisor ID:</td>
					<td><%=rs1.getInt("expID")%>
				</tr>
				<tr>
					<td>Field:</td>
					<td><%=rs1.getString("field")%>
				</tr>
				<tr>
					<td>Contact:</td>
					<td><%=rs1.getString("contact")%>
				</tr>
				<tr>
					<td>Email:</td>
					<td><%=rs1.getString("email")%>
				</tr>
				<tr>
					<td>Organization:</td>
					<td><%=rs1.getString("og")%>
				</tr>
			</table>
			<%
				}
			%>
		</div>
		<div id="Menu2" style="display: none">
			<h3>Questions</h3>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection co1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st1 = co.createStatement();

				ResultSet rs2 = st1.executeQuery("select * from ques where expID=\"100\" and solutions =\"null\"");
				while (rs2.next()) {
					String ans = rs2.getString("solution");
			%>

			<table border="2px" bordercolor="white" cellspacing="5px"
				style="border-collapse: collapse; padding: 0;">
				<tr>
					<td>User ID:</td>
					<td><%=rs2.getString("userid")%>
				</tr>
				<tr>
					<td>Question:</td>
					<td><%=rs2.getString("question")%>
				</tr>
				<%
					if (ans.equals("null")) {
				%>
				<tr>
					<td>Status:</td>
					<td><a href="Solving.jsp">Answer it</a>
				</tr>
				<%
					} else
				%>
				<tr>
					<td>Status:</td>
					<td>Answered</td>
				</tr>
			</table>
			<%
				}
			%>
		</div>

	</div>
</body>
</html>