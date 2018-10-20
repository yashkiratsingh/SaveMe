<%@page import="com.sun.mail.iap.ResponseInputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="p.Answer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ans</title>
</head>
<body>
	<%
		String qid = request.getParameter("qno");
		String question = (String) session.getAttribute("ques");
		String stuanswer = request.getParameter("opt");
		if (stuanswer == null) {
			stuanswer = "Not Attempt";
		}

		int sno = (int) session.getAttribute("sn");
		String sid = (String) session.getAttribute("sid2");
		String subject = (String) session.getAttribute("examsubject");
		String time = (String) session.getAttribute("date");
		String email = (String) session.getAttribute("email");
		Class.forName("com.mysql.jdbc.Driver");
		Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/first_project", "root", " ");
		Statement st = co.createStatement();%>
		 
		 
		<%
		ArrayList<Answer> al = (ArrayList<Answer>) session.getAttribute("alist");
		ResultSet r = st.executeQuery("select cop from "+ subject + " where ques_id=" + sno);
		if (r.next()) {
			String ca = r.getString("cop");

			Answer a = new Answer();
			a.setOs(stuanswer);
			a.setQ(question);
			a.setRa(ca);
			 a.setSno(sno);

			al.add(a);

		}
		session.setAttribute("rl", al);
		co.close();
		out.println("answer has been submitted");
       response.sendRedirect("showquestion.jsp");
	%>
	 

</body>
</html>