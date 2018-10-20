<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<% String e=request.getParameter("username");
session.setAttribute("us",e);
 
 Class.forName("com.mysql.jdbc.Driver");
 Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root","spjisspj");
  Statement s=c.createStatement();
    
  
  
  ResultSet r= s.executeQuery("select password from user_info where UserID=('"+e+"')");
  if(!r.next())  
   { out.println("register yourself first ");
     response.sendRedirect("HomePage.jsp");
     }
  else 
  {
	  String p=r.getString("password");
	  if(p.equals(request.getParameter("pass")))
	  {    ResultSet rs2=s.executeQuery("select email from user_info where userID='"+e+"'");
	        /*if(rs2.next()){
	        	String em=rs2.getString("email");
	        	session.setAttribute("em",em);
	        }*/
  
  %>
  <jsp:forward page="UserDB.jsp"></jsp:forward>
  <%   }
	  else out.println("<b>!!!!wrong password!!!<b>");
	  response.sendRedirect("HomePage.jsp");
	  
  }
  %>
  