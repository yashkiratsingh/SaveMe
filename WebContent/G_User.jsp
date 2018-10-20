<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Guest </title>
</head>
<body>
<fieldset><legend><b>Guest User </b></legend>
<form method="post" action="G_Userh.jsp">
age<br>
<input type="number" name="name" required><br>
Gender<br>
<input type="radio" name="gender" value="male"  >
male<br>
<input type="radio" name="gender" value="female"  >
Female<br>
<input type="radio" name="gender" value="others"  >
others<br>
Email<br>
<input type="email" name="Email" required> <br>
Click here to ask a problem<br>
<a href="ask.jsp"></a>
</form>


</fieldset>
</body>
</html>