<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
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
		//---------------------------------- 변수 및 객체 선언
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		
		String Query1 = "";
		
		try
		{
			//------------------------------- JDBC 설정
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
			String jdbcId = "root";
			String jdbcPw = "rootpass";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
			
			//------------------------------- 질의의 생성과 객체의 생성
			Query1 = "SELECT * FROM lecture";
			
			pstmt = conn.prepareStatement(Query1);
			rs1 = pstmt.executeQuery();
			
			int a = 0;
			int d = 2000;
			
			//------------------------------- 순환문을 이용한 레코드 출력 시작
			while (rs1.next())
			{
				
				//--------------------------- 필드 데이터 추출과 출력
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

		<td><font face="나눔바른고딕"><%=codelect%></font></td>
		<td><font face="나눔바른고딕"><%=titlelect%></font></td>
		<td><font face="나눔바른고딕"><%=proname%></font></td>
		<td><font face="나눔바른고딕"><%=roomlect%></font></td>
		<td><font face="나눔바른고딕"><%=timelect%></font></td>
		<td><font face="나눔바른고딕"><%=dayslect%></font></td>
		<td><font face="나눔바른고딕"><%=gradelect%></font></td>
		<td><font face="나눔바른고딕"><%=arealect%></font></td>
		<td><font face="나눔바른고딕"><%=campuslect%></font></td>
		<td><font face="나눔바른고딕"><%=creditlect%></font></td>
		<td><font face="나눔바른고딕"><%=limitlect%></font></td>
		<td><input type=button  value="수강신청" name=<%=codelect%> id=<%=a%>
			onClick="openboard(this);" class="button" ></td>
		<td>
		
		<input type=button value="강의계획서" name=<%=codelect%> id=<%=d%>
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
		//------------------------------- 생성된 객체 제거 rs1.close(); pstmt.close();
		conn.close();
	}
 %>
 </body>
 </html>