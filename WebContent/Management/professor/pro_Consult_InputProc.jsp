<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//id값과 pw값 가져오기
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	try
	{
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		int time = Integer.parseInt(request.getParameter("con_time"));
		String place = request.getParameter("con_place");
		String type = request.getParameter("con_type");
		String content = request.getParameter("con_content");
		int number = Integer.parseInt(request.getParameter("code"));
		long now = System.currentTimeMillis();
		
		String Query = "Select max(RcdNo)from consult";
		pstmt = conn.prepareStatement(Query);
		rs = pstmt.executeQuery();
		rs.next();
		int uid = (rs.getInt(1)) + 1;
		
		String Query1 = "INSERT INTO consult (timeCounsel,placeCounsel,typeCounsel,contentCounsel,dateCounsel,idstu,RcdNo) VALUES (?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, time);
		pstmt.setString(2, place);
		pstmt.setString(3, type);
		pstmt.setString(4, content);
		pstmt.setLong(5, now);
		pstmt.setInt(6, number);
		pstmt.setInt(7, uid);
		
		pstmt.executeUpdate();
		
		String Query2 = "UPDATE assignStudent SET ass_boolean=ass_boolean+1 WHERE ass_idStu=? ";
		
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, number);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("pro_Consult_Check.jsp?&id=" + id + "&pw=" + pw);
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		
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
