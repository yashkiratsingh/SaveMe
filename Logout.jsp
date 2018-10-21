<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
int s=Integer.parseInt(request.getParameter("ii"));
    if(s==1) session.removeAttribute("us");
    else if(s==2) session.removeAttribute("em");
 %>
<jsp:forward page="HomePage.jsp"></jsp:forward>
</body>
</html>