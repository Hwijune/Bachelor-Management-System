<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//--------------------------------------------레코드 식별자 추출
	String grade = request.getParameter("grade");
	int stuid = Integer.parseInt(request.getParameter("stuid"));
	int codeLect = Integer.parseInt(request.getParameter("codeLect"));
	
	//---------------------------------- 객체와 변수의 선언		
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	String Query1 = " ";
	
	try{
		
		//------------------------------- JDBC 설정
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		//------------------------------- 질의의 수행 및 필드 값 추출
		Query1 = "update attendee set attendeeGrade=? where Student_idStudent=? AND lecture_codeLecture=? ";
		
		pstmt = conn.prepareStatement(Query1);
		
		pstmt.setString(1, grade);
		pstmt.setInt(2, stuid);
		pstmt.setInt(3, codeLect);
		pstmt.executeUpdate();
		
		//-------------------------------pro_stulist.jsp로 제어의 이동
		response.sendRedirect("pro_stulist.jsp?id="+id+"&pw="+pw); 
%>






<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//------------------------------- 예외처리 및 객체의 종료
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			
			conn.close();
		}
	%>


</body>
</html>