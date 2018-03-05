<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	//id���� pw�� ��������
	
	int id = Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("pw");
	
	try
	{
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		String Query2 = "SELECT * from student where idStudent=" + id + "";
		pstmt = conn.prepareStatement(Query2);
		rs2 = pstmt.executeQuery();
		
		rs2.next();
		String namestu = rs2.getString("nameStudent");
		String sidstu = rs2.getString("sidStudent");
		int idstu = rs2.getInt("idStudent");
		String phonestu = rs2.getString("phoneStudent");
		String majorstu = rs2.getString("majorStudent");
		
		String addstu = rs2.getString("addStudent");
		Date enterdatestu = rs2.getDate("enterdateStudent");
%>
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
	border: 1px solid white;
	padding: 10px;
	position: absolute;
	left: 290px;
	width: 76%;
	height: 78%;
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
	border: 1px solid #dcdcdc;
}

.disin {
	width: 50%;
	padding: 10px 20px;
	margin: 5px 0;
	box-sizing: border-box;
	border: solid 2px #e9e9e9;
	border-radius: 8px;
	background-color: #e9e9e9;
}

.in {
	width: 50%;
	padding: 10px 20px;
	margin: 5px 0;
	box-sizing: border-box;
	border: solid 2px #9B8281;
	border-radius: 8px;
}

[class*='btn-'] {
	border-radius: 7px; <%-- �׵θ� --%> -webkit-box-shadow : inset 0 1px 0
	rgba( 255, 255, 255, 0.2), 0 1px 2px rgba( 0, 0, 0, 0.08);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.08);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.08);
	color: #fff;
	display: inline-block;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	margin: 0px 7px 0px 0px; <%-- �� ������ �Ʒ� ���� --%> padding : 5px 10px; <%--
	��ü ���� --%> text-decoration : none;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.075);
	-webkit-transition: background-color 0.1s linear;
	-moz-transition: background-color 0.1s linear;
	-o-transition: background-color 0.1s linear;
	transition: background-color 0.1s linear;
}

[class*='btn-']:hover {
	cursor: pointer;
}

.btn-red1 {
	background-color: rgb(255, 85, 113);
	border: 1px solid rgb(255, 255, 255);
}

.btn-red1:hover {
	background-color: rgb(231, 159, 170);
}

.btn-red1:active {
	background-color: rgb(255, 224, 229);
}
</style>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<form name="stu_Profile" METHOD=POST
		ACTION="stu_profile_proc.jsp?idstu=<%=idstu%>&id=<%=id%>&pw=<%=pw%>">
		<div id="wrapper">
			<div id="banner">
				<jsp:include page="../member/Banner.jsp" flush="false">
					<jsp:param name="id" value="<%=id%>" />
					<jsp:param name="pw" value="<%=pw%>" />
				</jsp:include>
			</div>
			<br>
			<div id="navi">
				<jsp:include page="../member/stu_navi.jsp?id=<%=id%>&pw=<%=pw%>"
					flush="false">
					<jsp:param name="id" value="<%=id%>" />
					<jsp:param name="pw" value="<%=pw%>" />
				</jsp:include>
			</div>
			<div id="contents">

				<i class="fa fa-user-circle fa-lg" aria-hidden="true"></i>
				&nbsp;&nbsp;&nbsp;<B><font face="���� ����">�Ż�����</font></B>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<INPUT type=SUBMIT VALUE="����" style="text-align: right;"
					class="btn-red1"> <INPUT type=BUTTON VALUE="��ȸ"
					style="text-align: right;" class="btn-red1" a href="#">
				<HR COLOR="#df314d" size="3"></HR>

				<TABLE>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">�� ��</font></b>
							&nbsp;&nbsp;&nbsp; <INPUT TYPE="text" NAME="name"
							value="<%=namestu%>" class="in"></td>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">�ֹι�ȣ</font></b>&nbsp;&nbsp;&nbsp;
							<INPUT TYPE="text" NAME="jumin" value="<%=sidstu%>" class="disin"
							readonly></td>
					</TR>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">�� ��</font></b>
							&nbsp;&nbsp;&nbsp; <INPUT TYPE="text" NAME="hak"
							value="<%=idstu%>" class="disin" readonly></td>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">��ȭ��ȣ</font></b>
							&nbsp;&nbsp;&nbsp; <INPUT TYPE="text" NAME="phone"
							value="<%=phonestu%>" class="in"></td>

					</TR>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">�� ��</font></b>
							&nbsp;&nbsp;&nbsp; <INPUT TYPE="text" NAME="major"
							value="<%=majorstu%>" class="disin" readonly></td>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">��米��</font></b>&nbsp;&nbsp;&nbsp;
							<%
								String Query3 = "SELECT ass_nameProf FROM assignstudent where ass_idStu=" + id;
									pstmt = conn.prepareStatement(Query3);
									rs3 = pstmt.executeQuery();
									String tt = " ";
									if (rs3.next())
									{
										tt = rs3.getString("ass_nameProf");
									}
							%> <INPUT TYPE="text" NAME="dam" value="<%=tt%>" class="disin"
							readonly></td>
					</TR>

					<TR align=center>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">������</font></b>
							&nbsp;&nbsp;&nbsp; <INPUT TYPE="text" NAME="da"
							value="<%=enterdatestu%>" class="disin" readonly></td>
					</TR>

					<TR align=center>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="���� ����">�� ��</font></b>
							&nbsp;&nbsp;&nbsp; <INPUT TYPE="text" NAME="add"
							value="<%=addstu%>" class="in"></TD>
					</TR>

				</TABLE>

				<BR>&nbsp;&nbsp;<B><font face="���� ����"> ��Ÿ����</font></B> <BR>

				<TABLE>

					<TR>
						<TD>&nbsp; <INPUT TYPE="text" NAME="&nbsp;" SIZE="20"
							class="in"></TD>
					</TR>


					<TR>
						<TD>&nbsp; <INPUT TYPE="text" NAME="&nbsp;" SIZE="20"
							class="in"></TD>
					</TR>

					<TR>
						<TD>&nbsp; <INPUT TYPE="text" NAME="&nbsp;" SIZE="20"
							class="in"></TD>
					</TR>

				</TABLE>

			</div>
			<div id="footer">
				<jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
			</div>
		</div>
		<%
			} catch (SQLException e)
			{
				e.printStackTrace();
			} finally
			{
				rs2.close();
				rs3.close();
				pstmt.close();
				conn.close();
			}
		%>
	</form>
</body>
</html>