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
	
	int idStu = Integer.parseInt(request.getParameter("checkcode"));
	
	try
	{
		//------------------------------- JDBC 설정
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		String radioValue = request.getParameter("checkcode");
		
		//------------------------------- 질의의 생성과 객체의 생성
		Query1 = "select ass_idProf from assignStudent where ass_idStu=?";
		Query2 = "DELETE FROM assignStudent WHERE ass_idStu=?";
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, idStu);
		rs = pstmt.executeQuery();
		rs.next();
		int ass_idProf = rs.getInt(1); //교수번호 추출
		
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, Integer.parseInt(radioValue));
		pstmt.executeUpdate();
		
		response.sendRedirect("mana_Assignment.jsp?idProf=" + ass_idProf + "&id=" + id + "&pw=" + pw);
		
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		//------------------------------- 생성된 객체 제거  pstmt.close();
		conn.close();
	}
%>





