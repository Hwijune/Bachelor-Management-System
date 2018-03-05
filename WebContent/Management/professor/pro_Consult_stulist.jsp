<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
   request.setCharacterEncoding("euc-kr");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
    width: 100%;
    border-top: 1px solid #df314d;
    border-collapse: collapse;
    font-family:"나눔바른고딕 ";
  }
  th, td {
    border-bottom: 1px solid #df314d;
    padding: 4px;
    text-align: center;
  }
  thead tr {
    background-color: #df314d;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #f6f6f6;
  }
  tbody tr:nth-child(2n+1) {
    background-color: white;
  }
  tbody tr:hover { background-color:  #dcdcdc ; }
  
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
  margin:4px;
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

.ch {
   overflow:hidden;
   width:60px;
   -moz-border-radius: 9px 9px 9px 9px;
   -webkit-border-radius: 9px 9px 9px 9px;
   border-radius: 9px 9px 9px 9px;
   box-shadow: 1px 1px 11px #330033;
   background: white url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 29px center;
   
    border: 0;
   color: black;
   background: transparent;
   font-size: 14px;
   font-weight: bold;
   padding: 2px 10px;
   width: 88px;
   *width: 69px;
   *background: white;
     font-family :"한컴 윤고딕230";
}

.in {
      width: 10%;
      height:25px;
         padding: 10px 20px;
         margin: 5px 0;
         box-sizing: border-box;
         border: solid 1px gray;
         border-radius: 8px;
         
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
      <div id="contents">

  
         <form name="pro_Student_Search" method=post
            action="pro_StudentSearch.jsp?id=<%=id%>&pw=<%=pw%>">
          <b><font face="한컴 윤고딕230">학년</font></b>&nbsp;&nbsp;<SELECT name="column" class="ch">
               <OPTION value="" SELECTED>학년</OPTION>
               <OPTION value="one_level">1학년</OPTION>
               <OPTION value="two_level">2학년</OPTION>
               <OPTION value="three_level">3학년</OPTION>
               <OPTION value="four_level">4학년</OPTION>

            </SELECT>&nbsp;&nbsp; <input type="text" name="key1"  class="in"> 
            &nbsp;<INPUT TYPE="submit" NAME="btn" VALUE="조회" class="button">
         </form>
<hr></hr>

         <%
            Connection conn = null;
            PreparedStatement pstmt = null;

            ResultSet rs2 = null;
            ResultSet rs3 = null;

            String Query2 = "";
            String Query3 = "";

            String NAME = request.getParameter("fname");//pro_navi에서 파라미터 값 추출 <<처음실행할때
                                             //pro_StudentSearch에서 파라미터 값 추출<<학생이름 쓰고 검색버튼 눌렀을때 
            
            try {
               String jdbcUrl = "jdbc:mysql://localhost:3306/mydb";
               String jdbcId = "root";
               String jdbcPw = "rootpass";

               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

               if (NAME.equals("student")) //pro_navi에서 강제로 초깃값줌 
               {
                  Query2 = "select ass_nameStu, ass_idStu,ass_emailStu,ass_emailProf from assignStudent where ass_idProf =? order by ass_idStu";
                  //전체 학생 리스트 출력   
                  pstmt=conn.prepareStatement(Query2);    
                  pstmt.setString(1, id);
                  rs2=pstmt.executeQuery();
               
               } else 
               {
                  Query2 = "select ass_nameStu, ass_idStu,ass_emailStu,ass_emailProf from assignStudent where ass_idProf =?  AND ass_nameStu=? order by ass_idStu";
                  //검색한 학생 리스트 출력
                  pstmt = conn.prepareStatement(Query2);
                  pstmt.setString(1, id);
                  pstmt.setString(2, NAME);
                  rs2 = pstmt.executeQuery();               
               }
               
   
         %>

         
              <br><b><font face="한컴 윤고딕230">배정학생목록</font></b><BR> <BR>
         <TABLE>
         <thead>
            <TR>
               <TD>학생이름</TD>
               <TD>학번</TD>
               <TD>학생전화번호</TD>
               <TD>주소</TD>
               
            </TR>
            </thead>
            <%
               while (rs2.next()) 
               {
                  String stu_name = rs2.getString("ass_nameStu");
                  int stu_number = rs2.getInt("ass_idStu");
                  String stu_phone = rs2.getString("ass_emailStu");
                  String stu_add = rs2.getString("ass_emailProf");
                 
            %>
            <tr>
               <td><%=stu_name%></td>
               <td><%=stu_number%></td>
               <td><%=stu_phone%></td>
               <td><%=stu_add%></td>   
            </tr>
            
            <%
               }
            %>

         </TABLE>
         <%
            } catch (SQLException e) 
            {
               e.printStackTrace();
            } finally 
            {
               if (rs2 != null)
               try{rs2.close();}catch(SQLException sqle){}

               if(pstmt != null) 
                try{pstmt.close();}catch(SQLException sqle){}

               if(conn != null) 
               try{conn.close();}catch(SQLException sqle){}
            }
         %>
      </div>
      <div id="footer">
         <jsp:include page="../member/footer.jsp" flush="false"></jsp:include>
      </div>
   </div>
</body>
</html>