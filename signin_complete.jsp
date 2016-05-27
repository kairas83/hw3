<%@ page contentType = "text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>회원가입</title>
</head>
<body>
	<%!
		public boolean sign_success() {
			return true;
		}
	%>
	<%
	if (sign_success() == true) {
		out.print("회원 가입이 완료되었습니다<br>");
		out.print("5초후 메인페이지로 이동합니다");
		out.flush();
	}
	else
	{
		out.print("회원 가입이 실패하였습니다");
		out.flush();
	}
		Thread.sleep(5000);
		response.sendRedirect("index.jsp");
	%>
</body>
</html>