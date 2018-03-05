<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
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
   padding: 30px;
   margin: 10px;
}

#banner {
	left: 10px;
}


#navi {
   position: absolute;
   width: 250px;
   height: 80%;
}

#contents {
   border: 1px solid white;
   padding: 10px;
   position: absolute;
   left: 200px;
   width: 85%;
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
  color: black;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
  border-radius: 3px;
  cursor: pointer;
  display: inline-block;
  font-family: Verdana, sans-serif;
  font-size: 12px;
  font-weight: bold;
  line-height: 15px;
  padding: 9px 16px 9px;
  margin: 16px 0 0 16px;
  transition: all 20ms ease-out;
  vertical-align: top;
 -moz-border-radius:9px 0 0 9px;
	-webkit-border-radius:9px 0 0 9px;
	border-radius:9px 0 0 9px;
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

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	//subjectmodify에서 값받아오기
	int code = Integer.parseInt(request.getParameter("delcode"));

	String saveFolder = "upload_files";

	//-------------------------- MultipartRequest 클래스의 파라미터 설정
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
%>

<body>
	<div id="wrapper">
			<%
				//id값과 pw값 가져오기
					
					String id = request.getParameter("id");
					String pw = request.getParameter("pw");
			%>
			<div id="banner">
				<jsp:include page="../../Management/member/Banner.jsp" flush="false">
					<jsp:param name="id" value="<%=id%>" />
					<jsp:param name="pw" value="<%=pw%>" />
				</jsp:include>
			</div>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="돌아가기" onClick="javascript:location.replace('app_main.jsp?id=<%=id%>&pw=<%=pw%>')" class="button">
		<div id="contents">
		
			<iframe style="width: 80vw; height: 70vh;"
				src="\CAP_G\upload_files\<%=code%>.pdf"></iframe>
			
		</div>
		<div id="footer">
			<jsp:include page="../../Management/member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>