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
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	
	String Query1 = " ";
	String Query2 = " ";
	String Query3 = " ";
	String Query4 = " ";
	String Query5 = " ";
	
	try
	{//------------------------------- JDBC 설정
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
    border: 1px solid white;
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
    background-color: #fb5c73;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #f6f6f6;
  }
  tbody tr:nth-child(2n+1) {
    background-color: white;
  }
  
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

			<P><center><td><b><font face="HY중고딕">성적조회</font></b></td></center>
			</H1>
			</P>

			<b><font face="HY중고딕"> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 학번별 성적계 </font></b>
			<table border="1">

				<tr>
					<td colspan="4"><center>성적내역</center></td>
				</tr>

				<tr>
					<td>취득학점</td>
					<td>평점평균</td>
					<td>백점환산</td>
				</tr>

			
				<%
			
				int Grade =0;
				int ReGrade =0;
				int GetGrade=0;
				
				
			//------------------------------- 질의의 수행 및 필드 값 추출
		
			
			
			    Query3= "SELECT  gradeLecture, codeLecture FROM attendee,lecture where attendee.lecture_codeLecture=lecture.codeLecture AND attendee.Student_idStudent="+id+"";
			    pstmt = conn.prepareStatement(Query3);
			    rs2= pstmt.executeQuery();
			    while(rs2.next()){

				int LectGrade=rs2.getInt("gradeLecture");
				String Lectcode=rs2.getString("codeLecture");
				
				
				
				Query4 = "UPDATE attendee SET Stuid_getGrade=? WHERE Student_idStudent=? AND lecture_codeLecture=?";	
				pstmt = conn.prepareStatement(Query4);
				
				pstmt.setInt(1,LectGrade);
				pstmt.setString(2,id);
				pstmt.setString(3,Lectcode);
							
				pstmt.executeUpdate();
							
				ReGrade=ReGrade+LectGrade;
				GetGrade=ReGrade;			
							
				}
			    
			   
		
				Query5= "SELECT attendeeGrade,Stuid_getGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='F'";
				pstmt = conn.prepareStatement(Query5);
				rs4= pstmt.executeQuery();
					    
			    while(rs4.next()){
					    	
					   
					     	
				String att_Grade =rs4.getString("attendeeGrade");
				int Getgrade =rs4.getInt("Stuid_getGrade");
					    
						  
				GetGrade=ReGrade-Getgrade;
						  
				}
			    
				
			    
				Query4="SELECT * FROM student WHERE idStudent="+id+"";
				pstmt = conn.prepareStatement(Query4);
				rs3= pstmt.executeQuery();
				
			    rs3.next();
			
				int termGrade17_01 =rs3.getInt("17_1_termGrade");
				int termGrade16_02 =rs3.getInt("16_2_termGrade");
				int termGrade16_01 =rs3.getInt("16_1_termGrade");
				double termAverGrade17_01 =rs3.getDouble("17_1_termAverGrade");
				double termAverGrade16_02 =rs3.getDouble("16_2_termAverGrade");
				double termAverGrade16_01 =rs3.getDouble("16_1_termAverGrade");
				
				Grade=GetGrade+termGrade17_01+termGrade16_02+termGrade16_01;
						
								
				double attgrade=0;
				
				double APlusgrade=0;
				double Agrade=0;
				double BPlusgrade=0;
			    double Bgrade=0;
			    double CPlusgrade=0;
			    double Cgrade=0;
				double Dgrade=0;
				double Fgrade=0;
				 
			    double gradeChange=0;
			    double all_attGrade=0;
			 
		
			    //A+
			    Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='A+'";
			    pstmt = conn.prepareStatement(Query5);
			    rs4= pstmt.executeQuery();
		    
		    
		    
		        while(rs4.next()){
			      	String attGrade = rs4.getString("attendeeGrade");
			    	
			    	
			    	APlusgrade=APlusgrade+4.5;
			    }
			    //A
				Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='A'";
			    pstmt = conn.prepareStatement(Query5);
			    rs4= pstmt.executeQuery();
		    
		        while(rs4.next()){
			   	  	String attGrade = rs4.getString("attendeeGrade");
			    	
			    	
			      	Agrade=Agrade+4.0;
		      	}
		        
		        //B+
				Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='B+'";
			 	pstmt = conn.prepareStatement(Query5);
			 	rs4= pstmt.executeQuery();
		    
		     	while(rs4.next()){
		   			String attGrade = rs4.getString("attendeeGrade");
		    	
		    	
		   			BPlusgrade=BPlusgrade+3.5;
		   		}
		     	
		    	//B
		    	Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='B'";
			 	pstmt = conn.prepareStatement(Query5);
			 	rs4= pstmt.executeQuery();
		    
		    
		    
		    	while(rs4.next()){
		   			String attGrade = rs4.getString("attendeeGrade");
		    	
		    	
		   			Bgrade=Bgrade+3.0;
				}
		    	
		    	//C+
		    	Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='C+'";
			 	pstmt = conn.prepareStatement(Query5);
			 	rs4= pstmt.executeQuery();
		    
		    
		    
			    while(rs4.next()){
			  	 	String attGrade = rs4.getString("attendeeGrade");
			    	
			    	
			  	 	CPlusgrade=CPlusgrade+2.5;
				}
				
			    //C
			    Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='C'";
				pstmt = conn.prepareStatement(Query5);
				rs4= pstmt.executeQuery();
		    
			    while(rs4.next()){
			  	 	String attGrade = rs4.getString("attendeeGrade");
			    	
			    	
			   		Cgrade=Cgrade+2.0;
				}
			    
			    //D
			    Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='D'";
				 pstmt = conn.prepareStatement(Query5);
				 rs4= pstmt.executeQuery();
			    
			    while(rs4.next()){
			   		String attGrade = rs4.getString("attendeeGrade");
			    	
			    	
			   		Dgrade=Dgrade+1.0;
				}
			    
			    //F
			    Query5= "SELECT attendeeGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='F'";
				pstmt = conn.prepareStatement(Query5);
				rs4= pstmt.executeQuery();
					    
			    while(rs4.next()){
					String attGrade = rs4.getString("attendeeGrade");
					    	
					    	
					Fgrade=Fgrade+0.0;
				}	
	                
              
			    Query3= "SELECT count(*) as count FROM attendee,lecture where attendee.lecture_codeLecture=lecture.codeLecture AND attendee.Student_idStudent="+id+"";
			    pstmt = conn.prepareStatement(Query3);
			    rs2= pstmt.executeQuery();
			    
			    while(rs2.next()){
			    		
			    int count=rs2.getInt("count");
			   

			   
				 
				//17학년 2학기 평점평균 ,과목수(8)
			    attgrade = (APlusgrade+Agrade+BPlusgrade+Bgrade+CPlusgrade+Cgrade+Dgrade+Fgrade)/count;
			    }
			    //총 평점평균,학기수(4)
			    all_attGrade=(attgrade+termAverGrade17_01+termAverGrade16_02+termAverGrade16_01)/4;
			  
			    //백점환산
			    gradeChange= 60+((all_attGrade-1)*40/3.5);
			    
			   
			%>
			
			    

				<tr>
					<td><%=Grade %></td>
					<td><%=all_attGrade %></td>
					<td><%=gradeChange %></td>
				</tr>
				
			<%
				
			
			%>	
			</table>

			<b><font face="HY중고딕"> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 학기별 성적계 </font></b>
			<table border="1">
			
			
			
				<tr>
					<td rowspan="2">학년도</td>
					<td rowspan="2">학기</td>
					<td colspan="3"><center>성적내역</center></td>
					
				</tr>
			<%

			  
				Query1 = "SELECT  * FROM student WHERE idStudent="+id+"";	
				
				pstmt = conn.prepareStatement(Query1);
			    rs=pstmt.executeQuery();
				
			    while(rs.next()){
					//16-1학기 16-2학기 17-1학기신청학점,취득학점
					
					int Request17_1 =rs.getInt("17_1_RequestGrade");
					int Request16_2 =rs.getInt("16_2_RequestGrade");
					int Request16_1 =rs.getInt("16_1_RequestGrade");
					
					int termGrade17_1 =rs.getInt("17_1_termGrade");
					int termGrade16_2 =rs.getInt("16_2_termGrade");
					int termGrade16_1 =rs.getInt("16_1_termGrade");
					//평점평균
					
					String termAverGrade17_1 =rs.getString("17_1_termAverGrade");
					String termAverGrade16_2 =rs.getString("16_2_termAverGrade");
					String termAverGrade16_1 =rs.getString("16_1_termAverGrade");
		
					
				    
					int ReGrade1 =0;
					int GetGrade1=0;
					//------------------------------- 질의의 수행 및 필드 값 추출
			
								
					Query5= "SELECT attendeeGrade,Student_idStudent,lecture_codeLecture,Stuid_getGrade FROM attendee where Student_idStudent="+id+"";
					pstmt = conn.prepareStatement(Query5);
					rs4= pstmt.executeQuery();
								
					while(rs4.next()){
								    
						int Getgrade =rs4.getInt("Stuid_getGrade");
					    String att_grade =rs4.getString("attendeeGrade");
							    
						ReGrade1=ReGrade1+Getgrade;
						GetGrade1=ReGrade1;	
								    
								   
					}
							    
					Query5= "SELECT attendeeGrade,Student_idStudent,lecture_codeLecture,Stuid_getGrade FROM attendee where Student_idStudent="+id+" AND attendeeGrade='F'";
					pstmt = conn.prepareStatement(Query5);
					rs4= pstmt.executeQuery();
								
					while(rs4.next()){
					
						int Getgrade =rs4.getInt("Stuid_getGrade");
						String att_grade =rs4.getString("attendeeGrade");
							    
						
							GetGrade1=ReGrade1-Getgrade;
							
				
								   
					}
					
				
					
					
					
					
								
						
			%>
			  

				<tr>
					<td>신청학점</td>
					<td>취득학점</td>
					<td>평점평균</td>
				</tr>
				   <tr>
					<td>2016</td>
					<td >1</td>
					<td><%=Request16_1 %></td>
					<td><%=termGrade16_1 %></td>
					<td><%=termAverGrade16_1 %></td>
				</tr>
				<tr>
					<td>2016</td>
					<td >2</td>
					<td><%=Request16_2 %></td>
					<td><%=termGrade16_2 %></td>
					<td><%=termAverGrade16_2 %></td>
				</tr>
				<tr>
					<td>2017</td>
					<td >1</td>
					<td><%=Request17_1 %></td>
					<td><%=termGrade17_1 %></td>
					<td><%=termAverGrade17_1 %></td>
				</tr>
				<tr>
					<td>2017</td>
					<td >2</td>
					<td><%=ReGrade1 %></td>
					<td><%=GetGrade1 %></td>
					<td><%=attgrade %></td>
				</tr>
			<%
					}
			%>
				
			</table>

			<b><font face="HY중고딕"> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 성적<br> </font></b>
			<table WIDTH=850 BORDER=1 ALIGN=left CELLSPACING=0 CELLPADDING=1>
				<tr>
					<td>과목명</td>
					<td>과목코드</td>
					<td>시간</td>
					<td>학점</td>
					<td>인원</td>
					<td>교수이름</td>
					<td>강의실</td>
					<td>학점</td>
				</tr>
			<%
				

					Query1 = "SELECT Student_idStudent,lecture_codeLecture FROM attendee where Student_idStudent="+id+"";

					pstmt = conn.prepareStatement(Query1);
					rs = pstmt.executeQuery();
					
					List<String> codelist = new ArrayList<String>();
					
					while (rs.next()) {
						String idStu = rs.getString("Student_idStudent");
						String attcodeLect = rs.getString("lecture_codeLecture");
						

						if (idStu.equals(id)) {
							codelist.add(attcodeLect);
						}
					}

					Query2 = "SELECT * FROM lecture";
					
					pstmt = conn.prepareStatement(Query2);
					rs1 = pstmt.executeQuery();

					while (rs1.next()) {
						
						String titlelect = rs1.getString("titleLecture");
						String codelect = rs1.getString("codeLecture");
						String timelect = rs1.getString("timeLecture");
						int gradelect = rs1.getInt("gradeLecture");
						int limitlect = rs1.getInt("limitLecture");
						String professorName = rs1.getString("profnameLecture");
						String roomlect = rs1.getString("roomLecture");
						String lectgrade = rs1.getString("gradeLecture");

						for (int i = 0; i < codelist.size(); i++) {
							if ((codelist.get(i)).equals(codelect)) {
								Query3 = "SELECT * FROM attendee WHERE Student_idStudent="+id+" AND lecture_codeLecture=?";	
								
								pstmt = conn.prepareStatement(Query3);
								pstmt.setString(1,codelect);
								
								rs2 = pstmt.executeQuery();
								while(rs2.next()){

									String att_grade=rs2.getString("attendeeGrade");
								
				
				
				%>
					<tr>
					<td><%=titlelect%></td>
					<td><%=codelect%></td>
					<td><%=timelect%></td>
					<td><%=gradelect%></td>
					<td><%=limitlect%></td>
					<td><%=professorName%></td>
					<td><%=roomlect%></td>
					<td><%=att_grade%></td>
				</tr>
			<%
					}
				     	}
					  		}
						       }
				%>
			</table>

			<br>
			<td><b><font face="HY중고딕"> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 성적 상세정보 <br> </font></b></td>
			<table WIDTH="600" BORDER="1" CELLPADDING="5" ALIGH="center">
			
			<%
			
		
				int m_RgradeLect=0;
				int m_SgradeLect=0;
				int cugradeLect=0;
				int algradeLect=0;
				int total =0;
				
				Query1 = "SELECT  codeLecture ,creditLecture,gradeLecture FROM lecture";
				pstmt = conn.prepareStatement(Query1);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					
					String creditLect=rs.getString("creditLecture");
					int gradeLect=rs.getInt("gradeLecture");
					int codeLect=rs.getInt("codeLecture");
					
					Query2 = "SELECT  lecture_codeLecture FROM attendee WHERE Student_idStudent="+id+"";
					pstmt = conn.prepareStatement(Query2);
					rs1 = pstmt.executeQuery();
					
					while(rs1.next()){
						
					
						int codelect=rs1.getInt("lecture_codeLecture");
						
						if(codelect==(codeLect)){
							
							if(creditLect.equals("전필")){
								m_RgradeLect=m_RgradeLect+gradeLect;
							}
							
							else if(creditLect.equals("전선")){
								m_SgradeLect=m_SgradeLect+gradeLect;
							}
							
							else if(creditLect.equals("교양")){
								cugradeLect=cugradeLect+gradeLect;
							}
							
							else if(creditLect.equals("산학")){
								algradeLect=algradeLect+gradeLect;
							}
							
							else{
								
							}
						}
						
						total=m_RgradeLect+m_SgradeLect+cugradeLect+algradeLect;
				    
					}
				}
			
			 %>
				<tr>
					<td>전필</td>
					<td>전선</td>
					<td>교양</td>
					<td>산학</td>
					<td>합계</td>
				</tr>
				<tr>
					<td><%=m_RgradeLect %></td>
					<td><%=m_SgradeLect %></td>
					<td><%=cugradeLect %></td>
					<td><%=algradeLect %></td>
					<td><%=total %></td>
				</tr>
			<%
			
			
			
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