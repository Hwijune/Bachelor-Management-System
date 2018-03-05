<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.util.*"%>



<%
request.setCharacterEncoding("euc-kr");
	//---------------------------------- 객체와 변수의 선언	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	String Query1 = " ";
	String Query2 = " ";
	String Query3 = " ";
	String Query4 = " ";
	
	try
	{
		//------------------------------- JDBC 설정
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
%>
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
  width:105px;
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
			<jsp:include page="../member/pro_navi.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<div id="contents">
			<center><B><font face="한컴 윤고딕230">성적 내역</font></B></center>
			<BR> <BR>


			<TABLE>
			<thead>
				<TR>
					<TD>과목코드</TD>
					<TD>교과목명</TD>
					<TD>학생이름</TD>
					<TD>학번</TD>
					<TD>학점</TD>
					<TD>학점입력</TD>
				</TR>
				</thead>
			<%
					//------------------------------- 질의의 수행 및 필드 값 추출
					
						
		
							
									
									
						Query1 = "select * from attendee,lecture where attendee.lecture_codeLecture=lecture.codeLecture AND Admin_professor_idProf="+id+"";
										
						pstmt = conn.prepareStatement(Query1);
									
						rs = pstmt.executeQuery();
						while (rs.next()){
							
						int codeLect = rs.getInt("codeLecture");
						String titlelect = rs.getString("titleLecture");					
						String profname = rs.getString("profnameLecture");		
						String att_grade = rs.getString("attendeeGrade");
						String idStu = rs.getString("Student_idStudent");
											
											
						Query2="SELECT nameStudent FROM student WHERE idStudent="+idStu+"";
						
						pstmt = conn.prepareStatement(Query2);
						rs1 = pstmt.executeQuery();
										    
						rs1.next();
											
						String nameStu = rs1.getString("nameStudent");
				%>
				<TR>
					<TD><%=codeLect%></TD>
					<TD><%=titlelect%></TD>
					<TD><%=nameStu%></TD>
					<TD><%=idStu%></TD>
					<TD><%=att_grade%></TD>
					<TD><input type=button name=profile value="학생 성적입력" class="button"
						onClick="javascript:location.href='../professor/pro_Grade_Input.jsp?idStu=<%=idStu%>&codeLect=<%=codeLect%>&id=<%=id%>&pw=<%=pw%>&nameStu=<%=nameStu%>&titlelect=<%=titlelect%>'"></TD>
				</TR>

				<%
					}
									
								
							
						
				%>
				
			</TABLE>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>

	<%
		}
		//------------------------------- 예외처리 및 객체의 종료
		catch (SQLException e)
		{
			e.printStackTrace();
			
		} finally
		{
			
			conn.close();
		}
	%>
</body>
</html>