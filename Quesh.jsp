<%@page import="java.util.Random"%>
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
		String s = (String) session.getAttribute("us");
		int i = 0;
		String q1 = "_";
		Random r = new Random();
		while (i < 4) {
			q1 = q1 + r.nextInt(9);
			i++;
		}
		String QId = s + q1;

		String q = request.getParameter("prob");
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
		Statement st = co.createStatement();

		String as = "NA";
		st.executeUpdate("insert into ques values" + "( '" + s + "','" + id + "','" + q + "','" + as + "','"+QId+"')");
	response.sendRedirect("UserDB.jsp");
	%>
	 
</body>
</html>