
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' type="text/css" href="HomePage.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h3>Questions</h3>
	<%
			response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
			String id=request.getParameter("id");
			session.setAttribute("id", id);
			Class.forName("com.mysql.jdbc.Driver");
				Connection co1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
				Statement st1 = co1.createStatement();
                 String Id=(String)session.getAttribute("Id");
				ResultSet rs2 = st1.executeQuery("select * from ques where quesid='"+id+"' and solution =\"NA\"");
				while (rs2.next()) {
					String ans = rs2.getString("solution");
			%>
	<form method="post" action="solvingh.jsp">
		<table cellspacing="20" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>User ID:</td>
				<td><%=rs2.getString("userid")%>
			</tr>
			<tr>
				<td>Question:</td>
				<td><%=rs2.getString("question")%>
			</tr>
			<tr>
				<td>Solution</td>
				<td><textarea required autofocus name="prob"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Submit"></td>
			</tr>
		</table>
	</form>
	<%
		} 
			%>


</body>
</html>