<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*" %>
<%@ page import = "java.text.*" %>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>

<%
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs2 = null;
	String namestu = "";
	
	try
	{
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
%>

<style>
#menubar{
   
   padding: 15px;
   background-color: #df314d;

}

[class*='btn-'] {
   border-radius: 7px; <%-- �׵θ� --%>
   -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
     box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   color: #fff;
   display: inline-block;
   font-family: Arial, Helvetica, sans-serif;
   font-size: 14px;
   margin: 0px 7px 0px 0px; <%-- �� ������ �Ʒ� ���� --%>
   padding: 8px 13px; <%-- ��ü ���� --%>
   text-decoration: none;
   text-shadow: 0 1px 1px rgba(0, 0, 0, 0.075);
   
   -webkit-transition: background-color 0.1s linear;
   -moz-transition: background-color 0.1s linear;
   -o-transition: background-color 0.1s linear;
     transition: background-color 0.1s linear;   
}

   [class*='btn-']:hover {
      cursor: pointer;
   }

   .btn-red {
      background-color: rgb( 202, 49, 77 );
      border: 1px solid rgb( 255, 255, 255 );
   }
   
      .btn-red:hover {
         background-color: rgb( 231, 159, 170 );
      }
      
      .btn-red:active {
         background-color: rgb( 231, 159, 170 );
      }


</style>

<FORM NAME="Banner" METHOD=POST ACTION="#">
	<div id="menubar" style="text-align: right">
		 <INPUT type=BUTTON VALUE="�α׾ƿ�" style = "text-align:right;" class="btn-red" onClick="javascript:location.href='../../Login.jsp?choice=1'"> 
		 <INPUT type=BUTTON VALUE="Ȩ������" style = "text-align:right;" class="btn-red" onClick="javascript:location.href='../../Intro.jsp'">

		<%
			//������
				if (id.substring(2, 4).equals("00"))
				{
					String Query2 = "SELECT nameAdmin from admin where idAdmin=" + id;
					pstmt = conn.prepareStatement(Query2);
					rs2 = pstmt.executeQuery();
					rs2.next();
					namestu = rs2.getString("nameAdmin");
		%>
		<LABEL><span style="color:white"><%=namestu%></LABEL>
		<%
			}
				//����
				else if (id.substring(2, 4).equals("01"))
				{
					String Query2 = "SELECT nameProf from professor where idProf=" + id;
					pstmt = conn.prepareStatement(Query2);
					rs2 = pstmt.executeQuery();
					rs2.next();
					namestu = rs2.getString("nameProf");
		%>
		<LABEL><span style="color:white"><%=namestu%></LABEL>
		<%
			}
				//�л�
				else
				{
					String Query2 = "SELECT nameStudent from student where idStudent=" + id;
					pstmt = conn.prepareStatement(Query2);
					rs2 = pstmt.executeQuery();
					rs2.next();
					namestu = rs2.getString("nameStudent");
		%>
		<LABEL><span style="color:white"><%=namestu%></LABEL>
		<%
			}
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy�� MM�� dd�� E����");
		String today = simpleDate.format(new java.util.Date());
		%>
		<LABEL><span style="color:white"><%=today%></LABEL>
	</div>
</FORM>

<%
	} catch (SQLException e)
	{
		e.printStackTrace();
	} finally
	{
		rs2.close();
		pstmt.close();
		conn.close();
	}
%>