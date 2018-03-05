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
	ResultSet rs = null;
	
	String Query1 = "";
	
	try
	{
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		String name = request.getParameter("professor_column"); //교수 이름select 태그의  값을 얻음
		
		Query1 = "select ass_idProf from assignStudent where ass_nameProf=?"; //name값에 맞는 교수번호 검색
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		
		rs.next();
		int ass_idProf = rs.getInt(1); //교수번호 추출
		
		response.sendRedirect("mana_Assignment.jsp?idProf=" + ass_idProf + "&id="+id+"&pw="+pw); //
	}
	
	catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		if (rs != null)
			try
			{
				rs.close();
			} catch (SQLException sqle)
			{
			}
		
		if (pstmt != null)
			try
			{
				pstmt.close();
			} catch (SQLException sqle)
			{
			}
		
		if (conn != null)
			try
			{
				conn.close();
			} catch (SQLException sqle)
			{
			}
	}
%>
