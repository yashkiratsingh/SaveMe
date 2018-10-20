<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
	
	
</body>
</html>