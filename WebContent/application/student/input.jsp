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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
  table {
    width: 100%;
    border-top: 1px solid #df314d;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #df314d;
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
  tbody tr:hover { background-color:  #dcdcdc ; }
  
  strong {
  font-weight: bold;
}

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



	select {
			width: 7%;
			padding: 5px;
			border: solid 2px #D2691E;
			border-radius: 8px;
			background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
			-webkit-appearance: none; /* ����Ƽ�� ���� ���߱� */ 
			-moz-appearance: none; 
			appearance: none;
			}
			select::-ms-expand { 
   display: none;             
} 
	div.fixed {
			border: 2px solid white;
			width: 98%;
			position: fixed;
			top: 100px;
			right: 0;
		}
	
			

</style>

<script>
	function openboard(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		alert(name_by_id);
		location.href = 'addinputProc.jsp?code=' + name_by_id + '&id=' + <%=id%> + '&pw=' + <%=pw%>;
	}
	function openpdf(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		location.href = 'showpdf.jsp?delcode=' + name_by_id + '&id=' + <%=id%> + '&pw=' + <%=pw%>;
	}
</script>
<body>

<table>
	
	<thead>
	<tr>
		<td><b><font face="HY�߰��">�����ڵ�</font></b></td>
		<td><b><font face="HY�߰��">�����</font></b></td>
		<td><b><font face="HY�߰��">������</font></b></td>
		<td><b><font face="HY�߰��">���ǽ�</font></b></td>
		<td><b><font face="HY�߰��">���ǽð�</font></b></td>
		<td><b><font face="HY�߰��">���ǿ���</font></b></td>
		<td><b><font face="HY�߰��">����</font></b></td>
		<td><b><font face="HY�߰��">���</font></b></td>
		<td><b><font face="HY�߰��">ķ�۽�</font></b></td>
		<td><b><font face="HY�߰��">����</font></b></td>
		<td><b><font face="HY�߰��">�ο�</font></b></td>
		<td><b><font face="HY�߰��">������û</font></b></td>
		<td><b><font face="HY�߰��">���ǰ�ȹ��</font></b></td>
	</tr>
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
			int d = 2000;
			
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

		<td><font face="�����ٸ����"><%=codelect%></font></td>
		<td><font face="�����ٸ����"><%=titlelect%></font></td>
		<td><font face="�����ٸ����"><%=proname%></font></td>
		<td><font face="�����ٸ����"><%=roomlect%></font></td>
		<td><font face="�����ٸ����"><%=timelect%></font></td>
		<td><font face="�����ٸ����"><%=dayslect%></font></td>
		<td><font face="�����ٸ����"><%=gradelect%></font></td>
		<td><font face="�����ٸ����"><%=arealect%></font></td>
		<td><font face="�����ٸ����"><%=campuslect%></font></td>
		<td><font face="�����ٸ����"><%=creditlect%></font></td>
		<td><font face="�����ٸ����"><%=limitlect%></font></td>
		<td><input type=button  value="������û" name=<%=codelect%> id=<%=a%>
			onClick="openboard(this);" class="button" ></td>
		<td>
		
		<input type=button value="���ǰ�ȹ��" name=<%=codelect%> id=<%=d%>
			onClick="openpdf(this);" class="button"></td>
			
	</tr>
	<%
		d++;
				a++;
			}
	%>
</table>
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
 </body>
 </html>