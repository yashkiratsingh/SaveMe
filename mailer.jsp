<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import=" javax.mail.Authenticator"%>
<%@page import="javax.mail.Message.RecipientType"%>

<%@ page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.internet.MimeMultipart"%>


<%@page import="java.util.Properties"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
		class MyAuthenticator extends Authenticator {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				PasswordAuthentication p = new PasswordAuthentication("demoapi786@gmail.com", "nitin111");

				return p;
			}
		}
		Properties p1 = new Properties();
		p1.put("mail.smtp.host", "smtp.gmail.com");
		p1.put("mail.smtp.port", "587");
		p1.put("mail.smtp.starttls.enable", "true");
		p1.put("mail.smtp.auth", "true");
		p1.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		Authenticator a = new MyAuthenticator();
		Session s = Session.getInstance(p1, a);
		MimeMessage message = new MimeMessage(s);
		message.setFrom(new InternetAddress("demoapi786@gmail.com"));
		 
		
		String m = request.getParameter("email");
		session.setAttribute("em", m);
		InternetAddress r1 = new InternetAddress(m);

		InternetAddress[] r = { r1 };
		message.addRecipients(RecipientType.TO, r);
		Class.forName("com.mysql.jdbc.Driver");
		Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/SaveMe", "root", "spjisspj");
		Statement st = co.createStatement();
		
		
		 
			ResultSet rs = st.executeQuery("select email from exp_info");

			int a7 = 0;
			while (rs.next()) {
				String m1 = rs.getString("email");

				if (m.equals(m1)) {
					a7 = 1;
				}
			}
			if (a7 == 1) {
				message.setSubject("OTP verification for Expert for SaveMe");
				MimeBodyPart p11 = new MimeBodyPart();
           
				Random rnd = new Random();
				int i = 0;
				//generate OTP
				int otp = 0;

				do {
					int o1 = rnd.nextInt(10);

					otp = otp + (int) (o1 * Math.pow(10, i));
					i++;
				} while (i <= 3);
				session.setAttribute("otp1", otp);
				p11.setContent("<b>'" + otp + "'</b>", "text/html");

				MimeMultipart mp1 = new MimeMultipart();
				mp1.addBodyPart(p11);
				message.setContent(mp1);
				Transport.send(message);
			}
			
			else {
				%>
				<b>wrong email</b>
				<br>
				<a href="HomePage.jsp">click here to login again</a>
				<%
					}
				%>
				<jsp:forward page="exp_infoH.jsp"></jsp:forward>
</body>
</html>