<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<script>
	function tt() {
		alert('�ùٸ� �й��� ��й�ȣ�� �Է��ϼ���.');

	}
</script>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	String Query1 = "";
	String Query2 = "";
	String Query3 = "";
	
	try
	{
		//------------------------------- JDBC ����
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		//------------------------------- ������ ������ ��ü�� ����
		Query1 = "SELECT idStudent,sidStudent FROM student";
		Query2 = "SELECT idProf, sidProf FROM professor";
		Query3 = "SELECT idAdmin FROM admin";
		
		pstmt = conn.prepareStatement(Query1);
		rs1 = pstmt.executeQuery();
		
		//ȭ�� ���ǰ��̶� ���̵� ��� �޾ƿ���
		String choice = request.getParameter("choice");
		String id = request.getParameter("UserId");
		String pw = request.getParameter("UserPass");
		String checknum = id.substring(2, 4);
		//------------------------------- ��ȯ���� �̿��� ���ڵ� ��� ����
		// �л��ڵ�Ȯ���ϱ�
		while (rs1.next())
		{
			String idstu = rs1.getString("idStudent");
			String sidstu = rs1.getString("sidStudent");
			if (idstu.equals(id) && pw.equals(sidstu.substring(0, 6)))
			{
				if (choice.equals("1"))
				{
					response.sendRedirect("Management/student/stu_profile.jsp?id=" + id + "&pw=" + pw);
				}
				if (choice.equals("2"))
				{
					response.sendRedirect("application/student/app_main.jsp?id=" + id + "&pw=" + pw);
				}
			}
		}
		
		pstmt = conn.prepareStatement(Query2);
		rs2 = pstmt.executeQuery();
		// �����ڵ�Ȯ���ϱ�
		while (rs2.next())
		{
			String idpro = rs2.getString("idProf");
			String sidpro = rs2.getString("sidProf");
			if (idpro.equals(id) && pw.equals(sidpro.substring(0, 6)))
			{
				if (choice.equals("1"))
				{
					response.sendRedirect("Management/professor/pro_Profile.jsp?id=" + id + "&pw=" + pw);
				}
			}
		}
		
		pstmt = conn.prepareStatement(Query3);
		rs3 = pstmt.executeQuery();
		// �����ڵ�Ȯ���ϱ�
		while (rs3.next())
		{
			String idadmin = rs3.getString("idAdmin");
			if (idadmin.equals(id) && pw.equals("rootpass"))
			{
				if (choice.equals("1"))
				{
					response.sendRedirect("Management/manager/mana_stuProfile.jsp?id=" + id + "&pw=" + pw);
				} else if (choice.equals("2"))
				{
					response.sendRedirect("application/manager/app_mana_main.jsp?id=" + id + "&pw=" + pw);
				}
			} else
			{
				//��� ���̵� ��� �ٰ˻��ߴµ� �ߺ��Ȱ� �ϳ��� ������ ���������ֱ�.
				out.println("<script>alert('�ùٸ� ���̵�� ��й�ȣ�� �Է��ϼ���.'); history.back();</script>");
				break;
			}
		}
%>
<%
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		//------------------------------- ������ ��ü ���� rs1.close(); pstmt.close();
		conn.close();
	}
%>