<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	//-------------------------- �ڹٽ�ũ��Ʈ �Լ��κ��� ���޵� <FORM>�� �̸� ����
	String frm = request.getParameter("frm"); 
%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>�ּ�ã�� - 1�ܰ�</TITLE>
	
	<SCRIPT LANGUAGE="javascript">
	function CheckForm(form) {
		if(!form.UserAddress.value) {
			alert("���鵿 �̸��� �Է��ϼ���.")
			form.UserAddress.focus();
			return;
		}
		form.submit();
	}	
	</SCRIPT>
	
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<FORM NAME="AddressSearch1" METHOD=POST ACTION="AddressSearch_2.jsp?frm=<%=frm%>">

<TABLE WIDTH=500 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>�ּ�ã�� - 1�ܰ�</B></FONT></TD>
	</TR>
	
	<TR>
		<TD ALIGN=CENTER HEIGHT=150>
			<INPUT TYPE=TEXT NAME="UserAddress" SIZE=20>
			<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND onClick="javascript:CheckForm(AddressSearch1)"><BR><BR>
			ã���� �Ͻô� ��, ��, ���� �̸��� �Է��ϼ���.<BR>(��) �ŵ������� ��� '�ŵ���'
		</TD>
	</TR>


</TABLE>

</FORM>

</BODY>
</HTML>