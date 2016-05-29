<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%! String id;
	int point;
	String name;
	int price;
	String sprice;
	int number;
	String image;
%>
<%
	id = (String) session.getAttribute("id");
		
	if (id != null) {
	
		point = (int) session.getAttribute("point");
	}
%>
<%! 
	public boolean login() {
		if (id == null)
			return false;
		else
			return true;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>Online Market System</title>
</head>
<body>
<ul class="navul">
	<% if (!login()) {
		out.println("<li class='navli'><a class='navlia' href='login.jsp'>로그인</a></li>");
		out.println("<li class='navli'><a class='navlia' href='signin.jsp'>회원가입</a></li>");
	}
	else
		out.println("<li class='navli'><a class='navlia' href='logout.jsp'>로그아웃</a></li>");
	%>
</ul>
<ul class="idul">
	<li>
		<% if (id != null)
			out.print(id); %>
	</li>
	<li>
		<% if (id != null)
			out.print("point: "+point); %>
	</li>
	<li>
		<% if (id != null)
			out.print("<form action='addpoint.jsp' method=post><input type=text style='width: 80px' name='addedpoint'>");
		%>
	</li>
	<li>
		<% if (id != null)
			out.print("<input type=submit value='포인트 추가'></form>");
		%>
	</li>
</ul>
<% 
String fileName = "product";
String filePath = request.getRealPath("shopContent/");
String file;

BufferedReader br = null;

for (int i = 1; i < 5; i++) {
	file = filePath + fileName + i + ".txt";
	
	try{
		br = new BufferedReader(new FileReader(new File(file)));
		if (br == null)
			out.print("<script>alert('file not found');</script>");
		
		name = br.readLine();	
		sprice = br.readLine();
		number = Integer.parseInt(br.readLine());
		image = br.readLine();
		
	}catch(IOException e) { 
		System.out.println(e.toString());
	}
	finally {
		if (br != null) 
			try {
				br.close();
			} catch(IOException e) {
				System.out.println(e.toString());
			}
	}

	out.println("<form action='buy.jsp' method=post>");
	out.println("<input type=hidden name='product_number' value="+i+"><br>");
	out.println(name + "<br>");
	out.println("<img src="+image+" />"+"<br>");
	out.println("가격:"+sprice+"<br>");
	out.println("수량:"+number);
	
	if (number != 0 && login()) {
		out.println("<input type=submit value='구입'><br>");
	}
	if (number != 0 && !login())
		out.print("로그인을 하세요");
	
	if (number == 0)
		out.print("sold out ");
	
	out.println("</form>");
}
%>

</body>
</html>