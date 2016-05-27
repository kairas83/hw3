<%@ page contentType = "text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>회원가입</title>
</head>
<body>
	<form action="signin_complete.jsp" method="post" name="signin">
		ID: <input type="text" name="id"><br>
		PW: <input type="password" name="password"><br>
		<input class="left" type=submit value="가입">
	</form>
	
</body>
</html>