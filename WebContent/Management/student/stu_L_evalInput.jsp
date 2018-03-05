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
		width: 130px;
		height: 30px;
			padding: 10px 20px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #9B8281;
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
			<center><B><font face="맑은 고딕"> 강의평가 </center> <BR>
			<%
			int code = Integer.parseInt(request.getParameter("code"));
			String stuid = request.getParameter("stuid");
			
			%>
			<FORM NAME="Addassign" METHOD=POST ACTION="stu_L_evalProc.jsp?code=<%=code%>&stuid=<%=stuid%>&id=<%=id%>&pw=<%=pw%>">
				<TABLE WIDTH="600" BORDER="1" CELLPADDING="5" ALIGH="center">
					<tr>
						<td width=150 ><b><font face="HY중고딕"> 단답형 문항</font></b></td>
						<td><b><font face="HY중고딕">매우훌륭</font></b></td>
						<td><b><font face="HY중고딕">훌륭함</font></b></td>
						<td><b><font face="HY중고딕">다소훌륭</font></b></td>
						<td><b><font face="HY중고딕">보통</font></b></td>
						<td><b><font face="HY중고딕">다소미흡</font></b></td>
						<td><b><font face="HY중고딕">미흡함</font></b></td>
						<td><b><font face="HY중고딕">매우미흡</font></b></td>
					</tr>
					<tr>
						<td width=150><input type=text name="answer" class="in"></td>
						<td><input type=radio name="sub1" value="6"></td>
						<td><input type=radio name="sub1" value="5"></td>
						<td><input type=radio name="sub1" value="4"></td>
						<td><input type=radio name="sub1" value="3"></td>
						<td><input type=radio name="sub1" value="2"></td>
						<td><input type=radio name="sub1" value="1"></td>
						<td><input type=radio name="sub1" value="0"></td>
					</tr>
				</TABLE>
				
				<br>
						<center><INPUT TYPE="submit" NAME=Btn1 VALUE="저장" align=center class="button">
							<INPUT TYPE="BUTTON" NAME=Btn1 VALUE="취소" class="button"
							onclick="javascript:location.replace('stu_L_eval.jsp?id=<%=id%>&pw=<%=pw%>');" align=center></center>
				
			</FORM>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>