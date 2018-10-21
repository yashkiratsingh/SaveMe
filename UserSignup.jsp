 <%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Random" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Congratulations</title>
</head>
<body>
<%!static int i; %>
<%  

class MyAuthenticator extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {

		PasswordAuthentication p = new PasswordAuthentication("demoapi786@gmail.com", "nitin111");

		return p;
	}
}


Class.forName("com.mysql.jdbc.Driver");
Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root","spjisspj");
Statement s=c.createStatement(); 
String name=request.getParameter("name");
String age=request.getParameter("age");
String gen=request.getParameter("gender");
String email=request.getParameter("email");
String pwd=request.getParameter("pass");


 
	 int i=0;
	 String q="_";
	 Random r=new Random();
	 while(i<4) {	 
		 q=q+r.nextInt(9);
		 i++;	 
	 }
	 String username=name+q;
	 
		Properties p1 = new Properties();
		p1.put("mail.smtp.host", "smtp.gmail.com");
		p1.put("mail.smtp.port", "587");
		p1.put("mail.smtp.starttls.enable", "true");
		p1.put("mail.smtp.auth", "true");
		p1.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		Authenticator a = new MyAuthenticator();
		Session s1 = Session.getInstance(p1, a);
		MimeMessage message = new MimeMessage(s1);
		message.setFrom(new InternetAddress("demoapi786@gmail.com"));
		 
		 

		InternetAddress r1 = new InternetAddress(email);

		InternetAddress[] r2 = { r1 };
		message.addRecipients(RecipientType.TO, r2);
 


		MimeBodyPart p11 = new MimeBodyPart();
 
		p11.setContent("<p>Your username for SaveMe is "+username+ " , you can login your username and password</p>" , "text/html");
 
		MimeMultipart mp1 = new MimeMultipart();
		mp1.addBodyPart(p11);
		message.setContent(mp1);
		Transport.send(message);
		
		int nora=s.executeUpdate("insert into user_info values"+
		          "( '"+username+"','"+name+"','"+age+"','"+gen+"','"+email+"',SHA1('"+pwd+"'))");
		

	 
		
%>
<jsp:forward page="HomePage.jsp"></jsp:forward>
</body>
</html>

