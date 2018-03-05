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
   border: 1px solid;
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
		<br>
		<div id="contents">
			<iframe style="width: 100vw; height: 70vh;"
				src="\CAP_G\upload_files\<%=code%>.pdf"></iframe>
			<input type="button" value="돌아가기" onClick="javascript:location.replace('stu_course_check_grades.jsp?id=<%=id%>&pw=<%=pw%>')">
		</div>
		<div id="footer">
			<jsp:include page="../../Management/member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>