<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String Query1 = "";
	
	try
	{
		//------------------------------- JDBC 汲沥
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		int code = Integer.parseInt(request.getParameter("code"));
		String answer = request.getParameter("answer");
		int value = Integer.parseInt(request.getParameter("sub1"));
		int stuid = Integer.parseInt(request.getParameter("stuid"));
		
		Query1 = "UPDATE attendee SET eval_shortanswer=?, eval_score=?, eval_boolean=? WHERE lecture_codeLecture=? AND Student_idStudent=?";
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setString(1, answer);
		pstmt.setInt(2, value);
		pstmt.setString(3, "O");
		pstmt.setInt(4, code);
		pstmt.setInt(5, Integer.parseInt(id));
		pstmt.executeUpdate();
		
		response.sendRedirect("stu_L_eval.jsp?id=" + id + "&pw=" + pw);
		
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		//------------------------------- 积己等 按眉 力芭  pstmt.close();
		conn.close();
	}
%>
