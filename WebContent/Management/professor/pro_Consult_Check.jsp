<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>

<%request.setCharacterEncoding("euc-kr"); %>

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
	border: 1px solid white;
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

 table {
    width: 100%;
    border-top: 1px solid #df314d;
    border-collapse: collapse;
    font-family:"나눔바른고딕 ";
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
  width:92px;
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
</style>
			<%
				//id값과 pw값 가져오기
					
					String id = request.getParameter("id");
					String pw = request.getParameter("pw");
				
			%>
<script>
	function openboard(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		alert(name_by_id);
		location.href = 'pro_Consult_Input.jsp?code=' + name_by_id + '&idProf='+<%=id%>+'&id='+<%=id%>+'&pw='+<%=pw%>;
	}
</script>

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
				 <jsp:include page="../member/pro_navi.jsp" flush="false">
					<jsp:param name="id" value="<%=id%>" />
					<jsp:param name="pw" value="<%=pw%>" />
				</jsp:include>
			</div>
		<div id="contents" >
		
		<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				ResultSet rs1 = null;

				String Query1 = "";
				String Query2 = "";
				int Rno=1;

				
				
				try {
					String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
					String jdbcId = "root";
					String jdbcPw = "rootpass";

					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
					
					Query1 = "SELECT ass_idStu,ass_boolean FROM assignstudent WHERE ass_idProf=?" ;
					
					pstmt = conn.prepareStatement(Query1);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					List<String> idStulist = new ArrayList<String>();
					List<Integer> boollist = new ArrayList<Integer>();
					
					while (rs.next())
					{
						String ass_idStu = rs.getString("ass_idStu");
						int assbool = rs.getInt("ass_boolean");
						
						idStulist.add(ass_idStu);
						boollist.add(assbool);
					}

				%>
			<br><b><font face="한컴 윤고딕230">상담 이력 확인</font></b>
			<br><br>
		<TABLE>
		<thead>
		<TR align=center>
			<TD><B>번호</B></TD>
			<TD><B>이름</B></TD>
			<TD><B>학번</B></TD>
			<TD><B>상담여부</B></TD>
			<TD><B>상담입력</B></TD>
		</TR>
			</thead>				
		<%
		Query2 = "select ass_nameStu, ass_idStu from assignStudent where ass_idProf =? order by ass_idStu";
		//전체 배정 학생 리스트 출력	
		pstmt=conn.prepareStatement(Query2);
		pstmt.setString(1, id);
		rs1=pstmt.executeQuery();
		
		int aa=0;
					
		while (rs1.next()) 
		{ 
			String stu_name = rs1.getString("ass_nameStu");
			String stu_number = rs1.getString("ass_idStu");
			
			for (int i = 0; i < idStulist.size(); i++)
			{
				if ((idStulist.get(i)).equals(stu_number))
				{

			%>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Rno%></td>
				<td><%=stu_name%></td>
				<td><%=stu_number%></td>
				<td><input type=button value="상담이력입력" name=<%=stu_number%>
					id=<%=aa%> onClick="openboard(this);" class="button"></td>
				<%
					if (boollist.get(i) == 0)
					{
				%>
				<td>0회</td>
				<%
					} else
					  {
				%>
				<TD><%=boollist.get(i)%>회</TD>
			</tr>
			<%
						}
					}
				}
			aa++;
			Rno++;
		}
			%>
			
			</TABLE>
				
				<%
				} 
				
				catch (SQLException e)
				{
					e.printStackTrace();
					
				} finally
				{
					
					conn.close();
				}
			%>
		</div>
		<div id="footer" >
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>