<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>
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
		out.println("회원 가입이 성공하였습니다<br>");
	}
	else
	{
		out.println("회원 가입이 실패하였습니다");
	}
	out.println("5초후 초기화면으로 이동합니다");
	response.setHeader("Refresh", "5; URL=index.jsp");
	%>	
</body>
</html>