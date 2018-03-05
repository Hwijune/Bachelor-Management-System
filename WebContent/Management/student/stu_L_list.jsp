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
<body>
	<div id="wrapper">
		<%
			//id���� pw�� ��������
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
			<P>����������Ȳ
			</H1>
			</P>

			<H4 ALIGN="center">
				<A HREF="1.�Ұ�.html">��ȸ</A> <A HREF="2.���Ұ�.html">���</A>

				<hr color="grey">
			</H4>

			�г� <select name="grade">
				<option value="1">2017</option>
				<option value="2">2016</option>
				<option value="3">2015</option>
				<option value="4">2014</option>
			</select> �б� <select name="semester">
				<option value="1">2�б�</option>
				<option value="2">1�б�</option>
			</select> �а� <select name="department">
				<option value="1">---��ü---</option>
				<option value="2">����Ʈ�����а�</option>
				<option value="3">��ǻ�Ͱ����а�</option>
				<option value="4">����������а�</option>
				<option value="5">Ŀ�´����̼� �������а�</option>
			</select> ķ�۽� <select name="department">
				<option value="1">---��ü---</option>
				<option value="2">����ķ�۽�</option>
				<option value="3">����ķ�۽�</option>
				<option value="4">�ǿ�ķ�۽�</option>
			</select> <br> �г� <select name="department">
				<option value="1">��ü</option>
				<option value="2">1</option>
				<option value="3">2</option>
				<option value="4">3</option>
				<option value="5">4</option>
			</select> �о� <select name="department">
				<option value="1">��ü</option>
				<option value="2">�̼�����</option>
				<option value="3">���� �ִ���</option>
				<option value="4">�𸣰ڴ�</option>
			</select>

			<form name="input" method="post" action="">
				<input type="text" name="memberName" maxlength="10"> <input
					type="submit" value="����">
			</form>

			<br> ����������Ȳ <br>

			<table border="1">
				<tr>
					<td>�����</td>
					<td>�����ڵ�</td>
					<td>�ð�</td>
					<td>����</td>
					<td>�ο�</td>
					<td>�����̸�</td>
					<td>���ǽ�</td>
					<td>������û</td>
					<td>���ǰ�����</td>
				</tr>

				<tr>
					<td rowspan="2">1</td>
					<td rowspan="2">2</td>
					<td rowspan="2">3</td>
					<td rowspan="2">4</td>
					<td rowspan="2">5</td>
					<td rowspan="2">6</td>
					<td rowspan="2">7</td>
					<td rowspan="2">6</td>
					<td rowspan="2"><input type="button" value="���ǰ�ȹ��"></td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>