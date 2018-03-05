<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
   left: 10px;
   width: 99%;
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
		<br>
		<div id="contents">
			<jsp:include page="subjectModify.jsp" flush="false"></jsp:include>
		</div>
		<div id="footer">
			<jsp:include page="../../Management/member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>