<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	//id값과 pw값 가져오기
	int id = Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	var A;
	var B;
	var C;
	var D;
	function change() {
		A = document.getElementById("major");
		B = A.options[A.selectedIndex].value;

		C = document.getElementById("name");
		D = C.options[C.selectedIndex].value;
	}

	function search(form) {
		form.action = "mana_stuProfile.jsp?id="+<%=id%>+"&major=" + B + "&name=" + D;
		form.submit();
	}
</script>

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
   border-radius: 7px; <%-- 테두리 --%>
   -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
     box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   color: #fff;
   display: inline-block;
   font-family: Arial, Helvetica, sans-serif;
   font-size: 14px;
   margin: 0px 7px 0px 0px; <%-- 위 오른쪽 아래 왼쪽 --%>
   padding: 5px 10px; <%-- 전체 넓이 --%>
   text-decoration: none;
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
      background-color: rgb( 255, 85, 113 );
      border: 1px solid rgb( 255, 255, 255 );
   }
   
      .btn-red1:hover {
         background-color: rgb( 231, 159, 170 );
      }
      
      .btn-red1:active {
         background-color: rgb( 255, 224, 229 );
      }
      
      .mainselection {
   overflow:hidden;
   width:100px;
   -moz-border-radius: 9px 9px 9px 9px;
   -webkit-border-radius: 9px 9px 9px 9px;
   border-radius: 9px 9px 9px 9px;
   box-shadow: 1px 1px 11px #330033;
   background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 69px center;
   
    border: 0;
   color: black;
   background: transparent;
   font-size: 14px;
   font-weight: bold;
   padding: 2px 10px;
   width: 128px;
   *width: 100px;
   *background: white;
   
}
	div.fixed {
			border: 2px solid white;
			width: 98%;
			position: fixed;
			top: 100px;
			right: 0;
			}
			
			.button {
  background-color: #f2f2f2;
  background-image: linear-gradient(to bottom, #f2f2f2, #f2f2f2);
  border: 1px solid #bfbfbf;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2, 0 2px 4px rgba(0, 0, 0, 0.2);
  color: #505050;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
  border-radius: 3px;
  cursor: pointer;
  display: inline-block;
  font-family: Verdana, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 15px;
  transition: all 20ms ease-out;
  vertical-align: top;
  width:55px;
  height:35px;
}
.button:hover, .button:focus {
  background: #f2f2f2;
  border-color: #8c8c8c;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2;
}
.button:active {
  background: #f2f2f2;
  box-shadow: inset 0 2px 3px rgba(0, 0, 0, 0.2);
}
.button .fa {
  color: #bfbfbf;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
}



.button .fa {
  float: left;
  font-size: 14px;
  line-height: 20px;
  margin: -1px 8px 0 -4px;
  vertical-align: top;
}

.but {
  background-color: #f2f2f2;
  background-image: linear-gradient(to bottom, #f2f2f2, #f2f2f2);
  border: 1px solid #bfbfbf;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2, 0 2px 4px rgba(0, 0, 0, 0.2);
  color: #505050;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
  border-radius: 3px;
  cursor: pointer;
  display: inline-block;
  font-family: Verdana, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 15px;
  transition: all 20ms ease-out;
  vertical-align: top;
  width:63px;
  height:28px;
}
.but:hover, .but:focus {
  background: #f2f2f2;
  border-color: #8c8c8c;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2;
}
.but:active {
  background: #f2f2f2;
  box-shadow: inset 0 2px 3px rgba(0, 0, 0, 0.2);
}
.but .fa {
  color: #bfbfbf;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
}



.but .fa {
  float: left;
  font-size: 14px;
  line-height: 20px;
  margin: -1px 8px 0 -4px;
  vertical-align: top;
}
</style>
<body>
	<div id="wrapper">
		<div id="banner">
			<jsp:include page="../member/Banner.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<br>
		<div id="navi">
			<jsp:include page="../member/mana_navi.jsp" flush="false">
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="pw" value="<%=pw%>" />
			</jsp:include>
		</div>
		<div id="contents">

			<%
				Connection conn = null;
				
				PreparedStatement pstmt = null;
				ResultSet rs1 = null;
				ResultSet rs2 = null;
				ResultSet rs3 = null;
				
				String name = request.getParameter("name");
				if (name == null)
				{
					name = "A";
				}
				
				try
				{
					String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
					String jdbcId = "root";
					String jdbcPw = "rootpass";
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
					
					String Query2 = "SELECT * from student Where nameStudent=?";
					pstmt = conn.prepareStatement(Query2);
					pstmt.setString(1, name);
					rs2 = pstmt.executeQuery();
					
					String Query1 = "SELECT distinct majorStudent FROM STUDENT";
					pstmt = conn.prepareStatement(Query1);
					rs1 = pstmt.executeQuery();
					
					String Query3 = "SELECT distinct nameStudent FROM STUDENT";
					pstmt = conn.prepareStatement(Query3);
					rs3 = pstmt.executeQuery();
					
					String namestu = "";
					String sidstu = "";
					int idstu = 0;
					String phonestu = "";
					String majorstu = "";
					String profstu = "";
					String addstu = "";
					
					if (rs2.next())
					{
						namestu = rs2.getString("nameStudent");
						sidstu = rs2.getString("sidStudent");
						idstu = rs2.getInt("idStudent");
						phonestu = rs2.getString("phoneStudent");
						majorstu = rs2.getString("majorStudent");
						profstu = rs2.getString("profStudent");
						addstu = rs2.getString("addStudent");
					}
					
					String q = request.getParameter("major");
			%>
			<form name="Fuck" method=POST>
				<center>&nbsp;<B><font face="맑은 고딕">학과 &nbsp;&nbsp;</font></B><SELECT id="major" name="major" SIZE="1" onChange="change()" CLASS="mainselection">
					<OPTION value=""></OPTION>
					<%
						while (rs1.next())
							{
					%>
					<OPTION value=<%=rs1.getString("majorStudent")%>><%=rs1.getString("majorStudent")%></OPTION>
					<%
						}
					%>
				</SELECT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<B><font face="맑은 고딕"> 학생 &nbsp;&nbsp; </font></B> <SELECT id="name" name="name" SIZE="1" onChange="change()" CLASS="mainselection">
					<OPTION value=""></OPTION>
					<%
						while (rs3.next())
							{
					%>
					<OPTION value=<%=rs3.getString("nameStudent")%>><%=rs3.getString("nameStudent")%></OPTION>
					<%
						}
					%>

				</SELECT>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="button" VALUE="검색" onClick="javascript:search(Fuck)" class="button"></center>
			</form>
			
			<form name="stu_Profile" METHOD=POST
				ACTION="mana_stuProfile_Proc.jsp?id=<%=id%>&pw=<%=pw%>">
				<br><br><B><font face="맑은 고딕">학생신상 등록 및 정정</font></B>
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
				<INPUT type=SUBMIT VALUE="등록" style = "text-align:right;" class="btn-red1"> 
				<INPUT type=BUTTON VALUE="정정" style = "text-align:right;" class="btn-red1" a href="#">
				<HR COLOR="#df314d" size="3"></HR>
				  <BR><br>
				<TABLE>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">성     명 </font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="name" Value="<%=namestu%>" placeholder="예)홍길동" class="in"  ></td>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">주민번호</font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="sidstu" Value="<%=sidstu%>" placeholder="예)9401261000000" class="in"></TD>
					</TR>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">학     번</font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="idstu" Value="<%=idstu%>" placeholder="예)1344011" class="in"  ></TD>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">전화번호</font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="phone" Value="<%=phonestu%>" placeholder="예)01020048497" class="in" ></TD>
					</TR>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">학     과</font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="major" Value="<%=majorstu%>" placeholder="예)소프트웨어학과" class="in"></td>
						<td>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">담당교수</font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="profstu" Value="<%=profstu%>" placeholder="예)박문수" class="in"></TD>
					</TR>

					<TR align=center>
						<TD>&nbsp;&nbsp;&nbsp;<b><font face="맑은 고딕">주     소</font></b> &nbsp;&nbsp;&nbsp;
						<INPUT TYPE="text" NAME="add" Value="<%=addstu%>" placeholder="예)충북 청주시" class="in"></TD>
					</TR>

				</TABLE>
			</form>
			<BR><B>&nbsp;&nbsp;&nbsp;<font face="맑은 고딕">기타정보</font></B> <BR>

			<TABLE>

				<TR>
					<TD>&nbsp; <INPUT TYPE="text" NAME="&nbsp;" class="in"></TD>
				</TR>


				<TR>
					<TD>&nbsp; <INPUT TYPE="text" NAME="&nbsp;" class="in"></TD>
				</TR>

				<TR>
					<TD>&nbsp; <INPUT TYPE="text" NAME="&nbsp;" class="in"></TD>
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
			rs1.close();
			rs3.close();
			
			pstmt.close();
			conn.close();
		}
	%>
</body>
</html>