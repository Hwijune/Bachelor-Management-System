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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
	width: 79%;
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
table.type09 {
   
	 width: 98%;
    border: 3px solid white;
	
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: black;
    border-bottom: 4px solid #df314d;
}
table.type09 tbody th {
    width: 80px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 250px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid white;
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
  width:55px;
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

.but {
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
  width:63px;
  height:28px;
}
.but:hover, .but:focus {
  background: #f2f2f2;
  border-color: #8c8c8c;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2;
}
.but:active {
  background: #f2f2f2;
  box-shadow: inset 0 2px 3px rgba(0, 0, 0, 0.2);
}
.but .fa {
  color: #bfbfbf;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
}



.but .fa {
  float: left;
  font-size: 14px;
  line-height: 20px;
  margin: -1px 8px 0 -4px;
  vertical-align: top;
}

 table.type1 {
    width: 98%;
    border-top: 1px solid #df314d;
    border-collapse: collapse;
    font-family :"나눔바른고딕";
  }
   table.type01 th, td {
    border-bottom: 1px solid #df314d;
    padding: 8px;
    text-align: center;
  }
 table.type01 thead tr {
    background-color: #df314d;
    color: #ffffff;
  }
  table.type01 tbody tr:nth-child(2n) {
    background-color: #f6f6f6;
  }
  table.type01 tbody tr:nth-child(2n+1) {
    background-color: white;
  }
   table.type01 tbody tr:hover { background-color:  #dcdcdc ; }
   
   .input {
			height:26px;
			
			text-align :center;
			box-sizing: border-box;
			border: solid 1px gray;
			border-radius: 3px;
			font-size: 14px;
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
     font-family :"한컴 윤고딕230";
   
}

.ch {
   overflow:hidden;
   width:60px;
   -moz-border-radius: 9px 9px 9px 9px;
   -webkit-border-radius: 9px 9px 9px 9px;
   border-radius: 9px 9px 9px 9px;
   box-shadow: 1px 1px 11px #330033;
   background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 29px center;
   
    border: 0;
   color: black;
   background: transparent;
   font-size: 14px;
   font-weight: bold;
   padding: 2px 10px;
   width: 88px;
   *width: 69px;
   *background: white;
     font-family :"한컴 윤고딕230";
}
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

			<!-- 추가부분 -->
			<%
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet crs1=null;
		ResultSet crs2=null;
		ResultSet crs3=null;
		
		ResultSet srs1=null;
		ResultSet srs2=null;
		
		ResultSet rs1=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		
		String cQuery1="";
		String cQuery2="";
		String cQuery3="";
		
		String sQuery1="";
		String sQuery2="";
		
		String Query1="";
		String Query2="";
		String Query3="";
		

		int IDprof=Integer.parseInt(request.getParameter("idProf"));//mana_navi.jsp에서 전달된 파라미터 값 추출
		                                                            //mana_AssignmentSearch.jsp에서 전달된 파라미터 값 추출
		                                                            
		
			 
		
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/mydb";
			String jdbcId="root";
			String jdbcPw="rootpass";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn =DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
			
			cQuery1="select nameProf from professor group by nameProf";//db에 교수 테이블에 있는 교수명 셀렉트태그에 넣기
			cQuery2="select idProf from professor group by idProf";//db에 교수 테이블에 있는 교수번호 셀렉트태그에 넣기
			cQuery3="select majorProf from professor group by majorProf";//db에 교수 테이블에 있는 교수번호 셀렉트태그에 넣기
			
			sQuery1="select nameStudent from student group by nameStudent";//db에 학생 테이블에 있는 학생명 셀렉트태그에 넣기
			sQuery2="select idStudent from student group by idStudent";//db에 학생 테이블에 있는 학생번호 셀렉트태그에 넣기
			
			
			
			pstmt=conn.prepareStatement(cQuery1);
			crs1=pstmt.executeQuery();
			pstmt=conn.prepareStatement(cQuery2);
			crs2=pstmt.executeQuery();
			pstmt=conn.prepareStatement(cQuery3);
			crs3=pstmt.executeQuery();
			
			pstmt=conn.prepareStatement(sQuery1);
			srs1=pstmt.executeQuery();
			pstmt=conn.prepareStatement(sQuery2);
			srs2=pstmt.executeQuery();
			
		
			
			
			%>
			<i class="fa fa-plus-square fa-lg" aria-hidden="true"></i><b>&nbsp;&nbsp;<font size=3 face="나눔바른고딕">배정학생 추가</font></b>
			<FORM NAME="Addassign" METHOD=POST ACTION="mana_AddassignProc.jsp?id=<%=id%>&pw=<%=pw%>">
				<br><center><font face="한컴 윤고딕230"><b>교수명</font></b> <SELECT name="pro_col" class="ch">
					<OPTION value="C" SELECTED>교수명 
					
					<%
					while(crs1.next())
					{
						String nameProf=crs1.getString("nameProf");	//필드 값 추출
						%>
										
						<OPTION value="<%= nameProf%>"><%= nameProf%>


						<% 
								}
								
						%>
					
				</SELECT> 
				
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b>교수번호 </b></font><SELECT name="pro_numcol" SIZE="1" class="mainselection">
					<OPTION value="combine" SELECTED>교수번호
					<%
					while(crs2.next())
					{
						int idProf=crs2.getInt("idProf");	//필드 값 추출
						%>
										
						<OPTION value="<%= idProf%>"><%=idProf%>
						<% 
								}				
					
					%>
				</SELECT> 
				
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b>학과</b></font>&nbsp;&nbsp;<SELECT name="pro_majorcol" SIZE="1" class="mainselection">
					<OPTION value="combine" SELECTED>학과
					<%
					while(crs3.next())
					{
						String majorProf=crs3.getString("majorProf");	//필드 값 추출
						%>
										
						<OPTION value="<%= majorProf%>"><%=majorProf%>
						<% 
								}				
					
					%>
				</SELECT> 
				
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b>학생명</b></font> <SELECT name="stu_col" SIZE="1" class="mainselection">
					<OPTION value="" selected>학생명			
				<% 	
			while(srs1.next())
			{
				String nameStudent=srs1.getString("nameStudent"); //필드 값 추출
	%>
					
					<OPTION value="<%= nameStudent%>"><%= nameStudent%>

						<% 
			}			
	%>
					
				</SELECT>
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b> 학번</font></b> <SELECT name="stu_numcol" SIZE="1" class="ch">
					<OPTION value="" selected>학번

						<% 	 		
			while(srs2.next())
			{
		
				int idStudent=srs2.getInt("idStudent");	//필드 값 추출
	%>
					
					<OPTION value="<%= idStudent%>"><%= idStudent%>


						<% 
			}
			
	%>
					
				</SELECT>
				
			
					&nbsp;&nbsp;&nbsp;<INPUT TYPE="submit" VALUE="추가" class="button">
			</center>
			</FORM>

<hr></hr>
			<br><Br><br>
			<i class="fa fa-list-ul fa-lg" aria-hidden="true"></i><b>&nbsp;&nbsp;<font size=3 face="나눔바른고딕">담당교수 배정내역</font></b>

			
			
			<% 
			

			Query1="select ass_major from assignStudent group by ass_major"; //db에있는 학과 셀렉트태그에 넣기
			Query2="select ass_nameProf from assignStudent group by ass_nameProf"; //db에있는 교수이름 셀렉트태그에 넣기
			
			if(IDprof==8301002)//지정한 교수번호랑 값이같으면
			{
				Query3="select * from assignStudent where ass_nameProf ='김공과'"; //초기화면 출력
			}
			else
			{
				//검색페이지에서 얻은 교수번호를 저장
				Query3="select * from assignStudent where ass_idProf="+IDprof; //검색한 내용 출력
			}
			
			pstmt=conn.prepareStatement(Query1);
			rs1=pstmt.executeQuery();
			
		    pstmt=conn.prepareStatement(Query2);		
			rs2=pstmt.executeQuery();
		
			
			pstmt=conn.prepareStatement(Query3);		
			rs3=pstmt.executeQuery();
			
	%>

			<!-- 검색부분 -->
			<form name="mana_Assignment_Search" method=post	ACTION="mana_AssignmentSearch.jsp?id=<%=id%>&pw=<%=pw%>">

				
<center>
				<font face="한컴 윤고딕230"><b>캠퍼스</font></b> <SELECT name="campus" class="ch">
					<OPTION value="C" SELECTED>충주
					<OPTION value="J">증평
					<OPTION value="W">의왕
				</SELECT> 
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b>대학 </b></font><SELECT name="daehak" SIZE="1" class="mainselection">
					<OPTION value="combine" SELECTED>융합기술대학
					<OPTION value="enginer">공과대학
					<OPTION value="inmun">인문사회대학
				</SELECT> 
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b>학과</b></font> <SELECT name="major_column" SIZE="1" class="mainselection">
					<OPTION value="" selected>학과

						<% 	
			while(rs1.next())
			{
				String ass_major=rs1.getString("ass_major"); //필드 값 추출
	%>
					
					<OPTION value="<%= ass_major%>">
						<%= ass_major%>

						<% 
			}			
	%>
					
				</SELECT>
				&nbsp;&nbsp;<font face="한컴 윤고딕230"><b> 교수</font></b> <SELECT name="professor_column" SIZE="1" class="ch">
					<OPTION value="" selected>교수

						<% 	 		
			while(rs2.next())
			{
		
				String ass_nameProf=rs2.getString("ass_nameProf");	//필드 값 추출
	%>
					
					<OPTION value="<%= ass_nameProf%>"><%= ass_nameProf%>


						<% 
			}
			
	%>
					
				</SELECT> &nbsp;&nbsp;&nbsp;&nbsp;<input type=submit name=search value="확인" class="but">
</center>
			</form>

			<!-- 삭제부분 -->
			<form name="mana_Assignment" method=post
				action="mana_DeleteassignProc.jsp?id=<%=id%>&pw=<%=pw%>">

				<table class="type1">
				<thead >
					<tr>
						<td BGCOLOR="#df314d"  width=120 align=center ><b><font color="white">선택</font></b></td>
						<td BGCOLOR="#df314d" width=50  align=center><b><font color="white">교수명</font></b></td>
						<td BGCOLOR="#df314d" width=120 align=center><b><font color="white">교수번호</font></b></td>
						<td BGCOLOR="#df314d" width=120 align=center><b><font color="white">학과</font></b></td>
						<td BGCOLOR="#df314d" width=120 align=center><b><font color="white">학생</font></b></td>
						<td BGCOLOR="#df314d" width=120 align=center><b><font color="white">학번</font></b></td>
						
					</tr>
					</thead>
					<%
			while(rs3.next())
			{
				String pro_name=rs3.getString("ass_nameProf");
				int pro_number=rs3.getInt("ass_idProf");
				String major=rs3.getString("ass_major");
				String std_name=rs3.getString("ass_nameStu");
				int std_number=rs3.getInt("ass_idStu");
				
	%>
<tbody>
					<tr>
						<td>&nbsp;&nbsp;<INPUT TYPE="checkbox" name="checkcode" value="<%=std_number%>">
						</td>
						<!--체크박스의 값을 유일한 값인 학번으로 잡아줌 -->
						<td><%=pro_name%></td>
						<td><%=pro_number%></td>
						<td><%=major %></td>
						<td><%=std_name %></td>
						<td><%=std_number %></td>
						
					</tr>

					<%
	       }
	%>
	</tbody>
				</table>
				<p align="center">
					<INPUT TYPE="submit" name="delete" VALUE="삭제" class="button">
				</p>

			</form>

			<%
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
		 if(rs3 != null) 
		 try{rs3.close();}catch(SQLException sqle){}
	
		 if(rs2 != null) 
		 try{rs2.close();}catch(SQLException sqle){}
		 
		 if(rs1 != null) 
			 try{rs1.close();}catch(SQLException sqle){}

		 if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}

		 if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
		}
	%>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>