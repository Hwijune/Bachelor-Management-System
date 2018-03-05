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
			//id���� pw�� ��������
			
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
			aria-hidden="true"></i>&nbsp; <b><font face="���� ����� 240">������û
				���</font></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font
			face="���� ����� 240">�о�</font></b> <SELECT SIZE="1"><OPTION
				SELECTED>����</OPTION>
			<OPTION SELECTED>����</OPTION>
		</SELECT> &nbsp;&nbsp;<b><font face="���� ����� 240">�г�</font></b> <SELECT SIZE="1"><OPTION
				SELECTED>1</OPTION>
			<OPTION SELECTED>2</OPTION>
			<OPTION SELECTED>3</OPTION>
			<OPTION SELECTED>4</OPTION>
		</SELECT> &nbsp;&nbsp;<b><font face="���� ����� 240">ķ�۽�</font></b> <SELECT
			SIZE="1"><OPTION SELECTED>����</OPTION>
			<OPTION SELECTED>�ǿ�</OPTION>
			<OPTION SELECTED>����</OPTION>
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