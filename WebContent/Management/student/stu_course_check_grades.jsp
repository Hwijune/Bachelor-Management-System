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
<%
	//id값과 pw값 가져오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<script>
	function openpdf(aaa) {
		var name_by_id = document.getElementById(aaa.getAttribute('id'))
				.getAttribute('name');
		alert('눌림');
		location.href = 'showpdf.jsp?delcode=' + name_by_id + '&id=' + <%=id%> + '&pw=' + <%=pw%>;
	}
</script>
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
			<form name="SugangSearch" method=post>
				
						<center>&nbsp;<B><font face="맑은 고딕">학년도 &nbsp;&nbsp;</font></B><select name="Year" CLASS="mainselection">
								<option value="">2016</option>
								<option value="year" selected>2017</option>
								<option value="NextYear">2018</option>
						</select>
						

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<B><font face="맑은 고딕"> 학기 &nbsp;&nbsp; </font></B><select name="Semester" CLASS="mainselection">
								<option value="">1학기</option>
								<option value="Sem2" selected>2학기</option>
						</select>
						</center>
				
			</form>
			 <br><br><center><B><font face="맑은 고딕"> 수강신청 목록 <br><br></font></center></B>

			<table>
	<thead>
	<tr>
		<td><b><font face="HY중고딕">과목명</font></b></td>
		<td><b><font face="HY중고딕">과목코드</font></b></td>
		<td><b><font face="HY중고딕">시간</font></b></td>
		<td><b><font face="HY중고딕">인원</font></b></td>
		<td><b><font face="HY중고딕">수강인원</font></b></td>
		<td><b><font face="HY중고딕">교수이름</font></b></td>
		<td><b><font face="HY중고딕">강의실</font></b></td>
		<td><b><font face="HY중고딕">강의계획서</font></b></td>
		<td><b><font face="HY중고딕">학점</font></b></td>
	</tr>
	</thead>
			<%
					//---------------------------------- 객체와 변수의 선언	
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					
					String Query1 = " ";
					String Query2 = " ";
					String Query3 = " ";
					
					try
					{ //------------------------------- JDBC 설정
						String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
						String jdbcId = "root";
						String jdbcPw = "rootpass";
						
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
						//------------------------------- 질의의 수행 및 필드 값 추출
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
						
						Query2 = "SELECT * FROM lecture";
						pstmt = conn.prepareStatement(Query2);
						rs1 = pstmt.executeQuery();
						
						int a = 0;
						int d = 2000;
						
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
							
							for (int i = 0; i < codelist.size(); i++)
							{
								if ((codelist.get(i)).equals(codelect))
								{
									Query3 = "select *from attendee where Student_idStudent="+id+" AND lecture_codeLecture=?";
									
									pstmt = conn.prepareStatement(Query3);
									pstmt.setString(1, codelect);
									
									rs2 = pstmt.executeQuery();
									while (rs2.next())
									{
										
										String att_grade = rs2.getString("attendeeGrade");
				%>
				<tr>
					<td><font face="나눔바른고딕"><%=titlelect%></font></td>
					<td><font face="나눔바른고딕"><%=codelect%></font></td>
					<td><font face="나눔바른고딕"><%=timelect%></font></td>
					<td><font face="나눔바른고딕"><%=gradelect%></font></td>
					<td><font face="나눔바른고딕"><%=limitlect%></font></td>
					<td><font face="나눔바른고딕"><%=professorName%></font></td>
					<td><font face="나눔바른고딕"><%=roomlect%></font></td>
					<td><input type=button value="강의계획서" name=<%=codelect%> id=<%=d%>
			onClick="openpdf(this);"></td>
					<td><%=att_grade%></td>
				</tr>
				<%
					d++;
				a++;}
								}
							}
						}
				%>
			</table>

		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>

	<%
		//------------------------------- 예외처리 및 객체의 종료
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

