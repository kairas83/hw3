<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%! String id;
	String password ;
	String fileName;
	String filePath;
	String file;
	int point = 0;
%>
<%
	id = request.getParameter("id");
	password = request.getParameter("password");
	filePath = request.getRealPath("/");
	fileName = id + ".txt";
	file = filePath + fileName;
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
			
			BufferedWriter bw = null;
			
			try{
				File f = new File(file);
				if (f.isFile())
					return false;
				
				f.createNewFile();
				
				bw = new BufferedWriter(new FileWriter(file));
				bw.write(password);
				bw.newLine();
				bw.write("0");
				
			}catch(IOException e) { 
				System.out.println(e.toString());
			}
			finally {
				if (bw != null) 
					try {
						bw.close();
					} catch(IOException e) {
						System.out.println(e.toString());
					}
			}
			
			fileName = id + "_이용내역.txt";
			file = filePath + fileName;
			
			try{
				File f = new File(file);
				
				f.createNewFile();								
			
			}catch(IOException e) { 
				System.out.println(e.toString());
			}
			return true;			
		}
	%>
	
	<%
	if (sign_success() == true) {
		out.println("회원 가입이 성공하였습니다");
		session.setAttribute("id", id);
		session.setAttribute("point", point);
		}
	else
	{
		out.println("<script>alert('아이디가 존재합니다');</script>");
		out.println("회원 가입이 실패하였습니다");
	}
	out.println("<br>"+file+"<br>입력한 아이디:"+id+"<br>입력한 패스워드:"+password);
	out.println("<br>5초후 초기화면으로 이동합니다");
	response.setHeader("Refresh", "5; URL=index.jsp");
	%>	
</body>
</html>