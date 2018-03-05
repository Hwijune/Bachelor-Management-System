<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("euc-kr");
	
	int id = Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("pw");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	try
	{
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		int idstu = Integer.parseInt(request.getParameter("idstu"));
		//out.println(idstu);
		String name = request.getParameter("name");
		//out.println(name);
		String phone = request.getParameter("phone");
		//out.println(콜);
		String profstu = request.getParameter("profstu");
		//out.println(profstu);
		String add = request.getParameter("add");
		//out.println(add);
		String major = request.getParameter("major");
		//out.println(major);
		String sidstu = request.getParameter("sidstu");
		//out.println(sidstu);
		
		String Query2 = "SELECT * from student where idStudent=? ";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, idstu);
		rs = pstmt.executeQuery();
		if (rs.next())
		{
			String Query1 = "UPDATE student SET nameStudent=?, addStudent=?, majorStudent=?, phoneStudent=?, sidStudent=?, profStudent=? WHERE idStudent="+id+"";
			pstmt = conn.prepareStatement(Query1);
			
			pstmt.setString(1, name);
			pstmt.setString(2, add);
			pstmt.setString(3, major);
			pstmt.setString(4, phone);
			pstmt.setString(5, sidstu);
			pstmt.setString(6, profstu);
			pstmt.executeUpdate();
		} else
		{
			//INSERT INTO `mydb`.`student` (`idStudent`, `nameStudent`, `enterdateStudent`, `addStudent`, `majorStudent`, `profStudent`, `sidStudent`, `pwStudent`, `phoneStudent`) VALUES ('1344033', '주명길', '', '강원 원주시', '소프트웨어', '이광', '9412191000000', '', '01022547789'); 
			String Query3 = "Insert Into student (nameStudent, sidStudent, idStudent, phoneStudent, majorStudent, profStudent,  addStudent) VALUES (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(Query3);
			pstmt.setString(1, name);
			pstmt.setString(2, sidstu);
			pstmt.setInt(3, idstu);
			pstmt.setString(4, phone);
			pstmt.setString(5, major);
			pstmt.setString(6, profstu);
			pstmt.setString(7, add);
			
			pstmt.executeUpdate();
			
		}
		
		//out.println(nameprof + " " + sidprof + " "+ idprof + " " + phoneprof + " " + majorprof + " " + addprof + " " );
		//String Query1="update professor set nameProf=?, phoneProf=?, addProf=?, majorProf=?, sidProf=?, where idProf=?";
		
		String retUrl = "mana_stuProfile.jsp?id="+id+"&pw="+pw;
		response.sendRedirect(retUrl);
		
	} catch (SQLException e)
	{
		e.printStackTrace();
		
	}
%>