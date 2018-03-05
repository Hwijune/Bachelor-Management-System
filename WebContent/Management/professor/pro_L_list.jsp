<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("euc-kr");
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
  width: 75px;
  height: 30px;
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

	.mainselection {
   overflow:hidden;
   width:100px;
   -moz-border-radius: 9px 9px 9px 9px;
   -webkit-border-radius: 9px 9px 9px 9px;
   border-radius: 9px 9px 9px 9px;
   box-shadow: 1px 1px 11px #330033;
   background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 69px center;
   
    border: 0;
   color: black;
   background: transparent;
   font-size: 14px;
   font-weight: bold;
   padding: 2px 10px;
   width: 128px;
   *width: 100px;
   *background: white;
   
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
			//id값과 pw값 가져오기
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
		%>
<script>
	function getPost(aaa) {
		var theForm = document.FileUp;
		var name_by_id = document.getElementById(aaa.getAttribute('id')).getAttribute('name');
		theForm.action = "pro_L_listProc.jsp?id=<%=id%>&pw=<%=pw%>&code="+name_by_id;
		theForm.submit();
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
		<div id="contents">
			<form name="SugangSearch" method=post>
				<TABLE WIDTH=850 BORDER=0 ALIGN=left CELLSPACING=0 CELLPADDING=0>
					
						<center>&nbsp;<B><font face="맑은 고딕">학년도</font></B> &nbsp;&nbsp;<select name="Year" CLASS="mainselection">
								<option value="">2016</option>
								<option value="year" selected>2017</option>
								<option value="NextYear">2018</option>
						</select>
						

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<B><font face="맑은 고딕">학기</font></B> &nbsp;&nbsp;<select name="Semester" cLASS="mainselection">
								<option value="">1학기</option>
								<option value="Sem2" selected>2학기</option>
						</select>
						</center>
		
						
						</td>
					
					
					
				</TABLE>
			</form>
			<br> <br><B><font face="맑은 고딕">수강신청목록</font></B> <br> <br>

			<FORM NAME="FileUp" METHOD=POST	ENCTYPE="multipart/form-data">
				<table WIDTH=1000 BORDER=1 ALIGN=left CELLSPACING=0 CELLPADDING=1>
				<thead>
					<tr>
						<td><b><font face="HY중고딕">과목명</font></b></td>
						<td><b><font face="HY중고딕">과목코드</font></b></td>
						<td><b><font face="HY중고딕">시간</font></b></td>
						<td><b><font face="HY중고딕">학점</font></b></td>
						<td><b><font face="HY중고딕">교수이름</font></b></td>
						<td><b><font face="HY중고딕">강의실</font></b></td>
						<td><b><font face="HY중고딕">강의계획서</font></b></td>
						<td><b><font face="HY중고딕">파일등록</font></b></td>
						<td><b><font face="HY중고딕">등록여부</font></b></td>
					</tr>
					</thead>

					<%
						Connection conn = null;
						
						PreparedStatement pstmt = null;
						ResultSet rs2 = null;
						ResultSet rs3 = null;
						
						try
						{
							String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
							String jdbcId = "root";
							String jdbcPw = "rootpass";
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
							
							String Query2 = "SELECT nameProf from professor where idProf=" + id;
							pstmt = conn.prepareStatement(Query2);
							rs2 = pstmt.executeQuery();
							rs2.next();
							String name = rs2.getString(1);
							
							String Query3 = "SELECT * from lecture where profnameLecture='" + name + "'";
							pstmt = conn.prepareStatement(Query3);
							rs3 = pstmt.executeQuery();
							int cc = 0;
							while (rs3.next())
							{
								String lecture_titlelecture = rs3.getString("titleLecture");
								int lecture_codelecture = rs3.getInt("codeLecture");
								String lecture_timelecture = rs3.getString("timeLecture");
								int lecture_gradelecture = rs3.getInt("gradeLecture");
								String professor_nameprof = rs3.getString("profnameLecture");
								String lecture_roomlecture = rs3.getString("roomLecture");
								String check = rs3.getString("evalCheck");
					%>
					<tr>
						<td><font face="나눔바른고딕"><%=lecture_titlelecture%></font></td>
						<td><font face="나눔바른고딕"><%=lecture_codelecture%></font></td>
						<td><font face="나눔바른고딕"><%=lecture_timelecture%></font></td>
						<td><font face="나눔바른고딕"><%=lecture_gradelecture%></font></td>
						<td><font face="나눔바른고딕"><%=professor_nameprof%></font></td>
						<td><font face="나눔바른고딕"><%=lecture_roomlecture%></font></td>
						<td width=150><INPUT TYPE=FILE NAME="userfile" SIZE=30 ></td>
						<td><INPUT name=<%=lecture_codelecture%> TYPE=BUTTON id=<%=cc%> VALUE="파일 등록" class="button" onClick="getPost(this)"></td>
						<td width=70><%=check%></td>
					</tr>
					<%
					cc++;
						}
					%>

				</table>
			</form>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
	<%
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			rs2.close();
			rs3.close();
			pstmt.close();
			conn.close();
		}
	%>
</body>
</html>