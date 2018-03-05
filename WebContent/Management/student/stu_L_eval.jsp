<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	border: 1px solid WHITE;
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
    padding-top: 5px;
    padding-bottom: 5px;
    border: 1px solid WHITE;
  }
 
		.disin{
		width: 50%;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #e9e9e9;
			border-radius: 8px;
			background-color: #e9e9e9;
		}
		
		.in {
		width: 50%;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #D2691E;
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
  width: 50px;
  height: 25px;
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
			-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
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
<%
	int StuId = 1344011; //초기 id값
	//id값과 pw값 가져오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<script>
	function openboard(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		alert(name_by_id);
		location.href = 'stu_L_evalInput.jsp?code=' + name_by_id + '&stuid='+<%=StuId%>+"&id="+<%=id%>+"&pw="+<%=pw%>;
	;
	}
</script>

<body>
	<div id="wrapper">
		<div id="banner">
			<jsp:include page="../member/Banner.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" /></jsp:include>
		</div>
		<br>
		<div id="navi">
			<jsp:include page="../member/stu_navi.jsp" flush="false"></jsp:include>
		</div>
		<div id="contents">
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				ResultSet rs1 = null;
				
				String Query1 = " ";
				String Query2 = " ";
				
				try
				{
					String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
					String jdbcId = "root";
					String jdbcPw = "rootpass";
					
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
					
					Query1 = "SELECT lecture_codeLecture,eval_boolean FROM attendee WHERE Student_idStudent=" + id;
					
					pstmt = conn.prepareStatement(Query1);
					rs = pstmt.executeQuery();
					
					List<String> codelist = new ArrayList<String>();
					List<String> boollist = new ArrayList<String>();
					while (rs.next())
					{
						String attcodeLect = rs.getString("lecture_codeLecture");
						String evalbool = rs.getString("eval_boolean");
						
						codelist.add(attcodeLect);
						boollist.add(evalbool);
					}
			%>
			<center><B><font face="맑은 고딕">강의평가정보 </font></B></center> <br>

			<table BORDER=1 ALIGN=left CELLSPACING=0 CELLPADDING=1>
			<thead>
				<tr align=center>
					<td><b><font face="HY중고딕">교과목명</font></b></td>
					<td><b><font face="HY중고딕">교수명</font></b></td>
					<td><b><font face="HY중고딕">입력</font></b></td>
					<td><b><font face="HY중고딕">입력 여부</font></b></td>
				</tr>
				</thead>
				<%
					Query2 = "SELECT * FROM lecture";
						pstmt = conn.prepareStatement(Query2);
						rs1 = pstmt.executeQuery();
						
						int aa = 0;
						while (rs1.next())
						{
							String titlelect = rs1.getString("titleLecture");
							String codelect = rs1.getString("codeLecture");
							String professorName = rs1.getString("profnameLecture");
							
							for (int i = 0; i < codelist.size(); i++)
							{
								if ((codelist.get(i)).equals(codelect))
								{
				%>
				<tr>
					<td><font face="나눔바른고딕"><%=titlelect%></font></td>
					<td><font face="나눔바른고딕"><%=professorName%></font></td>
					<td><input type=button value="입력" CLASS="button" name=<%=codelect%>
						id=<%=aa%> onClick="openboard(this);"></td>
					<%
						if (boollist.get(i).equals("X"))
										{
					%> 
					<td>X</td>
					<%
						} else
										{
					%>
					<TD><%=boollist.get(i)%></TD>
				</tr>
				<%
					}
								}
							}
							aa++;
						}
				%>

			</TABLE>
			<br> <br> <br> <br>
			<%
				} catch (SQLException e)
				{
					e.printStackTrace();
					
				} finally
				{
					
					conn.close();
				}
			%>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>