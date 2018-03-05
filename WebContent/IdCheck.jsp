<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	//------------------------------- 사용자 입력 아이디 추출 및 객체 생성
	String UserId = request.getParameter("UserId");
	String UserPw = request.getParameter("UserPw");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {

		//------------------------------- JDBC 설정
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

		String checknum = UserId.substring(2, 4);
		int db_id = 0;
		
		//교수일경우
		if (checknum.equals("01")) {
			//------------------------------- 데이터베이스에서 동일한 아이디 추출
			
			String Query1 = "SELECT count(idProf) FROM professor WHERE idProf='" + UserId + "' and sidProf LIKE '%"+ UserPw +"%'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Query1);
			rs.next();
			db_id = rs.getInt(1);
		}
		//학생일경우
		else {
			//------------------------------- 데이터베이스에서 동일한 아이디 추출
			String Query1 = "SELECT count(idStudent) FROM student WHERE idStudent='" + UserId + "' and sidStudent LIKE '%"+ UserPw +"%'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Query1);
			rs.next();
			db_id = rs.getInt(1);
		}
%>

<HTML>
<HEAD>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr" />
<LINK REL="stylesheet" type="text/css" href="../include/style.css">
<TITLE>아이디 중복 검사</TITLE>

<SCRIPT LANGUAGE="javascript">
		function CheckForm(form) {
			if(!form.UserId.value)
				{
				alert('아이디를 입력하세요.');
				form.UserId.focus();
				return;
			}
			form.submit();
		}

		function UseID()
		{
			opener.document.form1.confirm.value = "인증 완료";
			self.close();
		}
		function NoUseID()
		{
			opener.document.form1.confirm.value = "확인";
			self.close();
		}
</SCRIPT>

</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

	<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
		<TR BGCOLOR=#A0A0A0>
			<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>아이디
						중복검사</B></FONT></TD>
		</TR>
		<%
			if (db_id > 0)
				{
					//-------------------------------아이디가 이미 존재하는 경우
		%>

		<TR>
			<TD ALIGN=CENTER>

				<FORM NAME="IdCheck" METHOD=POST ACTION="IdCheck.jsp">

					<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0
						LEFTMARGIN=0>

						<TR>
							<TD ALIGN=CENTER HEIGHT=70>입력하신 <B><%=UserId%></B>은(는) 인증되었습니다.
							</TD>
						</TR>

						<TR>
							<TD ALIGN=CENTER HEIGHT=40>
							<input type="button" value="확인" BORDER=0 STYLE="CURSOR: HAND" onClick="javascript:UseID()"></TD>
						</TR>

					</TABLE>

				</FORM>

			</TD>
		</TR>

		<%
			} else
				{
					//------------------------------- 사용 가능한 아이디일 경우
		%>

		<TR>
			<TD ALIGN=CENTER>

				<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0
					LEFTMARGIN=0>

					<TR>
						<TD ALIGN=CENTER HEIGHT=70>입력하신 <B><%=UserId%></B>은(는) 재확인해주세요.
						</TD>
					</TR>

					<TR>
						<TD ALIGN=CENTER HEIGHT=40>
						<input type="button" value="확인" BORDER=0 STYLE="CURSOR: HAND" onClick="javascript:NoUseID()"></TD>
					</TR>

				</TABLE>

			</TD>
		</TR>

		<%
			}
		%>

	</TABLE>

</BODY>
</HTML>


<%
	} catch (SQLException e)
	{
		
	} finally
	{
		
	}
%>