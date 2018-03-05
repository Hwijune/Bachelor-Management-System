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
		
		String name = request.getParameter("key1"); //text태그의 값의 학생 이름의 값을 얻음
		
		Query1 = "select ass_nameStu from assignStudent where ass_nameStu=?"; //name값에 맞는 학생이름 검색
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		
		rs.next();
		String Name = rs.getString("ass_nameStu"); //학생이름 추출
		String encoded_Name = URLEncoder.encode(Name, "euc-kr");//학생이름을 한글 값을 get방식으로 전달하기 위해  인코더함
		
		response.sendRedirect("pro_Consult_stulist.jsp?fname=" + encoded_Name + "&id=" + id + "&pw=" + pw);//추출한 학생이름을 get방식으로 전달
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
