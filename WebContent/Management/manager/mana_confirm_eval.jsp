<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<title>학생 담당교수 배정내역</title>

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

table.t1 {
	width: 100%;
	border-top: 1px solid #df314d;
	border-collapse: collapse;
	font-family: "나눔바른고딕";
}

table.t1  th, td {
	border-bottom: 1px solid #df314d;
	padding: 12px;
	text-align: center;
}

table.t1 thead tr {
	background-color: #df314d;
	color: #ffffff;
}

table.t1 tbody tr:nth-child(2n) {
	background-color: #f6f6f6;
}

table.t1  tbody tr:nth-child(2n+1) {
	background-color: white;
}

table.t1  tbody tr:hover {
	background-color: #dcdcdc;
}

table.t2 {
	width: 30%;
	border: 1px solid #df314d;
	border-collapse: collapse;
	font-family: "나눔바른고딕";
}

table.t2  th, td {
	border-bottom: 1px solid #df314d;
	padding: 12px;
	text-align: center;
	background-color: white;
}

table.t2 thead th {
	background-color: #df314d;
	color: #ffffff;
}

.mainselection {
	overflow: hidden;
	width: 100px;
	-moz-border-radius: 9px 9px 9px 9px;
	-webkit-border-radius: 9px 9px 9px 9px;
	border-radius: 9px 9px 9px 9px;
	box-shadow: 1px 1px 11px #330033;
	background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat
		scroll 69px center;
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

.ch {
	overflow: hidden;
	width: 60px;
	-moz-border-radius: 9px 9px 9px 9px;
	-webkit-border-radius: 9px 9px 9px 9px;
	border-radius: 9px 9px 9px 9px;
	box-shadow: 1px 1px 11px #330033;
	background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat
		scroll 29px center;
	border: 0;
	color: black;
	background: transparent;
	font-size: 14px;
	font-weight: bold;
	padding: 2px 10px;
	width: 88px;
	*width: 69px;
	*background: white;
}

.sb {
	overflow: hidden;
	width: 180px;
	-moz-border-radius: 9px 9px 9px 9px;
	-webkit-border-radius: 9px 9px 9px 9px;
	border-radius: 9px 9px 9px 9px;
	box-shadow: 1px 1px 11px #330033;
	background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat
		scroll 149px center;
	border: 0;
	color: black;
	background: transparent;
	font-size: 14px;
	font-weight: bold;
	padding: 2px 10px;
	width: 208px;
	*width: 180px;
	*background: white;
}

.button {
	background-color: #f2f2f2;
	background-image: linear-gradient(to bottom, #f2f2f2, #f2f2f2);
	border: 1px solid #bfbfbf;
	box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px
		#f2f2f2, 0 2px 4px rgba(0, 0, 0, 0.2);
	color: #505050;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
	border-radius: 3px;
	cursor: pointer;
	display: inline-block;
	font-family: Verdana, sans-serif;
	font-size: 12px;
	font-weight: 400;
	line-height: 15px;
	width: 63px;
	height: 28px;
	transition: all 20ms ease-out;
	vertical-align: top;
}

.button:hover, .button:focus {
	background: #f2f2f2;
	border-color: #8c8c8c;
	box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px
		#f2f2f2;
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

<body>
	<div id="wrapper">
		<%
			//id값과 pw값 가져오기
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
		%>
		<div id="banner">
			<jsp:include page="../member/Banner.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<br>
		<div id="navi">
			<jsp:include page="../member/mana_navi.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<div id="contents">
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs1 = null;
				ResultSet rs2 = null;
				ResultSet rs3 = null;
				ResultSet rs4 = null;
				
				String Query1 = "";
				String Query2 = "";
				String Query3 = "";
				String Query4 = "";
				
				try
				{
					String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
					String jdbcId = "root";
					String jdbcPw = "rootpass";
					
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
			%>

			<FORM NAME="Addassign" METHOD=POST
				ACTION="mana_confirm_evalProc.jsp?id=<%=id%>&pw=<%=pw%>">
				<b>캠퍼스</b> &nbsp;<SELECT name="campus" class="ch">
					<OPTION value="C" SELECTED>충주
					<OPTION value="J">증평
					<OPTION value="W">의왕
				</SELECT> &nbsp;&nbsp;<b>대학</b> &nbsp;<SELECT name="daehak" SIZE="1"
					class="mainselection">
					<OPTION value="combine" SELECTED>융합기술대학
					<OPTION value="enginer">공과대학
					<OPTION value="inmun">인문사회대학
				</SELECT> &nbsp;&nbsp;<b>학과</b> &nbsp;<SELECT name="major" SIZE="1"
					class="mainselection">
					<%
						Query1 = "select nameProf,majorProf from professor group by majorProf"; //db에있는 학과 셀렉트태그에 넣기
							pstmt = conn.prepareStatement(Query1);
							rs1 = pstmt.executeQuery();
							
							while (rs1.next())
							{
								String nameprof = rs1.getString("nameProf");
								String majorprof = rs1.getString("majorProf");
					%>

					<OPTION value="" selected><%=majorprof%></OPTION>
					<%
						}
					%>
				</SELECT> &nbsp;&nbsp; <b>교수</b>&nbsp;<SELECT name="proname" SIZE="1"
					class="ch">
					<%
						//학과 이름으로 교수목록 부르기
							Query2 = "select nameProf from professor";
							pstmt = conn.prepareStatement(Query2);
							rs2 = pstmt.executeQuery();
							
							while (rs2.next())
							{
								String name = rs2.getString("nameProf");
					%>
					<OPTION value="" selected><%=name%></OPTION>
					<%
						}
					%>
				</SELECT> &nbsp;&nbsp;<b>과목명</b> &nbsp;<SELECT name="lect" SIZE="1"
					class="sb">
					<%
						//강의코드 강의명알기
							Query3 = "select codeLecture,titleLecture from lecture";
							pstmt = conn.prepareStatement(Query3);
							rs3 = pstmt.executeQuery();
							
							while (rs3.next())
							{
								int code = rs3.getInt("codeLecture");
								String title = rs3.getString("titleLecture");
					%>
					<OPTION value=<%=code%> selected><%=title%></OPTION>
					<%
						}
					%>
				</SELECT> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="확인"
					class="button"> <BR> <BR>
			</FORM>

			<TABLE class="t1">
				<thead>
					<TR>
						<Th>과목코드</Th>
						<Th>과목명</Th>
						<Th>평가점수</Th>
						<Th>단답형문항</Th>
					</TR>
				</thead>
				<tbody>
				<%
					int code = Integer.parseInt(request.getParameter("code"));
						String title = request.getParameter("title");
						
						Query4 = "select * from attendee where lecture_codeLecture=?";
						pstmt = conn.prepareStatement(Query4);
						pstmt.setInt(1, code);
						rs4 = pstmt.executeQuery();
						int sum = 0; // 평균점수합
						int n = 0; //카운트
						while (rs4.next())
						{
							int lectCode = rs4.getInt("lecture_codeLecture");
							String answer = rs4.getString("eval_shortanswer");
							if(answer == null)
							{
								answer = "미평가";
							}
							int score = rs4.getInt("eval_score");
				%>

					<TR>
						<TD><%=lectCode%></TD>
						<TD><%=title%></TD>
						<TD><%=score%></TD>
						<TD><%=answer%></TD>
					</TR>
					<%
						sum += score;
								n++;
							}
					%>
				</tbody>
			</TABLE>
			<br>
			<br>
			<TABLE class="t2" align="right">
				<thead>
					<tr>
						<Th>평점 총계</Th>
						<Th>평점 평균</Th>
					</tr>
				</thead>


				<tbody>
					<tr>
						<TD><%=sum%></TD>
						<TD><%=sum / n%></TD>
					</TR>
				</tbody>
			</TABLE>

			<%
				} catch (SQLException e)
				{
					e.printStackTrace();
				} finally
				{
					pstmt.close();
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