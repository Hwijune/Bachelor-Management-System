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
		
		String name = request.getParameter("key1"); //text�±��� ���� �л� �̸��� ���� ����
		
		Query1 = "select ass_nameStu from assignStudent where ass_nameStu=?"; //name���� �´� �л��̸� �˻�
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		
		rs.next();
		String Name = rs.getString("ass_nameStu"); //�л��̸� ����
		String encoded_Name = URLEncoder.encode(Name, "euc-kr");//�л��̸��� �ѱ� ���� get������� �����ϱ� ����  ���ڴ���
		
		response.sendRedirect("pro_Consult_stulist.jsp?fname=" + encoded_Name + "&id=" + id + "&pw=" + pw);//������ �л��̸��� get������� ����
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
