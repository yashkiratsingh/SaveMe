<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type="text/css" href="HomePage.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate"); %>
	<p align="center" style="margin-top:200px;">OTP Verification</p>
	<table cellspacing="20" style="margin-left:auto;margin-right:auto;">
		<form action="exp_infoHH.jsp" method="post">
		<tr>
			<td>OTP:</td>
			<td><input type="number" name="otp2" required autofocus
				placeholder="OTP"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
				value="Login"></td>
		</tr>
	</table>
</body>
</html>

