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
		//------------------------------- JDBC ����
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		//subjectmodify���� ���޾ƿ���
		int code = Integer.parseInt(request.getParameter("delcode"));
		
		//------------------------------- ������ ������ ��ü�� ����
		Query1 = "DELETE FROM attendee WHERE lecture_codeLecture=? and Student_idStudent='"+id+"'";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, code);

		
		pstmt.executeUpdate();
		response.sendRedirect("app_main.jsp?id="+id+"&pw="+pw);
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		//------------------------------- ������ ��ü ���� rs1.close(); pstmt.close();
		conn.close();
	}
%>