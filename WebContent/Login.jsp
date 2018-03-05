<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%
request.setCharacterEncoding("euc-kr"); 
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<head>
<title>Login/Logout animation concept</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=yes">

<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>

<link rel="stylesheet" href="css/style.css">


</head>

<script>
function OpenSign()
{
	var winl = (screen.width - 800)/2;
	var wint = (screen.height - 600)/2;
	winprops = 'height='+600+',width='+800+',top='+wint+',left='+winl+',scrollbars=yes';
	ref = 'join.jsp';
	join = 'Join'
	window.open(ref,join,winprops)
}
</script>

<body>
	<%
	String choice = request.getParameter("choice");
	%>

	<div class="cont">
		<div class="demo">
			<div class="login">
				<div class="login__check"></div>
				<FORM NAME="lo" METHOD=POST
					ACTION="loginproc.jsp?choice=<%=choice%>" class="login__form">
					<table>
						<div class="login__row">
							<svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            <path
									d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          </svg>
							<input type="text" class="login__input name"
								placeholder="Username" name="UserId" />
						</div>
						<div class="login__row">
							<svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
            <path
									d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
          </svg>
							<input type="password" class="login__input pass"
								placeholder="Password" name="UserPass"/>
						</div>
						<button type="submit" class="login__submit">login</button>
						<p class="login__signup">
							Don't have an account? &nbsp;<a onClick="javascript:OpenSign()">Sign up</a>
						</p>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>


</body>
</html>