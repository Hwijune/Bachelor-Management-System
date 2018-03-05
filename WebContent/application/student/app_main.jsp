<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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

#contents {
	border: 1px solid white;
	padding: 10px;
	position: absolute;
	width: 98%;
	height: 35%;
	overflow: scroll;
}

#confirm {
	border: 5px solid #FF5675;
	padding: 10px;
	height: 35%;
	width: 97%;
	position: absolute;
	top: 53%;
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
</style>
<body>
	<div id="wrapper">
		<%
			//id값과 pw값 가져오기
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
		%>
		<div id="banner">
			<jsp:include page="../../Management/member/appBanner.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<br> &nbsp;&nbsp;<i class="fa fa-list-ul fa-lg"
			aria-hidden="true"></i>&nbsp; <b><font face="한컴 윤고딕 240">수강신청
				목록</font></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font
			face="한컴 윤고딕 240">분야</font></b> <SELECT SIZE="1"><OPTION
				SELECTED>전공</OPTION>
			<OPTION SELECTED>교양</OPTION>
		</SELECT> &nbsp;&nbsp;<b><font face="한컴 윤고딕 240">학년</font></b> <SELECT SIZE="1"><OPTION
				SELECTED>1</OPTION>
			<OPTION SELECTED>2</OPTION>
			<OPTION SELECTED>3</OPTION>
			<OPTION SELECTED>4</OPTION>
		</SELECT> &nbsp;&nbsp;<b><font face="한컴 윤고딕 240">캠퍼스</font></b> <SELECT
			SIZE="1"><OPTION SELECTED>충주</OPTION>
			<OPTION SELECTED>의왕</OPTION>
			<OPTION SELECTED>증평</OPTION>
		</SELECT>
		<div id="contents">
			<jsp:include page="input.jsp" flush="false"></jsp:include>
		</div>

		<div id="confirm">
			<jsp:include page="insert.jsp" flush="false"></jsp:include>
		</div>
		<div id="footer">
			<jsp:include page="../../Management/member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>