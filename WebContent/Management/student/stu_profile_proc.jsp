<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("euc-kr");
	int id = Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("pw");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	try
	{
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		int idstu = Integer.parseInt(request.getParameter("idstu"));
		//out.println(idstu);
		String name = request.getParameter("name");
		//out.println(name);
		String phone = request.getParameter("phone");
		//out.println(phone);
		String add = request.getParameter("add");
		//out.println(add);
		
		//out.println(nameprof + " " + sidprof + " "+ idprof + " " + phoneprof + " " + majorprof + " " + addprof + " " );
		String Query1 = "update student set nameStudent=?, phoneStudent=?, addStudent=? where idStudent="+id+"";
		pstmt = conn.prepareStatement(Query1);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, add);
		
		pstmt.executeUpdate();
		
		String retUrl = "stu_profile.jsp?id=" + id + "&pw=" + pw;
		response.sendRedirect(retUrl);
		
	} catch (SQLException e)
	{
		e.printStackTrace();
		
	}
%>