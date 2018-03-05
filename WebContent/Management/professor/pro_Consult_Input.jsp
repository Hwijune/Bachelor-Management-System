<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>

<%request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
function CheckForm(from)
{
   
   
   if(!from.con_time.value)
   {
      alert('상담시간을 입력하세요');
      from.con_time.focus();
      return true;
   }
   
   if(!from.con_place.value)
   {
      alert('상담장소를 입력하세요');
      from.con_place.focus();
      return true;
   }
   
   if(!from.con_type.value)
   {
      alert('상담유형을 입력하세요');
      from.con_type.focus();
      return true;
   }
   
   if(!from.con_content.value)
   {
      alert('상담내용을 입력하세요');
      from.con_content.focus();
      return true;
   }
   
   
   alert('저장되었습니다.');
   from.submit();
   }
</script>
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
   width: 78%;
   height: 80%;
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
    width: 78%;
    border:2px solid #9B8281;
    
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid gray;
    padding: 10px;
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
  height:30px;

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

table {
    width: 80%;
    
  }
 
      .disin{
      width: 50%;
         padding: 10px 20px;
         margin: 5px 0;
         box-sizing: border-box;
         border: solid 2px #e9e9e9;
         border-radius: 8px;
         background-color: #e9e9e9;
      }
      
      .in {
      width: 20%;
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
  
</style>
<body>
   <div id="wrapper">
         <%
            //id값과 pw값 가져오기
               
               String id = request.getParameter("id");
               String pw = request.getParameter("pw");
         %>
         <div id="banner">
            <jsp:include page="../member/Banner.jsp" flush="false">
               <jsp:param name="id" value="<%=id%>" />
               <jsp:param name="pw" value="<%=pw%>" />
            </jsp:include>
         </div>
         <br>
         <div id="navi">
             <jsp:include page="../member/pro_navi.jsp" flush="false">
               <jsp:param name="id" value="<%=id%>" />
               <jsp:param name="pw" value="<%=pw%>" />
            </jsp:include>
         </div>
      <div id="contents" >

   <%
   int code = Integer.parseInt(request.getParameter("code"));
   String proid = request.getParameter("idProf");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   

   String Query1 = "";
   
   try {
      String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
      String jdbcId = "root";
      String jdbcPw = "rootpass";

      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
      
      Query1 = "SELECT nameProf FROM professor WHERE idProf=?" ;
      
      pstmt = conn.prepareStatement(Query1);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      
      rs.next();
      
      String pro_name = rs.getString("nameProf");
   %>
   
   <form name="pro_Consult_Input" method=post action ="pro_Consult_InputProc.jsp?code=<%=code%>&proid=<%=proid%>&id=<%=id%>&pw=<%=pw%>">
         
   
   

         <BR> <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>상담이력 입력 </b><BR><br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;<INPUT TYPE=submit VALUE="저장" class="button">
   <INPUT TYPE="BUTTON" NAME=Btn1 VALUE="취소" onclick="history.back();" class="button"><br><Br>
         <TABLE align=center>

            <TR >
               <TD> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<b>상담교수</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=pro_name %>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <b>교수번호</b>&nbsp;&nbsp;&nbsp;<%=proid %></TD>
            </TR>
            <TR>
            <TR >
               <TD>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>학번</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=code %></TD>
               
            </TR>
               <TD>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<B>상담시간</B>&nbsp;&nbsp;
               <INPUT TYPE="text" NAME="con_time" SIZE="20" class="in"></TD>
            </TR>
            
            <TR>
               <TD>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<b>상담장소</b>&nbsp;&nbsp;&nbsp; 
               <INPUT TYPE="text" NAME="con_place" SIZE="20" class="in">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
               <B>상담유형</B>&nbsp;&nbsp;
               <INPUT TYPE="text" NAME="con_type" SIZE="20" class="in"></TD>
            </TR>
            
            <TR>
               <TD>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<b>상담내용</b>&nbsp;&nbsp;&nbsp; <TEXTAREA ROWS="7" COLS="80" NAME="con_content"></TEXTAREA></TD>
            </TR>
            
         </TABLE>
         </form>
         <%
            } 
            
            catch (SQLException e)
            {
               e.printStackTrace();
               
            } finally
            {
               
               conn.close();
            }
         %>
      </div>
      <div id="footer" >
         <jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
      </div>
   </div>
</body>
</html>