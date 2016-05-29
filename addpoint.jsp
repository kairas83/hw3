<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.io.*"%>
<%! String id;
	String password ;
	String filePath;
	String fileName;
	String file;
	int point;
	int addedpoint;
%>
<%
	id = (String) session.getAttribute("id");
	addedpoint = Integer.parseInt(request.getParameter("addedpoint"));
	filePath = request.getRealPath("/");
	fileName = id + ".txt";
	file = filePath + fileName;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>포인트 추가</title>
</head>
<body>
<%
	BufferedReader br = null;
	BufferedWriter bw = null;
	
	try{
		br = new BufferedReader(new FileReader(new File(file)));
		password = br.readLine();
		point = Integer.parseInt(br.readLine());
		br.close();
		
		bw = new BufferedWriter(new FileWriter(new File(file)));
		bw.write(password);
		bw.newLine();
		point = point + addedpoint;
		bw.write(String.valueOf(point));
		bw.close();
		
		session.setAttribute("point", point);
		
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
		if (bw != null) 
			try {
				bw.close();
			} catch(IOException e) {
				System.out.println(e.toString());
			}
	}
	response.setHeader("Refresh", "0; URL=index.jsp");
%>
</body>
