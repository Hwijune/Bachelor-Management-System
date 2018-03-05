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
		int idprof = Integer.parseInt(request.getParameter("idprof"));
		out.println(idprof);
		String name = request.getParameter("name");
		out.println(name);
		String phone = request.getParameter("phone");
		out.println(phone);
		
		String major = request.getParameter("major");
		out.println(major);
		String add = request.getParameter("add");
		out.println(add);
		
		//out.println(nameprof + " " + sidprof + " "+ idprof + " " + phoneprof + " " + majorprof + " " + addprof + " " );
		String Query1 = "update professor set nameProf=?, phoneProf=?, addProf=?, majorProf=? where idProf=?";
		pstmt = conn.prepareStatement(Query1);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, add);
		pstmt.setString(4, major);
		pstmt.setInt(5, idprof);
		
		pstmt.executeUpdate();
		
		String retUrl = "pro_Profile.jsp?id="+id+"&pw="+pw;
		response.sendRedirect(retUrl);
		
	} catch (SQLException e)
	{
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>