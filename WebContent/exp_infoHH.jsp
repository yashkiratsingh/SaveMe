<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int o = (int) session.getAttribute("otp1");
		String s1 = request.getParameter("otp2");
		int i = Integer.parseInt(s1);
		 

		if (i == o) {
	%>
	<jsp:forward page="expDb.jsp"></jsp:forward>
	<%
		} else {
	%>
	<b>incorrect OTP</b>
	<a href="HomePage.jsp">click here to go to Homepage again </a>
	<%
		}
	%>
</body>
</html>

