<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@page import="java.util.*"%>




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
  height:30px;
  align:center;
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

.in {
		width: 130px;
		height:25px;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 1px gray;
			border-radius: 8px;
			
		}

table {
    width: 78%;
    border:2px solid #9B8281;
    
  }
  th, td {
    
    padding: 10px;
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

table {
    width: 80%;
    
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
		width: 30%;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #9B8281;
			border-radius: 8px;
		}
		
		[class*='btn-'] {
   border-radius: 7px; <%-- 테두리 --%>
   -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
     box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   color: #fff;
   display: inline-block;
   font-family: Arial, Helvetica, sans-serif;
   font-size: 14px;
   margin: 0px 7px 0px 0px; <%-- 위 오른쪽 아래 왼쪽 --%>
   padding: 5px 10px; <%-- 전체 넓이 --%>
   text-decoration: none;
   text-shadow: 0 1px 1px rgba(0, 0, 0, 0.075);
   
   -webkit-transition: background-color 0.1s linear;
   -moz-transition: background-color 0.1s linear;
   -o-transition: background-color 0.1s linear;
     transition: background-color 0.1s linear;   
}
   [class*='btn-']:hover {
      cursor: pointer;
   }

   .btn-red1 {
      background-color: rgb( 255, 85, 113 );
      border: 1px solid rgb( 255, 255, 255 );
   }
   
      .btn-red1:hover {
         background-color: rgb( 231, 159, 170 );
      }
      
      .btn-red1:active {
         background-color: rgb( 255, 224, 229 );
      }
</style>
<body>

	<div id="wrapper">
			<%
			request.setCharacterEncoding("euc-kr");	
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
		<div id="contents" >
				<font face="한컴 윤고딕230"><b>학생 성적입력</b></font><br><br>
		<form name="input" method=post action="pro_Grade_InputProc.jsp?id=<%=id%>&pw=<%=pw%>" >
	<TABLE>
<%

 
    
    //--------------------------------------------pro_stulist.jsp에서 전달된 파라미터값  추출
	int idStu=Integer.parseInt(request.getParameter("idStu"));		
	int codeLect=Integer.parseInt(request.getParameter("codeLect"));
	String nameStu = URLDecoder.decode(request.getParameter("nameStu"),"euc-kr");
	String titlelect = URLDecoder.decode(request.getParameter("titlelect"),"euc-kr");
	

		
	//---------------------------------- 객체와 변수의 선언	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	String Query1 = " ";
	String Query2 = " ";
	String Query3 = " ";
	
	try {
		
		//------------------------------- JDBC 설정
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		
		//------------------------------- 질의의 수행 및 필드 값 추출
		Query1 = "SELECT idStudent FROM student WHERE idStudent=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,idStu);
		
		rs = pstmt.executeQuery();
		rs.next();
		
	
		Query2 = "SELECT attendeeGrade, lecture_codeLecture FROM attendee where  Student_idStudent=? AND lecture_codeLecture=?";			
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,idStu);
		pstmt.setInt(2,codeLect);
		rs1 = pstmt.executeQuery();
		rs1.next();
		
		String grade= rs1.getString("attendeeGrade");
					
		
%>
		
	
		<TR>
	         <TD>과목코드 <INPUT TYPE="text" name="codeLect" value=<%=codeLect%>
	         class="in"></TD>   
	          <TD>교과목명 <INPUT TYPE="text" name="titlelect" value=<%=titlelect%>
	         class="in"></TD>   
	      </TR>
		
		<TR>
	         <TD>학생학번  <INPUT TYPE="text" name="stuid" value=<%=idStu%>
	         class="in"></TD> 
	         <TD>학생이름 <INPUT TYPE="text" name="nameStu" value=<%=nameStu%>
	         class="in"></TD>   
	      </TR>
			
		<TR>
			<TD>학생성적 <INPUT TYPE="text" name="grade" value=<%=grade%>
			class="in"></TD>
		</TR>
	
 
	</TABLE>
	
	<br>
			<INPUT TYPE="submit" NAME=Btn1 VALUE="저장" class="button" >
				<INPUT TYPE="BUTTON" NAME=Btn1 VALUE="취소"  class="button">
	
	</form>
		</div>
		
		<div id="footer" >
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
	
	
<%
	
//------------------------------- 예외처리 및 객체의 종료
	}catch (SQLException e) {
		e.printStackTrace();
    } finally {
    	
    
    conn.close();
    }
%>
	
</body>
</html>