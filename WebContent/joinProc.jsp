<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>

<%request.setCharacterEncoding("euc-kr");%>

<%
	
//---------------------------------- JDBC를 위한 객체 선언
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null; 
ResultSet rs2 = null;	

try {
	//------------------------------- JDBC 설정
	String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
	String jdbcId = "root";
	String jdbcPw = "rootpass";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	//------------------------------- 전송된 아이디와 동일한 아이디 추출
	String UserId = request.getParameter("UserId");
	
	String checknum = UserId.substring(2, 4);

	//교수일경우
	if (checknum.equals("01")) {
		//------------------------------- 데이터베이스에서 동일한 아이디 추출
		
		String name = request.getParameter("Username");
		String email = request.getParameter("Usermail");
		String phone = request.getParameter("UserHp1");
		String zip1 =  request.getParameter("ZipCode1");
		String zip2 =  request.getParameter("ZipCode2");	
		String addr1 =  request.getParameter("UserAddress1");	
		String addr2 =  request.getParameter("UserAddress2");
		String add = "[" + zip1 + "-" + zip2 + "]" +addr1 + " " + addr2;
		String Query1 = "UPDATE professor SET nameProf=?, emailProf=?, phoneProf=?, addProf=? WHERE idProf="+UserId;
		pstmt = conn.prepareStatement(Query1);
		
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, phone);
		pstmt.setString(4, add);
		
		pstmt.executeUpdate();
		
		%>
		교수님의 회원가입을 축하드립니다.
		<input type=button value="닫기" onClick="javascript:self.close();">
		<%
	}
	//학생일경우
	else {
		//------------------------------- 데이터베이스에서 동일한 아이디 추출
		String name = request.getParameter("Username");
		String email = request.getParameter("Usermail");
		String phone = request.getParameter("UserHp1");
		String zip1 =  request.getParameter("ZipCode1");
		String zip2 =  request.getParameter("ZipCode2");	
		String addr1 =  request.getParameter("UserAddress1");	
		String addr2 =  request.getParameter("UserAddress2");
		String add = "[" + zip1 + "-" + zip2 + "]" +addr1 + " " + addr2;
		String Query1 = "UPDATE student SET nameStudent=?, emailStudent=?, phoneStudent=?, addStudent=? WHERE idStudent="+UserId;
		pstmt = conn.prepareStatement(Query1);
		
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, phone);
		pstmt.setString(4, add);
		
		pstmt.executeUpdate();
		
		
		out.println("<script>alert('회원가입을 축하드립니다.'); self.close();</script>");
	}


} catch (SQLException e) {
		
		out.print(e);	
			
} 

%>			