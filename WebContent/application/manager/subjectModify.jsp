<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	//id���� pw�� ��������
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
table.type1 {
    width: 100%;
    border-top: 1px solid #df314d;
    border-collapse: collapse;
     font-family :"�����ٸ����";
  }
table.type1 th, td {
    border-bottom: 1px solid #df314d;
    padding: 4px;
    text-align: center;
  }
 table.type1 thead tr {
    background-color: #df314d;
    color: #ffffff;
  }
 table.type1 tbody tr:nth-child(2n) {
    background-color: #f6f6f6;
  }
 table.type1 tbody tr:nth-child(2n+1) {
    background-color: white;
  }
table.type1  tbody tr:hover { background-color:  #dcdcdc ; }
  
.button {
  background-color: #f2f2f2;
  background-image: linear-gradient(to bottom, #f2f2f2, #f2f2f2);
  border: 1px solid #bfbfbf;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2, 0 2px 4px rgba(0, 0, 0, 0.2);
  color: #505050;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
  border-radius: 3px;
  cursor: pointer;
  display: inline-block;
  font-family: Verdana, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 15px;
  transition: all 20ms ease-out;
  vertical-align: top;
  width:85px;
  height:35px;
	
}
.button:hover, .button:focus {
  background: #f2f2f2;
  border-color: #8c8c8c;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2;
}
.button:active {
  background: #f2f2f2;
  box-shadow: inset 0 2px 3px rgba(0, 0, 0, 0.2);
}
.button .fa {
  color: #bfbfbf;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
}



.button .fa {
  float: left;
  font-size: 14px;
  line-height: 20px;
  margin: -1px 8px 0 -4px;
  vertical-align: top;
}
.input {
			width: 60%;
			height:28px;
			margin: 3px 0;
			box-sizing: border-box;
			border: solid 1px black;
			border-radius: 5px;
			font-size: 14px;
			text-align: center;
			font-family :"���� �����240";
		}
	table.type03 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid white;
    border: none;
   font-family :"���� �����240";
	
  margin : 20px 10px;
}
table.type03 th {
    width: 95px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: black;
     border-left: 5px solid black;
    border-right: px solid white;
    border-bottom: 1px solid white;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid white;
    border-bottom: 1px solid white;
}
</style>

<script>
	function openpdf(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		alert(name_by_id);
		location.href = 'showpdf1.jsp?id='+<%=id%>+'&delcode='+name_by_id;
	}
</script>

	<FORM NAME="subjectModify" METHOD=POST ACTION="subjectModifyProc.jsp?id=<%=id%>&pw=<%=pw%>">
		
		<TABLE class="type03">
	 	
					<TR>
		
				 <th scope="row">�����</th>
				<TD><INPUT TYPE="text" class="input" name="title" placeholder="�����ͺ��̽�"></TD>
				<th scope="row">������</Th>
				<TD><INPUT TYPE="text" class="input" name="proname" placeholder="ȫ�浿"></TD>
				<th scope="row">�о�</Th>
				<TD><INPUT TYPE="text" class="input" name="credit" placeholder="����"></TD>
			</TR>

			<TR>
				<th scope="row">���ǽ�</Th>
				<TD><INPUT TYPE="text" class="input" name="room" placeholder="202"></TD>
				<th scope="row">���ǽð�</Th>
				<TD><INPUT TYPE="text" class="input" name="time" placeholder="4"></TD>
				<th scope="row">�����ڵ�</Th>
				<TD><INPUT TYPE="text" class="input"name="code" placeholder="1010"></TD>
			</TR>

			<TR>
				<th scope="row">���ǿ���</Th>
				<TD><INPUT TYPE="text" class="input" name="days" placeholder="��"></TD>
				<th scope="row">����</Th>
				<TD><INPUT TYPE="text" class="input" name="grade" placeholder="3"></TD>
				<th scope="row">������ȣ</Th>
				<TD><INPUT TYPE="text" class="input" name="idprof" placeholder="1001111"></TD>
			</TR>
			<TR>
				<th scope="row">���</Th>
				<TD><INPUT TYPE="text" class="input" name="area" placeholder="����������"></TD>
				<th scope="row">ķ�۽�</Th>
				<TD><INPUT TYPE="text" class="input" name="campus" placeholder="����"></TD>
				<th scope="row">�ο�</Th>
				<TD><INPUT TYPE="text" class="input" name="limit" placeholder="40"></TD>
			</TR>
		</TABLE>
		<p align="center">
			<INPUT TYPE="submit" VALUE="�����߰�" class="button">
		</p>
	</FORM>
	 <i class="fa fa-list-ul fa-lg" aria-hidden="true"></i>&nbsp;
<b><font face="���� ����� 240">������û ���Ǹ��</font></b>
	 <br> <br>
	<FORM NAME="subjectModify" METHOD=POST ACTION="subjectDeleteProc.jsp?id=<%=id%>&pw=<%=pw%>">
		<TABLE class="type1 ">
		<thead>
			<TR>
				<TD >&nbsp;����</TD>
				<td>�����</td>
				<td>������</td>
				<td>���ǽ�</td>
				<td>���ǽð�</td>
				<td>���ǿ���</td>
				<td>����</td>
				<td>���</td>
				<td>ķ�۽�</td>
				<td>�о�</td>
				<td>�ο�</td>
				<td>���ǰ�ȹ��</td>
			</TR>
			</thead>
			<%
				//---------------------------------- ���� �� ��ü ����
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs1 = null;
				
				String Query1 = "";
				
				try
				{
					//------------------------------- JDBC ����
					
					String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
					String jdbcId = "root";
					String jdbcPw = "rootpass";
					
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
					
					//------------------------------- ������ ������ ��ü�� ����
					Query1 = "SELECT * FROM lecture";
					
					pstmt = conn.prepareStatement(Query1);
					rs1 = pstmt.executeQuery();
					
					
					int a = 0;
					int d = 4000;
					
					//------------------------------- ��ȯ���� �̿��� ���ڵ� ��� ����
					while (rs1.next())
					{
						
						//--------------------------- �ʵ� ������ ����� ���
						int codelect = rs1.getInt("codeLecture");
						String titlelect = rs1.getString("titleLecture");
						String roomlect = rs1.getString("roomLecture");
						String timelect = rs1.getString("timeLecture");
						String dayslect = rs1.getString("daysLecture");
						int gradelect = rs1.getInt("gradeLecture");
						String arealect = rs1.getString("areaLecture");
						String campuslect = rs1.getString("campusLecture");
						String creditlect = rs1.getString("creditLecture");
						int limitlect = rs1.getInt("limitLecture");
						String proname = rs1.getString("profnameLecture");
			%>
			<tr>
				<TD>&nbsp;&nbsp;<INPUT TYPE="checkbox" value=<%=codelect%>
					name="checkcode"></TD>
				<td><%=titlelect%></td>
				<td><%=proname%>
				<td><%=roomlect%></td>
				<td><%=timelect%></td>
				<td><%=dayslect%></td>
				<td><%=gradelect%></td>
				<td><%=arealect%></td>
				<td><%=campuslect%></td>
				<td><%=creditlect%></td>
				<td><%=limitlect%></td>
				<td><input type=button value="���ǰ�ȹ��" name=<%=codelect%> id=<%=d%>
					onClick="openpdf(this);" class="button"></td>
			</tr>
			<%
			d++;
			a++;
				}
			%>
		</TABLE>
		<p align="center">
			<INPUT TYPE="submit" VALUE="�������" class="button">
		</p>
	</FORM>
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

</HTML>