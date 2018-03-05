<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%request.setCharacterEncoding("euc-kr");%>

<%
//-------------------------- AddressSearch_1.jsp�κ��� ���޵� <FORM>�� �̸� ����
String frm = request.getParameter("frm");
String UserAddress = request.getParameter("UserAddress");

Connection conn = null;
Statement stmt = null;
ResultSet rs1 = null;
ResultSet rs2 = null;

try {
	
	//------------------------------- JDBC ����	
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	//------------------------------- ���鵿�� �̸��� ���Ե� �ּ� ���ڵ��� �� ����
	String Query1 = "SELECT count(SEQ) FROM zipcode WHERE dong LIKE '%" + UserAddress + "%'";
	stmt = conn.createStatement();
	rs1 = stmt.executeQuery(Query1);
	rs1.next();
	
	int rows = rs1.getInt(1); 
	
%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">	
	<TITLE>�ּ�ã�� - 2�ܰ�</TITLE>
	
	<SCRIPT LANGUAGE="javascript">

 		function CheckForm(form){
 			
			if(!form.UserAddress.value) {
				alert('���鵿 �̸��� �Է��ϼ���');
				 form.UserAddress.focus();
				return;
			}
			form.submit();
			
		}

		function InputAddress( zipcode, sido, gugun, dong, frm ) {

			var parent_form = eval("opener.document." + frm);

			zipcode_1 = zipcode.substring(0,3);
			zipcode_2 = zipcode.substring(4,7);
			address = sido + " " + gugun + " " + dong;

			parent_form.ZipCode1.value = zipcode_1;
			parent_form.ZipCode2.value = zipcode_2;
			parent_form.UserAddress1.value = address;
			parent_form.UserAddress2.focus();

			self.close();

		} 		

	</SCRIPT>	
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=500 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>�ּ�ã�� - 2�ܰ�</B></FONT></TD>
	</TR>

<%
	if( rows > 0 ) {
	//------------------------------- �ش� �ּҰ� �����ϴ� ��� �ּ� ����
%>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=450 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR>
 					<TD ALIGN=CENTER HEIGHT=30><BR>�� <B><%=rows%></B>���� �ּҰ� �˻��Ǿ����ϴ�.</TD>
				</TR>
				<TR><TD HEIGHT=2 BGCOLOR=#AAAAAA></TD></TR>
 				<TR><TD HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

<%
	//------------------------------- �Է��� ���̸��� �����ϴ� ��� �ּ� ���� 
	String Query2 = "SELECT zipcode, sido, gugun, dong, bunji FROM zipcode WHERE dong LIKE '%" + UserAddress + "%'";
 	stmt = conn.createStatement();
 	rs2 = stmt.executeQuery(Query2);
 	
 	//------------------------------- ��ȯ���� ����� ���ڵ� ��� (��ȯ�� ����)
 	while(rs2.next()){
 		String zcode = rs2.getString(1);
 		String sido = rs2.getString(2);
 		String gugun = rs2.getString(3);
 		String dong = rs2.getString(4);
 		String bunji = rs2.getString(5);
 		
 		String Address = " [ " + zcode + " ] " + sido + " " + gugun + " " + dong + " " + bunji;

%>
	
	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=400 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR><TD WIDTH=400 HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
				<TR>
 					<TD>
 						<A HREF="javascript:InputAddress('<%=zcode%>','<%=sido%>','<%=gugun%>','<%=dong%>','<%=frm%>')"><%=Address%></A>
 					</TD>
				</TR>
				<TR><TD HEIGHT=1 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#E2E2E2></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>
<%
	//------------------------------- ��ȯ���� ����� ���ڵ� ��� (��ȯ�� ��)
 	}
%>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=450 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR><TD HEIGHT=10 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=3 BGCOLOR=#AAAAAA></TD></TR>
				<TR><TD HEIGHT=3 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

<%
	rs2.close();
	} else {
	//------------------------------- �ش� �ּҰ� �������� �ʴ� ��� ó��
%>

	<TR>
		<TD ALIGN=CENTER>
		
			<FORM NAME="AddressSearch2" METHOD=POST ACTION="AddressSearch_2.jsp?frm=<%=frm%>">
			
			<TABLE WIDTH=400 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR><TD WIDTH=400 HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
				
				<TR>
					<TD ALIGN=CENTER><BR>�ش� �ּҰ� �������� �ʽ��ϴ�. �ٽ� �Է��ϼ���.</TD>
				</TR>
				
				<TR><TD HEIGHT=3 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#E2E2E2></TD></TR>
				<TR><TD HEIGHT=4 BGCOLOR=#FFFFFF></TD></TR>
				
				<TR>
					<TD ALIGN=CENTER>
						<INPUT TYPE=TEXT NAME="UserAddress" SIZE=20 MAXLENGTH=20>
						<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND onClick="javascript:CheckForm(AddressSearch2)"><BR><BR>
						ã���� �Ͻô� ��, ��, ���� �̸��� �Է��ϼ���.<BR>(��) �ŵ������� ��� '�ŵ���'
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>
			
		</TD>
	</TR>

<%
	}
} catch( SQLException e) {
	
	e.printStackTrace();
	
} finally {

	rs1.close();
	stmt.close();
	conn.close();
}
%>

</TABLE>

</BODY>
</HTML>