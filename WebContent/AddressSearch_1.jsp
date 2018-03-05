<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	//-------------------------- 자바스크립트 함수로부터 전달된 <FORM>의 이름 추출
	String frm = request.getParameter("frm"); 
%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>주소찾기 - 1단계</TITLE>
	
	<SCRIPT LANGUAGE="javascript">
	function CheckForm(form) {
		if(!form.UserAddress.value) {
			alert("읍면동 이름을 입력하세요.")
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
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>주소찾기 - 1단계</B></FONT></TD>
	</TR>
	
	<TR>
		<TD ALIGN=CENTER HEIGHT=150>
			<INPUT TYPE=TEXT NAME="UserAddress" SIZE=20>
			<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND onClick="javascript:CheckForm(AddressSearch1)"><BR><BR>
			찾고자 하시는 읍, 명, 동의 이름을 입력하세요.<BR>(예) 신도림동인 경우 '신도림'
		</TD>
	</TR>


</TABLE>

</FORM>

</BODY>
</HTML>