<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

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
    border: 1px solid #dcdcdc;
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
		
table.t1 {
    width: 100%;
    border-top: 1px solid #df314d;
    border-collapse: collapse;
    font-family:"나눔바른고딕 ";
  }
table.t1   th, td {
    border-bottom: 1px solid #df314d;
    padding: 4px;
    text-align: center;
  }
table.t1   thead tr {
    background-color: #df314d;
    color: #ffffff;
  }
 table.t1  tbody tr:nth-child(2n) {
    background-color: #f6f6f6;
  }
 table.t1  tbody tr:nth-child(2n+1) {
    background-color: white;
  }
 table.t1  tbody tr:hover { background-color:  #dcdcdc ; }
  
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
  width:60px;
  height:30px;
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

table.type03 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    
    border: none;
   font-family :"한컴 윤고딕240";
   
  margin : 20px 10px;
}
table.type03 th {
    width: 95px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: black;
    border-top: 1px solid #df314d;
     border-left: 5px solid #df314d;
    border-right: 1px solid #df314d;
    border-bottom: 1px solid#df314d;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-top: 1px solid #df314d;
    border-right: 1px solid #df314d;
    border-bottom: 1px solid#df314d;
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
				<jsp:param name="pw" value="<%=pw%>" /></jsp:include>
		</div>
		<br>
		<div id="navi">
			<jsp:include page="../member/stu_navi.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" /></jsp:include>
		</div>
		<div id="contents">

			<center>
				<B> 상담이력</B>
			</center>
			<BR>
			<FORM NAME="Consult" METHOD=POST ACTION="stu_ConsultForm.jsp?id=<%=id%>&pw=<%=pw%>">
				<TABLE class="t1">

					<thead>
					<tr>
						<td><b><font face="HY중고딕">상담교수</font></b></td>
						<td><b><font face="HY중고딕">상담일자</font></b></td>
						<td><b><font face="HY중고딕">상담시간</font></b></td>
						<td><b><font face="HY중고딕">상담장소</font></b></td>
						<td><b><font face="HY중고딕">상담유형</font></b></td>
						<Td></TD>
					</TR>
					</thead>

					<%
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						ResultSet rs1 = null;
						
						String Query1 = "";
						String Query2 = "";
						
						int no = Integer.parseInt(request.getParameter("fno"));
						
						try
						{
							String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
							String jdbcId = "root";
							String jdbcPw = "rootpass";
							
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
							
							Query1 = "SELECT ass_nameProf,dateCounsel,timeCounsel,placeCounsel,typeCounsel,RcdNo FROM consult,assignStudent WHERE idStu =? AND ass_idStu=? order by dateCounsel desc";
							pstmt = conn.prepareStatement(Query1);
							pstmt.setString(1, id);
							pstmt.setString(2, id);
							rs = pstmt.executeQuery();
							
							if (no == 00)
							{
								Query2 = "SELECT ass_nameProf,dateCounsel,timeCounsel,placeCounsel,typeCounsel,contentCounsel FROM consult,assignStudent WHERE idStu =? AND ass_idStu=? order by dateCounsel desc limit 1";
								pstmt = conn.prepareStatement(Query2);
								pstmt.setString(1, id);
								pstmt.setString(2, id);
								rs1 = pstmt.executeQuery();
								rs1.next();
							}
							
							else
							{
								Query2 = "SELECT ass_nameProf,dateCounsel,timeCounsel,placeCounsel,typeCounsel,contentCounsel FROM consult,assignStudent WHERE idStu =? AND ass_idStu=? AND RcdNo=?";
								pstmt = conn.prepareStatement(Query2);
								pstmt.setString(1, id);
								pstmt.setString(2, id);
								pstmt.setInt(3, no);
								rs1 = pstmt.executeQuery();
								rs1.next();
							}
							while (rs.next())
							{
								String nameProf = rs.getString("ass_nameProf");
								int time = rs.getInt("timeCounsel");
								
								long date = rs.getLong("dateCounsel");
								SimpleDateFormat Current = new SimpleDateFormat("yyyy/MM/dd");
								String today = Current.format(date);
								
								String place = rs.getString("placeCounsel");
								String type = rs.getString("typeCounsel");
								
								int rno = rs.getInt("RcdNo");
					%>

					<TR>
						<td><font face="나눔바른고딕"><%=nameProf%></font></td>
						<td><font face="나눔바른고딕"><%=today%></font></td>
						<td><font face="나눔바른고딕"><%=time%></font></td>
						<td><font face="나눔바른고딕"><%=place%></font></td>
						<td><font face="나눔바른고딕"><%=type%></font></td>
						<TD>
							<%
							%><input type=button name=btn value="자세히" class="button"
							onClick="javascript:location.href='stu_ConsultForm.jsp?Rno=<%=rno%>&id=<%=id%>&pw=<%=pw%>'">
						</TD>
					</TR>

					<%
						}
					%>

				</TABLE>
			</FORM>

			<BR> <BR>
			<center>
				<B> 상세정보</B>
			</center>
			<BR>
			<TABLE class="type03">
				<%
					String NameProf = rs1.getString("ass_nameProf");
						int Time = rs1.getInt("timeCounsel");
						
						long Date = rs1.getLong("dateCounsel");
						SimpleDateFormat current = new SimpleDateFormat("yyyy/MM/dd");
						String Today = current.format(Date);
						
						String Place = rs1.getString("placeCounsel");
						String Type = rs1.getString("typeCounsel");
						String Content = rs1.getString("contentCounsel");
				%>

				<TR>
					<Th scope="row" ><b>상담교수</b></th>
					<TD colspan="3" WIDTH="200"><%=NameProf%></TD>
				</TR>

				<TR>
					<Th scope="row"" HEIGHT="35"><B>상담일</B></th>
					<TD WIDTH="200"><%=Today%></TD>
					<th scope="row"><B>상담시간</B></th>
					<TD WIDTH="200"><%=Time%></TD>
				</TR>

				<TR>
					<Th scope="row"><B>상담장소</B></th>
					<TD WIDTH="200"><%=Place%></TD>
					<th scope="row"><B>상담유형</B></th>
					<TD WIDTH="200"><%=Type%></TD>
				</TR>

				<TR>
					<Th scope="row"><b>상담내용</b></th>
					<TD colspan="3" WIDTH="200"><%=Content%></TD>
				</TR>
			</TABLE>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>
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