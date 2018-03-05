<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	ResultSet rs1 = null;
	
	String Query1 = "";
	
	try
	{
		//------------------------------- JDBC 설정
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		//subjectmodify에서 값받아오기
		int code = Integer.parseInt(request.getParameter("code"));
		String title = request.getParameter("title");
		String room = request.getParameter("room");
		String time = request.getParameter("time");
		int grade = Integer.parseInt(request.getParameter("grade"));
		int idprof = Integer.parseInt(request.getParameter("idprof"));
		String area = request.getParameter("area");
		String campus = request.getParameter("campus");
		String credit = request.getParameter("credit");
		int limit = Integer.parseInt(request.getParameter("limit"));
		String days = request.getParameter("days");
		String proname = request.getParameter("proname");
		
		//------------------------------- 질의의 생성과 객체의 생성
		Query1 = "INSERT INTO lecture(codeLecture,titleLecture,roomLecture,timeLecture,gradeLecture,Admin_professor_idProf,areaLecture,campusLecture,creditLecture,limitLecture,booleanLecture,daysLecture,profnameLecture) VALUE (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, code);
		pstmt.setString(2, title);
		pstmt.setString(3, room);
		pstmt.setString(4, time);
		pstmt.setInt(5, grade);
		pstmt.setInt(6, idprof);
		pstmt.setString(7, area);
		pstmt.setString(8, campus);
		pstmt.setString(9, credit);
		pstmt.setInt(10, limit);
		pstmt.setInt(11, 1);
		pstmt.setString(12, days);
		pstmt.setString(13, proname);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("app_mana_main.jsp?id="+id+"&pw="+pw);
%>
<%
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		//------------------------------- 생성된 객체 제거 rs1.close(); pstmt.close();
		conn.close();
	}
%>