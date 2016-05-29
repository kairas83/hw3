<%@ page contentType = "text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>로그인</title>
</head>
<body>
<table>
<form action="login_complete.jsp" method="post" name="login">
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
			<input class="right" type=submit value="로그인">
		</td>
	</tr>
</form>
</table>
</body>
</html>