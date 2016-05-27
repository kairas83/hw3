<%@ page contentType = "text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<script src="myscript.js"></script>
	<title>회원가입</title>
</head>
<body>
	<form action="signin_complete.jsp" method="post" name="signin">
		ID: <input type="text" id="member_id"><br>
		PW: <input type="password" id="member_password"><br>
		<input class="left" type=submit value="가입">
	</form>
	
</body>
</html>