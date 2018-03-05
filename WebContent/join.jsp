<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title> JOIN </title>
  <style type="text/css">
 *{margin:0;padding:0}
 ul,ol,li{list-style:none}
 img{border:none}
 a{color:#333;text-decoration:none}
 a:hover{color:#f00;text-decoration:underline}
 body{font-size:12px; font-family:"돋움"; color:#a92840} <%-- 글자색 --%>
 #formcon {width:630px;margin:0 auto}

 #formcon p{padding:25px 10px 25px 10px; font-size:15px; font-weight:bold; text-align:center;} <%-- 위 오른쪽 아래 왼쪽 --%>
 fieldset{border:none}
 legend,caption{font-size:0;width:0;height:0}
 #formcon table{width:100%;border-top:2px solid #df314d; <%-- 윗선 --%>
 border-bottom:2px solid #df314d; border-spacing:0} <%-- 밑선 --%>
 #formcon td{border-bottom:1px solid #ed8d9b;padding:10px 0 10px 10px} <%-- 오른쪽 선 --%>
 #formcon th{border-bottom:1px solid #ffffff;padding:10px 0 10px 5px;background:#ed8d9b;text-align:left} <%-- 왼쪽 네모 선, 색 --%>
 #formcon input{border:1px solid #ed8d9b;color:#0000ff;padding:1px} <%-- 박스색 --%>
 #formcon .input_btn{text-align:center}
 #formcon .input_btn input{border:0;vertical-align:middle;margin-top:5px}
 #formcon img{vertical-align:middle;margin-top:-3px}

[class*='btn-'] {
   border-radius: 7px; <%-- 테두리 --%>
   -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
     box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
   color: #fff;
   display: inline-block;
   font-family: Arial, Helvetica, sans-serif;
   font-size: 13px;
   padding: 10px 16px; <%-- 전체 넓이 --%>
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

   .btn-red {
      background-color: rgb( 247, 247, 247 ); <%-- 안 전체색 --%>
      border: 1px solid rgb( 187, 40, 74 ); <%-- (아마도) 테두리 색--%>
   }
   
      .btn-red:hover {
         background-color: rgb( 237, 141, 155 );
      }
      
      .btn-red:active {
         background-color: rgb( 187, 40, 74 );
      }

  </style>
  
  </head>
  
  <script>
//------------------------------- 아이디 중복검사 윈도우
  function IdCheck(ref, fname, ename, epass) {

  	var userid = eval("document." + fname + "." + ename);
  	var userpw = eval("document." + fname + "." + epass);

  	if(!userid.value) {
  		alert("아이디를 입력한 후 버튼을 눌러주세요.");
  		userid.focus();
  		return;
  	} else {
  		ref = ref + "?" + ename + "=" + userid.value + "&"+epass+"="+userpw.value;
  		var winl = (screen.width - 380) / 2;
  		var wint = (screen.height - 200) / 2;
  		myname = '계정확인'
  		winprops = 'height='+200+',width='+380+',top='+wint+',left='+winl+',scrollbars=no';
  		window.open(ref, myname, winprops)
  	}
  }
  
  function CheckConfirm(fname,checkvalue,ename) {

	  	var userid = eval("document." + fname + "." + checkvalue +".value");
	  	var user = eval("document." + fname + "." + ename+".value");
	  	
	  	if(userid != "인증 완료") {
	  		alert('인증을 해주세요.');
	  		return;
	  	}
	  	else
	  	{
	  		form.submit();
	  		self.close();
	  	}
	  }
  
	function UseID()
	{
		self.close();
	}
	
	function AddressSearch(ref,fname,myname,w,h,scroll)
	{
		var winl = (screen.width - w)/2;
		var wint = (screen.height - h)/2;
		winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll;
		ret = ref + "?" + "frm" + "=" + fname;
		window.open(ret,myname,winprops)
	}
</script>

 <body>
 <div id="formcon">
 		<br></br>
 		<br></br>
		<h3></h3>
		<p>회원가입</p>
		<form name="form1" METHOD=POST action="joinProc.jsp">
			<fieldset>
				<legend>회원가입서</legend>
				<table summary="회원가입서">
					<caption>사용자 폼 입력</caption>
					<tbody>
						<tr>
							<th scope="row"><img src="image/one2.png" alt="" /><label
								for="id2"> 아 이 디</label></th>
							<td>
							<strong>학번</strong>
							<INPUT TYPE=TEXT NAME="UserId" SIZE=10 MAXLENGTH=10 style="ime-mode: inactive">
							<strong>초기비밀번호</strong>
							<INPUT TYPE=TEXT NAME="UserPw" SIZE=10 MAXLENGTH=10 style="ime-mode: inactive">
							<INPUT TYPE=button NAME="confirm" value="확인" class="btn-red" onClick="javascript:IdCheck('IdCheck.jsp','form1','UserId','UserPw')"></td>
						</tr>
						<tr>
							<th scope="row"><img src="image/one2.png" alt="" /><label
								for="id1"> 이름</label></th>
							<td><input type="text" name="Username" style="ime-mode: active id="id1"/></td>
						</tr>
						<tr>
							<th scope="row"><img src="image/one2.png" alt="" /><label
								for="id5"> 이메일</label></th>
							<td><input type="text" name="Usermail" id="id5"
								style="ime-mode: active" /></td>
						</tr>
						<th scope="row"><img src="image/one2.png" alt="" /><label
							for="id10"> 전화번호</label></th>
						<td><strong>숫자만 기입 </strong><input type="text" name="UserHp1"
							id="id10" /></td>
						</tr>
						<tr>
							<th scope="row"><img src="image/one2.png" alt="" /><label
								for="id11"> 주소</label></th>
							<TD WIDTH=500>
							<INPUT TYPE=TEXT NAME="ZipCode1" SIZE=3	MAXLENGTH=3 READONLY onClick="javascript:alert('우편번호 검색버튼을 이용하세요')"> - 
							<INPUT TYPE=TEXT NAME="ZipCode2" SIZE=3 MAXLENGTH=3 READONLY onClick="javascript:alert('우편번호 검색버튼을 이용하세요')"><BR> 
							<INPUT TYPE=TEXT NAME="UserAddress1" SIZE=45 MAXLENGTH=110" READONLY onClick="javascript:alert('우편번호 검색버튼을 이용하세요')"> 
							<INPUT TYPE=button NAME="enter" value="입력" class="btn-red" onClick="javascript:AddressSearch('AddressSearch_1.jsp','form1','SearchAddress',520,220,'yes')"><BR>&nbsp;
							<strong> 나머지 주소 
							<INPUT TYPE=TEXT NAME="UserAddress2" SIZE=45 MAXLENGTH=80"></TD>
						</tr>
					</tbody>
				</table>

				<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1	ALIGN=CENTER>

					<TR ALIGN=CENTER>
						<TD>
						<INPUT TYPE=submit NAME="UserHp2" value="가입" class="btn-red" onClick="javascript:CheckConfirm('form1','confirm','UserId')">&nbsp;&nbsp;
						<INPUT TYPE=button NAME="UserHp2" value="취소" class="btn-red" onClick="javascript:UseID()">
						</TD>
					</TR>

				</TABLE>
			</fieldset>
		</form>
	</div>
 </body>
</html>