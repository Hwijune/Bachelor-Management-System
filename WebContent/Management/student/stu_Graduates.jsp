<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   Connection conn = null;

   PreparedStatement pstmt = null;
 
   ResultSet rs2 = null;
   ResultSet rs3 = null;
   ResultSet rs1 = null;
   ResultSet rs4 = null;
   ResultSet rs7 = null;
   ResultSet rs8 = null;
   ResultSet rs9 = null;
   try {
      String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
      String jdbcId = "root";
      String jdbcPw = "rootpass";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

      int id = Integer.parseInt(request.getParameter("id"));
	  String pw = request.getParameter("pw");
		
      String Query2 = "SELECT * from student where idStudent="+id;
      pstmt = conn.prepareStatement(Query2);
      rs2 = pstmt.executeQuery();

      rs2.next();
      String namestu = rs2.getString("nameStudent");
      String sidstu = rs2.getString("sidStudent");
      int idstu = rs2.getInt("idStudent");
      String phonestu = rs2.getString("phoneStudent");
      String majorstu = rs2.getString("majorStudent");
      String profstu = rs2.getString("profStudent");
      String addstu = rs2.getString("addStudent");
      Date enterdatestu = rs2.getDate("enterdateStudent");
     
      
      String Query3 = "SELECT lecture_codeLecture FROM attendee where Student_idStudent=?";
      pstmt = conn.prepareStatement(Query3);
      pstmt.setInt(1,id);
      rs3 = pstmt.executeQuery();
      //out.println(id);
      ArrayList<String> lectnames = new ArrayList<String>();

      while (rs3.next()) {
         String Query7 = "SELECT titleLecture FROM lecture where codeLecture=?";
         pstmt = conn.prepareStatement(Query7);
         pstmt.setInt(1,rs3.getInt("lecture_codeLecture"));
         rs7 = pstmt.executeQuery();
         rs7.next();
         lectnames.add(rs7.getString("titleLecture"));
      }
  
      
      String Query1 = "SELECT creditLecture FROM lecture";
      pstmt = conn.prepareStatement(Query1);
      rs1 = pstmt.executeQuery();

      rs1.next();
      String lecturecredit = rs1.getString("creditLecture");
      
      String Query4 = "SELECT  codeLecture ,creditLecture,gradeLecture FROM lecture";
      pstmt = conn.prepareStatement(Query4);
      rs4 = pstmt.executeQuery();

      String major_Require = "����";
      String major_Select = "����";
      String cult = "����";
      String arithme = "����";
      int m_RgradeLect = 0;
      int m_SgradeLect = 0;
      int cugradeLect = 0;
      int algradeLect = 0;
      int total = 0;
      while (rs4.next()) {

         String creditLect = rs4.getString("creditLecture");
         int gradeLect = rs4.getInt("gradeLecture");
         int codeLect = rs4.getInt("codeLecture");

         String Query5 = "SELECT  lecture_codeLecture FROM attendee";
         pstmt = conn.prepareStatement(Query5);
         rs1 = pstmt.executeQuery();
         while (rs1.next()) {

            int codelect = rs1.getInt("lecture_codeLecture");

            if (codelect == (codeLect)) {
               if (creditLect.equals("����")) {
                  m_RgradeLect = m_RgradeLect + gradeLect;
               } else if (creditLect.equals("����")) {
                  m_SgradeLect = m_SgradeLect + gradeLect;
               } else if (creditLect.equals("����")) {
                  cugradeLect = cugradeLect + gradeLect;
               } else if (creditLect.equals("����")) {
                  algradeLect = algradeLect + gradeLect;
               } else {

               }
            }
            total = m_RgradeLect + m_SgradeLect + cugradeLect + algradeLect;

         }
      }
      String Query9 = "SELECT warningStudent FROM student";
      pstmt = conn.prepareStatement(Query9);
      rs9 = pstmt.executeQuery();
      rs9.next();
      String warningPrivate = rs9.getString("warningStudent");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
#wapper {
   left: 10px;
   top: 10px;
   border: 1px solid;
   padding: 5px;
}

#banner {
   left: 10px;
}

#navi {
   position: absolute;
   width: 250px;
   height: 90%;
}

#contents {

   padding: 10px;
   position: absolute;
   left: 290px;
   width: 78%;
   height: 80%;
   overflow: scroll;
}

#footer {
   padding: 18px;
   position: absolute;
   left: -18px;
   top: 90%;
   width: 100%;
   overflow: auto;
}
#tt
{
overflow:scroll;
}

table {
    width: 100%;
    padding-top: 5px;
    padding-bottom: 5px;
    border: 1px solid WHITE;
  }
 
		.disin{
		width: 20%;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #e9e9e9;
			border-radius: 8px;
			background-color: #e9e9e9;
		}
		
		.in {
		width: 20%;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #9B8281;
			border-radius: 8px;
		}
		
