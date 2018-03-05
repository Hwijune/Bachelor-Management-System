<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>
	<TITLE>SW Intro Page</TITLE>
</HEAD>

<style>
body {
	background-image: url("css/image.png");
	background-size: cover;
	background-repeat: no-repeat;
	overflow: auto;
	font-family: "Open Sans", Helvetica, Arial, sans-serif;
	text-align: center;
}

#button1 {
	position: absolute;
	padding: 10px;
	width: 100%;
	height: 50%;
	top: 50%;
	margin: 0 auto;
}

.login__submit {
	position: relative;
	width: 25%;
	height: 6rem;
	margin: 5rem 0 2.2rem;
	color: rgba(255, 255, 255, 0.8);
	background: #FF3366; <%-- 버튼 색 --%> font-size : 1.5rem;
	border-radius: 3rem;
	cursor: pointer;
	overflow: hidden;
	-webkit-transition: width 0.3s 0.15s, font-size 0.1s 0.15s;
	transition: width 0.3s 0.15s, font-size 0.1s 0.15s;
}
</style>
</head>

<body>
	<%
		String choice = request.getParameter("choice");
	%>

	<div class="cont">
		<div class="demo">
			<div class="login">
				<div class="logo"></div>
				<Form name=Intro>
					<div id="button1">
						<table>

							<button type="button" class="login__submit"
								onClick="javascript:location.href='Login.jsp?choice=1'">
								학사관리</button>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp;
							<button type="button" class="login__submit"
								onClick="javascript:location.href='Login.jsp?choice=2'">
								수강신청</button>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
</body>

</html>