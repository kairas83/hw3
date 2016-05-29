<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%! String id;
	String password ;
	String fileName;
	String filePath;
	String file;
	int point;
	String pass;
%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
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
		public int login_success() {
			
			FileReader fr = null;
			BufferedReader br = null;
			try{
				File f = new File(file);
				if (!f.isFile())
					return 0;
				
				fr = new FileReader(file);
				br = new BufferedReader(fr);
				
				pass = br.readLine();	
				point = Integer.parseInt(br.readLine());
				
				// if (password != pass) {
					// return -1;
				// }

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
			return 1;			
		}
	%>
	<%
	if (login_success() == 1) {
		out.println("로그인이 성공하였습니다");
		session.setAttribute("id", id);
		session.setAttribute("point", point);
	}
	else if (login_success() == -1)
	{
		out.println("<script>alert('패스워드가 다릅니다');</script>");
		out.println("로그인이 실패하였습니다");
	}
	else if (login_success() == 0)
	{
		out.println("<script>alert('아이디가 존재하지 않습니다');</script>");
		out.println("로그인이 실패하였습니다");
	}
	out.println("<br>"+file+"<br>입력한 아이디:"+id+"<br>입력한 패스워드:"+password+"<br>저장된 패스워드:"+ pass+"");
	out.println("<br>5초후 초기화면으로 이동합니다");
	response.setHeader("Refresh", "5; URL=index.jsp");
	%>	
</body>
</html>