<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<script>
	function tt() {
		alert('올바른 학번과 비밀번호를 입력하세요.');

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
		//------------------------------- JDBC 설정
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		//------------------------------- 질의의 생성과 객체의 생성
		Query1 = "SELECT idStudent,sidStudent FROM student";
		Query2 = "SELECT idProf, sidProf FROM professor";
		Query3 = "SELECT idAdmin FROM admin";
		
		pstmt = conn.prepareStatement(Query1);
		rs1 = pstmt.executeQuery();
		
		//화면 조건값이랑 아이디 비번 받아오기
		String choice = request.getParameter("choice");
		String id = request.getParameter("UserId");
		String pw = request.getParameter("UserPass");
		String checknum = id.substring(2, 4);
		//------------------------------- 순환문을 이용한 레코드 출력 시작
		// 학생코드확인하기
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
		// 교수코드확인하기
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
		// 교수코드확인하기
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
				//모든 아이디 비번 다검색했는데 중복된거 하나도 없으면 오류보여주기.
				out.println("<script>alert('올바른 아이디와 비밀번호를 입력하세요.'); history.back();</script>");
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
		//------------------------------- 생성된 객체 제거 rs1.close(); pstmt.close();
		conn.close();
	}
%>