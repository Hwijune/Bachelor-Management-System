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
	int no = Integer.parseInt(request.getParameter("Rno"));
	out.print(no);
	
	response.sendRedirect("stu_Consult_his.jsp?fno=" + no + "&id="+id+"&pw="+pw);
%>