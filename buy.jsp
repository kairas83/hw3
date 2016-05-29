<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%! String id;
	String password;
	int point;
	String name;
	String sprice;
	int price;
	int number;
	String image;
%>
<%
	id = (String) session.getAttribute("id");
	point = (int) session.getAttribute("point");
	String filePath = request.getRealPath("shopContent/");
	String product_number = request.getParameter("product_number");
	String fileName = "product" + product_number + ".txt";
	String file = filePath + fileName;
	
	BufferedReader br = null;
	BufferedWriter bw = null;
	
	try{
		br = new BufferedReader(new FileReader(new File(file)));
		
		name = br.readLine();	
		sprice = br.readLine();
		String stprice = "";
		for (int i = 0; i < sprice.length(); i++) {
			char c = sprice.charAt(i);
			if (c != ',')
				stprice += c;
		}
		price = Integer.parseInt(stprice);
		number = Integer.parseInt(br.readLine());
		image = br.readLine();
		br.close();
		
		if (price <= point) {
			bw = new BufferedWriter(new FileWriter(new File(file)));
			bw.write(name);
			bw.newLine();
			bw.write(sprice);
			bw.newLine();
			bw.write(String.valueOf(number - 1));
			bw.newLine();
			bw.write(image);
	
			bw.close();
			point -= price;
			session.setAttribute("point", point);
			
			filePath = request.getRealPath("/");
			fileName = id + ".txt";
			file = filePath + fileName;
	
			br = null;
			bw = null;
			
			try{
				br = new BufferedReader(new FileReader(new File(file)));
				password = br.readLine();
				br.close();
				
				bw = new BufferedWriter(new FileWriter(new File(file)));
				bw.write(password);
				bw.newLine();
				bw.write(String.valueOf(point));
				bw.close();
				
			} catch(IOException e) { 
				System.out.println(e.toString());
			} finally {
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
		}
		else
		{
			out.print("<script>alert('포인트가 부족합니다');</script>");
		}
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
</html>