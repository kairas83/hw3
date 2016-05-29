<%@ page contentType = "text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>회원가입</title>
</head>
<body>
	<table>
	<form action="signin_complete.jsp" method="post" name="signin">
		<tr>
			<td>
				ID:
			</td>
			<td>
				<input type="text" name="id"><br>
			</td>
		</tr>
		<tr>
			<td>
				PW:
			</td>
			<td>
				<input type="password" name="password"><br>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input class="right" type=submit value="가입">
			</td>
		</tr>
	</form>
	</table>
	
</body>
</html>