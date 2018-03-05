<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>

	
	<%
	
	
    //---------------------------------- 객체와 변수의 선언	
	
    
    
    Connection conn = null;
	
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2= null;
	ResultSet rs3= null;
	ResultSet rs4 = null;
	ResultSet rs5 = null;
	
	
	
	
	String Query1 = " ";
	String Query2 = " ";
	String Query3 = " ";
	String Query4 = " ";
	String Query5 = " ";
	String Query6 = " ";
	
	
	try {
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
			<jsp:include page="../member/stu_navi.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<div id="contents">
			<center> <B><font face="맑은 고딕"> 시간표 <br> </font></B> </center> <br>
			<table border="1">
		
				<thead>
				<tr align=center>
					<th width="150">시간</th>
					<th width="150">월</th>
					<th width="150">화</th>
					<th width="150">수</th>
					<th width="150">목</th>
					<th width="150">금</th>
				</tr>
				</thead>
				<%
			       //------------------------------- 질의의 수행 및 필드 값 추출
			
		         String time[]={"09:00 ~ 09:30","09:30 ~ 10:00","10:00 ~ 10:30","10:30 ~ 11:00","11:00 ~ 11:30","11:30 ~ 12:00","12:00 ~ 12:30","12:30 ~ 13:00","13:00 ~ 13:30","13:30 ~ 14:00"
				 ,"14:00 ~ 14:30","14:30 ~ 15:00","15:00 ~ 15:30","15:30 ~ 16:00","16:00 ~ 16:30","16:30 ~ 17:00","17:00 ~ 17:30","17:30 ~ 18:00"};
		         String day[]={"월","화","수","목","금"};
		         
		         
		         for(int i=0; i<time.length; i++){
		        	 
		        	 %>		
			        <tr>
			        <th width="150"><%=time[i] %></th>
		        	<%
		        	for(int j=0; j<day.length; j++){
		        	
		        	%>
					<td width="150">
					
					<%
					
					Query1="SELECT count(*) as count, lecture.titleLecture as titleLecture, lecture.roomLecture as roomLecture, lecture.areaLecture as areaLecture, lecture.profnameLecture as profnameLecture FROM lecture, attendee WHERE lecture.codeLecture = attendee.lecture_codeLecture AND Student_idStudent="+id+" AND timeLecture LIKE '%/"+(i+1)+"/%' AND daysLecture='"+day[j]+"'";
					//lecture테이블과 attendee테이블을  비교해서 시간과 요일 조건에 매칭되는 행을  검색 
					pstmt = conn.prepareStatement(Query1);
					
					rs = pstmt.executeQuery();
					rs.next();			
			
					int count = rs.getInt("count");					
					String title = rs.getString("titleLecture");
				    String room=rs.getString("roomLecture");				
				    String area=rs.getString("areaLecture");
				    String profName=rs.getString("profnameLecture");
				    
				    if(count>0){
						%>
						<p align="center"><%=title%><br><%=profName %><br><%=area %><%=room %></p>
						</td>
						<%
					
					}else{//count가 0이면 빈공간 출력 
						%>
						<p align="center">&nbsp;<br>&nbsp;<br>&nbsp;</p>
						</td>
						<%
					}   	
			     }
			%>
		
		
			<%
	           }
		         
	
			%>
			</table>

			<p>&nbsp;</p>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
		
<%
	}
	
	//------------------------------- 예외처리 및 객체의 종료
	catch (SQLException e) {
		e.printStackTrace();

	} finally {

		conn.close();
	}
	
%>
	
</body>
</html>