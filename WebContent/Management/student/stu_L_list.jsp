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
			<P>개설강좌현황
			</H1>
			</P>

			<H4 ALIGN="center">
				<A HREF="1.소개.html">조회</A> <A HREF="2.기사소개.html">출력</A>

				<hr color="grey">
			</H4>

			학년 <select name="grade">
				<option value="1">2017</option>
				<option value="2">2016</option>
				<option value="3">2015</option>
				<option value="4">2014</option>
			</select> 학기 <select name="semester">
				<option value="1">2학기</option>
				<option value="2">1학기</option>
			</select> 학과 <select name="department">
				<option value="1">---전체---</option>
				<option value="2">소프트웨어학과</option>
				<option value="3">컴퓨터공학학과</option>
				<option value="4">제어계측공학과</option>
				<option value="5">커뮤니케이션 디자인학과</option>
			</select> 캠퍼스 <select name="department">
				<option value="1">---전체---</option>
				<option value="2">충주캠퍼스</option>
				<option value="3">증평캠퍼스</option>
				<option value="4">의왕캠퍼스</option>
			</select> <br> 학년 <select name="department">
				<option value="1">전체</option>
				<option value="2">1</option>
				<option value="3">2</option>
				<option value="4">3</option>
				<option value="5">4</option>
			</select> 분야 <select name="department">
				<option value="1">전체</option>
				<option value="2">이수가능</option>
				<option value="3">뭐가 있는지</option>
				<option value="4">모르겠다</option>
			</select>

			<form name="input" method="post" action="">
				<input type="text" name="memberName" maxlength="10"> <input
					type="submit" value="전송">
			</form>

			<br> 개설강좌현황 <br>

			<table border="1">
				<tr>
					<td>과목명</td>
					<td>과목코드</td>
					<td>시간</td>
					<td>학점</td>
					<td>인원</td>
					<td>교수이름</td>
					<td>강의실</td>
					<td>수강신청</td>
					<td>강의계힉서</td>
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
					<td rowspan="2"><input type="button" value="강의계획서"></td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
		</div>
	</div>
</body>
</html>