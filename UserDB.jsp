<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<style type="text/css">
	tr,td,th{
		padding:10px;	
		text-align:center;
	}
</style>
<link rel='stylesheet' type="text/css" href="DashBoard.css">
<script>
	var divs = [ "Menu0", "Menu1", "Menu2", "Menu3", "Menu4"];
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
<body><%response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate"); %>
	<div class="nav">
		<pre>SaveMe</pre>
		<ul>
			<li><a href="Logout.jsp?ii=1">Log Out</a></li>
		</ul>
	</div>
	<div class="sidebar">
		<ul>
			<li><a href="#" onclick="toggleVisibility('Menu0')">Home</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu1')">My
					Profile</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu2')">Advisor
					Panel</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu3')">Ask A
					Question</a></li>
			<li><a href="#" onclick="toggleVisibility('Menu4')">My
					Questions</a></li>
		</ul>
	</div>

	<br>
	<br>
	<br>
	<br>
	<div class="main">
		<div id="Menu0">Welcome Home!!!!</div>
		<div id="Menu1" style="display: none">
			<h3>Profile</h3>
			<%  
			   String Id=(String)session.getAttribute("us");
				Class.forName("com.mysql.jdbc.Driver");
				Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st = co.createStatement();

				ResultSet rs = st.executeQuery("select * from user_info where userID='"+Id+"'");
				while (rs.next()) {
					%>

					<table border="0" cellspacing="10px"
						style="padding: 3px;">
						<tr>
							<td>Name:</td>
							<td><%=rs.getString("name")%>
						</tr>
						<tr>
							<td>User ID:</td>
							<td><%=rs.getString("userID")%>
						</tr>
						<tr>
							<td>Gender:</td>
							<td><%=rs.getString("gender")%>
						</tr>
						<tr>
							<td>Age:</td>
							<td><%=rs.getString("age")%>
						</tr>
						<tr>
							<td>Email:</td>
							<td><%=rs.getString("email")%>
						</tr>
					</table>
					<%
						}
					%>
				</div>
		<div id="Menu2" style="display: none">
			<h3>Advisor Panel</h3>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection co1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st1 = co1.createStatement();

				ResultSet rs1 = st1.executeQuery("select * from exp_info");

				ResultSetMetaData rsmd1 = rs1.getMetaData();

				int columns1 = rsmd1.getColumnCount();
			%>

			<table border="0" cellspacing="10px"
						style="padding: 3px;">
				<tr>
					<th>Name</th>
					<th>Advisor ID</th>
					<th>Field</th>
					<th>Contact</th>
					<th>Email</th>
					<th>Organization</th>
				</tr>
				<%
						while (rs1.next()) {
							%><tr><%
							for (int i = 1; i <= columns1; i++) {
								String columnName = rsmd1.getColumnName(i);

								String columnData = rs1.getString(columnName);
								%><td><%=columnData%></td><%
							}
							%></tr><%
					}
					co.close();
				%>
			</table>
		</div>
		<div id="Menu3" style="display: none">
			<h3>Ask A Question</h3>
			<table cellspacing="20">
				<form action="Quesh.jsp" method="post">
				<tr>
					<td>Advisor Id: </td>
					<td><input type="text" name="id" required autofocus
						placeholder="ID"></td>
				</tr>
				<tr>
						<td>Enter Problem: </td>
						<td><textarea required autofocus name="prob"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Submit"></td>
					</tr>
				</form>
			</table>
		</div>
		<div id="Menu4" style="display: none">
			<h3>My Questions</h3>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection co3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st3 = co3.createStatement();

				ResultSet rs3 = st3.executeQuery("select * from ques where userid='"+Id+"'");

				ResultSetMetaData rsmd3 = rs3.getMetaData();

				int columns3 = rsmd3.getColumnCount();
			%>

			<table border="0px">
				<tr>
					<th>User ID</th>
					<th>Advisor ID</th>
					<th>Question</th>
					<th>Solution</th>
					<th>Question ID</th>
				</tr>
				<%
					while (rs3.next()) {
						%><tr><%
						for (int i = 1; i <= columns3; i++) {
							String columnName1 = rsmd3.getColumnName(i);

							String columnData1 = rs3.getString(columnName1);
							%><td><%=columnData1%></td><%
						}
						%></tr><%
					}
					co.close();
				%>
			</table>

		</div>
		
	</div>
</body>
</html>