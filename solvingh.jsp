<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
		String s=request.getParameter("prob");
		String str=(String)session.getAttribute("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection co1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
		Statement st1 = co1.createStatement();
		st1.executeUpdate("update ques set solution='"+s+"' where quesid='"+str+"'");
		
	%>
<jsp:forward page="expDb.jsp"></jsp:forward>
</body>
</html>