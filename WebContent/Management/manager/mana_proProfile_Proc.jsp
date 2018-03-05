<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder" %>
<%
   request.setCharacterEncoding("euc-kr");

   int id = 1000001;
   String pw = "rootpass";
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
      
      int idprof = Integer.parseInt(request.getParameter("idprof"));
      //out.println(idprof);
      String name = request.getParameter("name");
      String decode_name = URLDecoder.decode(name, "euc-kr");
      //out.println(name);
      String phone = request.getParameter("phone");
      //out.println(콜);
      String add = request.getParameter("add");
      //out.println(add);
      String major = request.getParameter("major");
      //out.println(major);
      String sidprof = request.getParameter("sidprof");
      //out.println(sidprof);
      
      //String Query1="update professor set nameProf=?, phoneProf=?, addProf=?, majorProf=?, sidProf=?, where idProf=?";
      String Query2 = "SELECT * FROM professor where idProf=?";
      pstmt = conn.prepareStatement(Query2);
      pstmt.setInt(1, idprof);
      rs = pstmt.executeQuery();
      if (rs.next())
      {
         String Query1 = "UPDATE professor SET nameProf=?, addProf=?, majorProf=?, phoneProf=?, sidProf=? WHERE idProf=?";
         pstmt = conn.prepareStatement(Query1);
      
         pstmt.setString(1, name);
         pstmt.setString(2, add);
         pstmt.setString(3, major);
         pstmt.setString(4, phone);
         pstmt.setString(5, sidprof);
         pstmt.setInt(6, idprof);
         
         pstmt.executeUpdate();
         
         out.println("<script language=\"javascript\">");
         out.println("alert('수정되었습니다.')");
         out.println("location.href='mana_proProfile.jsp?id=" + id + "&pw=" + pw +"'");
         out.println("</script>");
         out.flush();
      } else
      {
         String Query3 = "Insert INTO professor(idProf, nameProf, addProf, majorProf, phoneProf, sidProf) VALUES (?,?,?,?,?,?)";
         pstmt = conn.prepareStatement(Query3);
         
         pstmt.setInt(1, idprof);
         pstmt.setString(2, name);
         pstmt.setString(3, add);
         pstmt.setString(4, major);
         pstmt.setString(5, phone);
         pstmt.setString(6, sidprof);
         
         
         pstmt.executeUpdate();
         out.println("<script language=\"javascript\">");
         out.println("alert('등록되었습니다.')");
         out.println("location.href='mana_proProfile.jsp?id=" + id + "&pw=" + pw +"'");
         out.println("</script>");
         out.flush();
      }
      //request.setAttribute("id", id);
      //request.setAttribute("pw", pw);
      //String retUrl = ("http://localhost:8080/Capstone/Management/manager/mana_proProfile.jsp?id="+id+"&pw="+pw+"");
      
      //response.sendRedirect("http://localhost:8080/Capstone/Management/manager/mana_proProfile.jsp?id="+id+"&pw="+pw+"");
   } catch (SQLException e)
   {
      e.printStackTrace();
   }
   
%>
