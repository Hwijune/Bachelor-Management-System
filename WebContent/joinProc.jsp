<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>

<%request.setCharacterEncoding("euc-kr");%>

<%
	
//---------------------------------- JDBC�� ���� ��ü ����
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null; 
ResultSet rs2 = null;	

try {
	//------------------------------- JDBC ����
	String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
	String jdbcId = "root";
	String jdbcPw = "rootpass";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	//------------------------------- ���۵� ���̵�� ������ ���̵� ����
	String UserId = request.getParameter("UserId");
	
	String checknum = UserId.substring(2, 4);

	//�����ϰ��
	if (checknum.equals("01")) {
		//------------------------------- �����ͺ��̽����� ������ ���̵� ����
		
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
		�������� ȸ�������� ���ϵ帳�ϴ�.
		<input type=button value="�ݱ�" onClick="javascript:self.close();">
		<%
	}
	//�л��ϰ��
	else {
		//------------------------------- �����ͺ��̽����� ������ ���̵� ����
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
		
		
		out.println("<script>alert('ȸ�������� ���ϵ帳�ϴ�.'); self.close();</script>");
	}


} catch (SQLException e) {
		
		out.print(e);	
			
} 

%>			