th, td {
    
    padding: 4px;
    text-align: center;
  }
  thead tr {
    background-color: #df314d;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #f6f6f6;
  }
  tbody tr:nth-child(2n+1) {
    background-color: white;
  }
  
  strong {
  font-weight: bold;
}

</style>
<body>
   <div id="wrapper">
      <div id="banner">
         <jsp:include page="../member/Banner.jsp" flush="false">
            <jsp:param name="id" value="<%=id%>" />
            <jsp:param name="pw" value="<%=pw%>" />
         </jsp:include>
      </div>
      <br>
      <div id="navi">
         <jsp:include page="../member/stu_navi.jsp" flush="false">
            <jsp:param name="id" value="<%=id%>" />
            <jsp:param name="pw" value="<%=pw%>" />
         </jsp:include>
      </div>
      <div id="contents">
         <P><b><font face="HY�߰��">���� �ڰ�����</font></b>
         <HR COLOR="#df314d" size="3"></HR>
         </P>

         <form>
          
            ����&nbsp; <INPUT TYPE="text" NAME="name" value="<%=namestu%>" class="disin" readonly>
            </textarea>
            &nbsp;&nbsp;&nbsp; �ֹε�Ϲ�ȣ <INPUT TYPE="text" NAME="sid" value="<%=sidstu%>" class="disin" readonly>
            </textarea>
            <br> �й�&nbsp; <INPUT TYPE="text" NAME="id" value="<%=idstu%>" class="disin" readonly>
            </textarea>
            <br> �а�&nbsp; <INPUT TYPE="text" NAME="major" value="<%=majorstu%>" class="disin" readonly>
            </textarea>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �������� <INPUT TYPE="text" NAME="prof" value="<%=profstu%>" class="disin" readonly> <br><br><br>
           <div id="p"> <B><font face="���� ���"> �̼����� </font></B>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
               
            %>
            <div id="tt">
            <table width="400" BORDER="1"CELLPADDING="5" Align="left">
            
         <%for (int i = 0; i < lectnames.size(); i++) {
               String a = lectnames.get(i);%>
         
          <tr><td><%=a%></td></tr>
         <%}%>
          
         </table>
         </div>
         <br><br>
         <br><B><font face="HY�߰��"> ���̼����� </font></B><br>
         <div id="tt">
         <table width="300" BORDER="1"CELLPADDING="5" ALIGN="center">
 <%
         String Query8 = "SELECT titleLecture FROM Lecture where codeLecture NOT IN (SELECT DISTINCT lecture_codeLecture FROM attendee) AND creditLecture='����'";
         pstmt = conn.prepareStatement(Query8);
         rs8 = pstmt.executeQuery();
      
          
         while(rs8.next()){
            String b =rs8.getString("titleLecture");
            
         %>
         
            <tr><td>
            <%=b%>
            </td></tr>
         <%}
         %></table>
         </div></div> 
            <br> <br>

<div style="float: left;"><B><font face="���� ���">�л��������</font></B></div><br><br>
      <table WIDTH="400" BORDER="1" CELLPADDING="5" ALIGN="Left">
      <tr>
         <td>�л���Ƚ��</td>
         <td><%=warningPrivate%>
         </td>
         </tr>
         </table>
         
        <br><br><br><br>
         <div style="float: left;"><B><font face="���� ���">�������</font></B></div><br><br>
            <table WIDTH="600" BORDER="1" CELLPADDING="5" ALIGN="Left">
               <tr>
                  <td>������������</td>
                  <td>������������</td>
                  <td>���米������</td>
                  <td>������������</td>
               </tr>
               <tr>
                  <td><%=m_RgradeLect + m_SgradeLect%></td>
                  <td><%=70 - (m_RgradeLect + m_SgradeLect)%></td>
                  <td><%=cugradeLect%></td>
                  <td><%=70 - cugradeLect%></td>
               </tr>

               <tr>
                  <td>����</td>
                  <td>����</td>
                  <td>����</td>
                  <td>�հ�</td>
               </tr>
               <tr>
                  <td><%=m_RgradeLect%></td>
                  <td><%=m_SgradeLect%></td>
                  <td><%=cugradeLect%></td>
                  <td><%=total%></td>

               </tr>
            </table>
      </div>
      
      <div id="footer">
         <jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
      </div>
   </div>
   <%
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         rs2.close();
         rs3.close();
         rs4.close();
         rs7.close();
         rs8.close();
         rs9.close();
         pstmt.close();
         conn.close();

      }
   %>
   </form>
</body>
</html>