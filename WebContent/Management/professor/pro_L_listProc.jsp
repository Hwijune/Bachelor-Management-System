<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int code = Integer.parseInt(request.getParameter("code"));
%>

<%
	String saveFolder = "upload_files";
	
	MultipartRequest multi = null;
	
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
	
	int sizeLimit = 100 * 1024 * 1024;
	String encType = "euc-kr";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	multi = new MultipartRequest(request, realFolder, sizeLimit, encType, policy);
	
	//-------------------------- ��ü�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String Query1 = "";
	try
	{
		//------------------------------- JDBC ����
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		Query1 = "UPDATE lecture SET evalCheck=? WHERE codeLecture="+code;
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setString(1, "O");
		
		pstmt.executeUpdate();
		
		response.sendRedirect("pro_L_list.jsp?id=" + id + "&pw=" + pw);
		
	} catch (SQLException e)
	{
		
		out.print(e);
		
	} finally
	{
		
		//------------------------------- ������ ��ü�� ���ſ� ������ �̵�
		
		conn.close();
	}
%>