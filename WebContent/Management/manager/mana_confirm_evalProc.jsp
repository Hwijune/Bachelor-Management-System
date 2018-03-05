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
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String Query1 = "";
	String Query2 = "";
	
	try
	{
		//------------------------------- JDBC 설정
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		int code = Integer.parseInt(request.getParameter("lect"));
		
		Query1 = "select titleLecture from lecture where codeLecture=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, code);
		rs = pstmt.executeQuery();
		
		rs.next();
		
		String title = rs.getString("titleLecture");
		String encoded_title = URLEncoder.encode(title, "euc-kr");//인코딩해서 한글과목명보내주기
		
		response.sendRedirect(
				"mana_confirm_eval.jsp?code=" + code + "&title=" + encoded_title + "&id=" + id + "&pw=" + pw);
		
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		//------------------------------- 생성된 객체 제거  pstmt.close();
		conn.close();
	}
%>





