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
   ResultSet crs = null;
   ResultSet crs1 = null;
   
   String cQuery = "";
   String cQuery1 = "";
   
   String Query1 = "";
   
   int idProf = Integer.parseInt(request.getParameter("pro_numcol"));
   try
   {
      //------------------------------- JDBC 설정
      
      String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
      String jdbcId = "root";
      String jdbcPw = "rootpass";
      
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
      
      
      int ProId = Integer.parseInt(request.getParameter("pro_numcol"));
      
      int StuId = Integer.parseInt(request.getParameter("stu_numcol"));
      
      
      cQuery="select nameProf,idProf,majorProf from professor where idProf=? ";
      pstmt = conn.prepareStatement(cQuery);
      pstmt.setInt(1, ProId);
      crs = pstmt.executeQuery();
      
      crs.next();
      String pro_nameProf=crs.getString(1);
      int pro_idProf = crs.getInt(2); //교수번호 추출
      String pro_major=crs.getString(3);
      
      
      cQuery1="select nameStudent,idStudent,phoneStudent,addStudent from student where idStudent=? ";
      
      pstmt = conn.prepareStatement(cQuery1);
      pstmt.setInt(1, StuId);
      crs1 = pstmt.executeQuery();
      
      crs1.next();
      String stu_nameStu=crs1.getString(1);
      int stu_idStu = crs1.getInt(2); //교수번호 추출
      String stu_phone=crs1.getString(3);
      String stu_add=crs1.getString(4);
      
      Query1 = "insert into assignStudent (ass_nameProf,ass_idProf,ass_major,ass_nameStu,ass_idStu,ass_emailStu,ass_emailProf) value (?,?,?,?,?,?,?) ";
      
      pstmt = conn.prepareStatement(Query1);
      pstmt.setString(1, pro_nameProf);
      pstmt.setInt(2, pro_idProf);
      pstmt.setString(3, pro_major);
      pstmt.setString(4, stu_nameStu);
      pstmt.setInt(5, stu_idStu);
      pstmt.setString(6, stu_phone);
      pstmt.setString(7, stu_add);
   
      pstmt.executeUpdate();
   
      response.sendRedirect("mana_Assignment.jsp?idProf=" + idProf + "&id=" + id + "&pw=" + pw);
      
   } catch (SQLException e)
   {
      e.printStackTrace();
   } finally
   {
      //------------------------------- 생성된 객체 제거  pstmt.close();
      conn.close();
   }
%>