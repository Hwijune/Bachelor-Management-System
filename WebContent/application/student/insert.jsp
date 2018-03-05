<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>

<%
	//id값과 pw값 가져오기

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
    padding: 12px;
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
 width:85px;
	height:35px;
	
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

.timetable {
	font-weight:bold;
	text-decoration:none;
	font-family:Verdana, sans-serif;
	box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 4px 0px;
	o-box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 4px 0px;
	-moz-box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 4px 0px;
	-webkit-box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 4px 0px;
	background:#eeeeee;
	background:-o-linear-gradient(90deg, #eeeeee, #e1e1e1);
	background:-moz-linear-gradient( center top, #eeeeee 5%, #e1e1e1 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #eeeeee), color-stop(1, #e1e1e1) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eeeeee', endColorstr='#e1e1e1');
	background:-webkit-linear-gradient(#eeeeee, #e1e1e1);
	background:-ms-linear-gradient(#eeeeee, #e1e1e1);
	background:linear-gradient(#eeeeee, #e1e1e1);
	text-indent:0px;
	line-height:6px;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	color:#454045;
	width:107px;
	height:6px;
	padding:14px;
	border-color:#e1e1e1;
	border-width:1px;
	border-style:solid;
	cursor: pointer;
}

.timetable:active {
	box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 0 0px;
	o-box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 0 0px;
	-moz-box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 0 0px;
	-webkit-box-shadow:inset #fafafa 0px -19px 8px -1px,#a8a8a8 0px 0 0px;
	position:relative;
	top:4px
}

.timetable:hover {
	background:#e1e1e1;
	background:-o-linear-gradient(90deg, #e1e1e1, #eeeeee);
	background:-moz-linear-gradient( center top, #e1e1e1 5%, #eeeeee 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e1e1e1), color-stop(1, #eeeeee) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e1e1e1', endColorstr='#eeeeee');
	background:-webkit-linear-gradient(#e1e1e1, #eeeeee);
	background:-ms-linear-gradient(#e1e1e1, #eeeeee);
	background:linear-gradient(#e1e1e1, #eeeeee);
}
</style>
  
  </style>
  
  
<script languae="javascript">


	function delfunc(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		alert(name_by_id);
		location.href = 'delinputProc.jsp?delcode=' + name_by_id +'&id=' + <%=id%> + '&pw=' + <%=pw%>;
	}
	function openpdf(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		location.href = 'showpdf.jsp?delcode=' + name_by_id +'&id=' + <%=id%> + '&pw=' + <%=pw%>;

	}
	
	function OpenSchedule(aaa)
	{
		var winl = (screen.width - 800)/2;
		var wint = (screen.height - 600)/2;
		winprops = 'height='+600+',width='+800+',top='+wint+',left='+winl+',scrollbars=yes';
		ref = 'schedule.jsp?id=' + <%=id%>;
		schedule = 'schedule'
		window.open(ref,schedule,winprops)
	} 
	
		 </script>
</script>
<body >
<b><font face="한컴 윤고딕 240">수강신청 현황</font></b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<input type=button name=btn value="시간표 보기" class="timetable" onclick="OpenSchedule()"><br>
<table>
	<br>
	
	<thead>
	<tr>
		<td><b><font face="HY중고딕">과목코드</font></b></td>
		<td><b><font face="HY중고딕">과목명</font></b></td>
		<td><b><font face="HY중고딕">교수명</font></b></td>
		<td><b><font face="HY중고딕">강의실</font></b></td>
		<td><b><font face="HY중고딕">강의시간</font></b></td>
		<td><b><font face="HY중고딕">강의요일</font></b></td>
		<td><b><font face="HY중고딕">학점</font></b></td>
		<td><b><font face="HY중고딕">장소</font></b></td>
		<td><b><font face="HY중고딕">캠퍼스</font></b></td>
		<td><b><font face="HY중고딕">구분</font></b></td>
		<td><b><font face="HY중고딕">인원</font></b></td>
		<td><b><font face="HY중고딕">수강신청</font></b></td>
		<td><b><font face="HY중고딕">강의계획서</font></b></td>
	</tr>
	</thead>
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
			
			Query1 = "SELECT Student_idStudent,lecture_codeLecture FROM attendee ";
			
			pstmt = conn.prepareStatement(Query1);
			rs = pstmt.executeQuery();
			List<String> codelist = new ArrayList<String>();
			while (rs.next())
			{
				String idStu = rs.getString("Student_idStudent");
				String attcodeLect = rs.getString("lecture_codeLecture");
				
				if (idStu.equals(id))
				{
					codelist.add(attcodeLect);
				}
			}
			
			int b = 100;
			int c = 1000;
			Query2 = "SELECT * FROM lecture";
			pstmt = conn.prepareStatement(Query2);
			
			rs1 = pstmt.executeQuery();
			
			while (rs1.next())
			{
				String titlelect = rs1.getString("titleLecture");
				String codelect = rs1.getString("codeLecture");
				String timelect = rs1.getString("timeLecture");
				int gradelect = rs1.getInt("gradeLecture");
				int limitlect = rs1.getInt("limitLecture");
				String professorName = rs1.getString("profnameLecture");
				String roomlect = rs1.getString("roomLecture");
				String lectgrade = rs1.getString("gradeLecture");
				String days = rs1.getString("daysLecture");
				String area = rs1.getString("areaLecture");
				String campus = rs1.getString("campusLecture");
				String credit = rs1.getString("creditLecture");
				for (int i = 0; i < codelist.size(); i++)
				{
					if ((codelist.get(i)).equals(codelect))
					{
	%>
	
	<tr>
		<td><font face="나눔바른고딕"><%=codelect%></font></td>
		<td><font face="나눔바른고딕"><%=titlelect%></font></td>
		<td><font face="나눔바른고딕"><%=professorName%></font></td>
		<td><font face="나눔바른고딕"><%=roomlect%></font></td>
		<td><font face="나눔바른고딕"><%=timelect%></font></td>
		<td><font face="나눔바른고딕"><%=days%></font></td>
		<td><font face="나눔바른고딕"><%=gradelect%></font></td>
		<td><font face="나눔바른고딕"><%=area%></font></td>
		<td><font face="나눔바른고딕"><%=campus%></font></td>
		<td><font face="나눔바른고딕"><%=credit%></font></td>
		<td><font face="나눔바른고딕"><%=limitlect%></font></td>
		<td><input type=button value="삭제" name=<%=codelect%> id=<%=b%>
			onClick="delfunc(this);" class="button"></td>
		<td><input type=button value="강의계획서" name=<%=codelect%> id=<%=c%>
			onClick="openpdf(this);" class="button"></td>
	</tr>

	<%
		b++;
						c++;
					}
				}
			}
	%>
</table>
<%
	} catch (SQLException e)
	{
		e.printStackTrace();
		
	} finally
	{
		
		conn.close();
	}
%>
</body>
</html>