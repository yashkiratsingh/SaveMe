<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Sign Up</title>
</head>
<fieldset style="background-color:powderblue" align="left" >

<legend ><b>Student Sign Up</b></legend>
<form action="StuSignf_Up.jsp" method="post">
First Name<br>
<input type="text" name="First name" required><br> 
Last Name<br>
<input type="text" name="Last name" required><br> 
Age<br>
<input type="number" name="Age" min="17" max="28" required><br> 
Gender<br>
<input type="radio" name="gender" value="male" checked> 
Male<br>
<input type="radio" name="gender" value="female"  > 
Female<br>
<input type="radio" name="gender" value="Other" > 
Other<br>
City <br>
<input type="text" name="city" required><br> 
Contact Number<br>

<input type="tel" name="pno" required><br>
Email<br>
<input type="email" name="email"required><br> 
Password<br> 
<input type="password" name="password" required><br>
repeat password<br>
<input type="password" name="repeat password" required><br>  



<button type="submit">Submit</button>
</form>
</fieldset>
</body>
</html>