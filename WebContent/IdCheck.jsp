<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	//------------------------------- ����� �Է� ���̵� ���� �� ��ü ����
	String UserId = request.getParameter("UserId");
	String UserPw = request.getParameter("UserPw");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {

		//------------------------------- JDBC ����
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
		String jdbcId = "root";
		String jdbcPw = "rootpass";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

		String checknum = UserId.substring(2, 4);
		int db_id = 0;
		
		//�����ϰ��
		if (checknum.equals("01")) {
			//------------------------------- �����ͺ��̽����� ������ ���̵� ����
			
			String Query1 = "SELECT count(idProf) FROM professor WHERE idProf='" + UserId + "' and sidProf LIKE '%"+ UserPw +"%'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Query1);
			rs.next();
			db_id = rs.getInt(1);
		}
		//�л��ϰ��
		else {
			//------------------------------- �����ͺ��̽����� ������ ���̵� ����
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
<TITLE>���̵� �ߺ� �˻�</TITLE>

<SCRIPT LANGUAGE="javascript">
		function CheckForm(form) {
			if(!form.UserId.value)
				{
				alert('���̵� �Է��ϼ���.');
				form.UserId.focus();
				return;
			}
			form.submit();
		}

		function UseID()
		{
			opener.document.form1.confirm.value = "���� �Ϸ�";
			self.close();
		}
		function NoUseID()
		{
			opener.document.form1.confirm.value = "Ȯ��";
			self.close();
		}
</SCRIPT>

</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

	<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
		<TR BGCOLOR=#A0A0A0>
			<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>���̵�
						�ߺ��˻�</B></FONT></TD>
		</TR>
		<%
			if (db_id > 0)
				{
					//-------------------------------���̵� �̹� �����ϴ� ���
		%>

		<TR>
			<TD ALIGN=CENTER>

				<FORM NAME="IdCheck" METHOD=POST ACTION="IdCheck.jsp">

					<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0
						LEFTMARGIN=0>

						<TR>
							<TD ALIGN=CENTER HEIGHT=70>�Է��Ͻ� <B><%=UserId%></B>��(��) �����Ǿ����ϴ�.
							</TD>
						</TR>

						<TR>
							<TD ALIGN=CENTER HEIGHT=40>
							<input type="button" value="Ȯ��" BORDER=0 STYLE="CURSOR: HAND" onClick="javascript:UseID()"></TD>
						</TR>

					</TABLE>

				</FORM>

			</TD>
		</TR>

		<%
			} else
				{
					//------------------------------- ��� ������ ���̵��� ���
		%>

		<TR>
			<TD ALIGN=CENTER>

				<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0
					LEFTMARGIN=0>

					<TR>
						<TD ALIGN=CENTER HEIGHT=70>�Է��Ͻ� <B><%=UserId%></B>��(��) ��Ȯ�����ּ���.
						</TD>
					</TR>

					<TR>
						<TD ALIGN=CENTER HEIGHT=40>
						<input type="button" value="Ȯ��" BORDER=0 STYLE="CURSOR: HAND" onClick="javascript:NoUseID()"></TD>
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