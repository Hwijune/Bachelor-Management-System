<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Touch Swipeable Sidebar Menu</title>
<style>
body, html {
   height: 100%;
   margin: 0;
   overflow: hidden;
   font-family: helvetica;
   font-weight: 100;
}

.menu {
   position: relative;
   height: 100%;
   width: 100%;
   left: 0;
   -webkit-transition: left 0.4s ease-in-out;
   -moz-transition: left 0.4s ease-in-out;
   -ms-transition: left 0.4s ease-in-out;
   -o-transition: left 0.4s ease-in-out;
   transition: left 0.4s ease-in-out;
}

.menu.open-sidebar {
   left: 240px;
}

.swipe-area {
   position: absolute;
   width: 50px;
   left: 0;
   top: 0;
   height: 100%;
   background: #e5e3e4; <%-- 스와이프 들어갔을때 색 --%>
   z-index: 0;
}

#sidebar {
   background: #DF314D; <%-- 사이드바 안 색 --%>
   position: absolute;
   width: 240px;
   height: 100%;
   left: -240px;
   box-sizing: border-box;
   -moz-box-sizing: border-box;
}

#sidebar ul {
   margin: 0;
   padding: 0;
   list-style: none;
}

#sidebar ul li {
   margin: 0;
}

#sidebar ul li a {
   padding: 15px 20px;
   font-size: 16px;
   font-weight: 100;
   color: white; <%-- 글자 색 --%>
   text-decoration: none;
   display: block;
   border-bottom: 1px solid #ffffff; <%-- 테두리 밑색 --%>
   -webkit-transition: background 0.3s ease-in-out;
   -moz-transition: background 0.3s ease-in-out;
   -ms-transition: background 0.3s ease-in-out;
   -o-transition: background 0.3s ease-in-out;
   transition: background 0.3s ease-in-out;
}

#sidebar ul li:hover a { <%-- 메뉴색 --%>
   background: #C9223D;
}

.main-content {
   width: 100%;
   height: 100%;
   padding: 10px;
   box-sizing: border-box;
   -moz-box-sizing: border-box;
   position: relative;
}

.main-content .content {
   box-sizing: border-box;
   -moz-box-sizing: border-box;
   padding-left: 60px;
   width: 100%;
}

.main-content .content h1 {
   font-weight: 100;
}

.main-content .content p {
   width: 100%;
   line-height: 160%;
}

.main-content #sidebar-toggle {
   background: #DF314D; <%-- 토글 버튼 색 --%>
   border-radius: 3px;
   display: block;
   position: relative;
   padding: 10px 7px;
   float: left;
}

.main-content #sidebar-toggle .bar {
   display: block;
   width: 18px;
   margin-bottom: 3px;
   height: 2px;
   background-color: #fff;
   border-radius: 1px;
}

.main-content #sidebar-toggle .bar:last-child {
   margin-bottom: 0;
}

body {
  font-family: "Lato", Helvetica, Arial;
  font-size: 16px;
}

.text-center {
  text-align: center;
}

*, *:before, *:after {
  -webkit-border-sizing: border-box;
  -moz-border-sizing: border-box;
  border-sizing: border-box;
}

.container {
  width: 200px;
  margin: 50px auto;
}
.container > ul {
  list-style: none;
  padding: 0;
  margin: 0 0 20px 0;
}

.dropdown a {
  text-decoration: none;
}
.dropdown [data-toggle="dropdown"] {
  position: relative;
  display: block;
  color: white;
  background: #c9314d; <%-- 안 박스 색 --%>
  -moz-box-shadow: 0 1px 0 #c9314d inset, 0 -1px 0 #c9314d inset;
  -webkit-box-shadow: 0 1px 0 #c9314d inset, 0 -1px 0 #c9314d inset;
  box-shadow: 0 1px 0 #c9314d inset, 0 -1px 0 #c9314d inset;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.3);
  padding: 10px;
}
.dropdown [data-toggle="dropdown"]:hover {
  background: #2c89c6;
}
.dropdown .icon-arrow {
  position: absolute;
  display: block;
  font-size: 0.7em;
  color: #fff;
  top: 14px;
  right: 10px;
}
.dropdown .icon-arrow.open {
  -moz-transform: rotate(-180deg);
  -ms-transform: rotate(-180deg);
  -webkit-transform: rotate(-180deg);
  transform: rotate(-180deg);
  -moz-transition: -moz-transform 0.6s;
  -o-transition: -o-transform 0.6s;
  -webkit-transition: -webkit-transform 0.6s;
  transition: transform 0.6s;
}
.dropdown .icon-arrow.close {
  -moz-transform: rotate(0deg);
  -ms-transform: rotate(0deg);
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -moz-transition: -moz-transform 0.6s;
  -o-transition: -o-transform 0.6s;ㅂ.
  .
  
   
  -webkit-transition: -webkit-transform 0.6s;
  transition: transform 0.6s;
}
.dropdown .icon-arrow:before {
  content: '\25BC';
}
.dropdown .dropdown-menu {
  max-height: 0;
  overflow: hidden;
  list-style: none;
  padding: 0;
  margin: 0;
}
.dropdown .dropdown-menu li {
  padding: 0;
}
.dropdown .dropdown-menu li a {
  display: block;
  color: #fa8072;
  background: #e79faa; <%-- 드롭다운 안 색 --%>
  -moz-box-shadow: 0 1px 0 white inset, 0 -1px 0 #d5d5d5 inset;
  -webkit-box-shadow: 0 1px 0 white inset, 0 -1px 0 #d5d5d5 inset;
  box-shadow: 0 1px 0 white inset, 0 -1px 0 #d5d5d5 inset;
  text-shadow: 0 -1px 0 rgba(255, 255, 255, 0.3);
  padding: 10px 10px;
}
.dropdown .dropdown-menu li a:hover {
  background: #e79faa;
}
.dropdown .show, .dropdown .hide {
  -moz-transform-origin: 50% 0%;
  -ms-transform-origin: 50% 0%;
  -webkit-transform-origin: 50% 0%;
  transform-origin: 50% 0%;
}
.dropdown .show {
  display: block;
  max-height: 9999px;
  -moz-transform: scaleY(1);
  -ms-transform: scaleY(1);
  -webkit-transform: scaleY(1);
  transform: scaleY(1);
  animation: showAnimation 0.5s ease-in-out;
  -moz-animation: showAnimation 0.5s ease-in-out;
  -webkit-animation: showAnimation 0.5s ease-in-out;
  -moz-transition: max-height 1s ease-in-out;
  -o-transition: max-height 1s ease-in-out;
  -webkit-transition: max-height 1s ease-in-out;
  transition: max-height 1s ease-in-out;
}
.dropdown .hide {
  max-height: 0;
  -moz-transform: scaleY(0);
  -ms-transform: scaleY(0);
  -webkit-transform: scaleY(0);
  transform: scaleY(0);
  animation: hideAnimation 0.4s ease-out;
  -moz-animation: hideAnimation 0.4s ease-out;
  -webkit-animation: hideAnimation 0.4s ease-out;
  -moz-transition: max-height 0.6s ease-out;
  -o-transition: max-height 0.6s ease-out;
  -webkit-transition: max-height 0.6s ease-out;
  transition: max-height 0.6s ease-out;
}

@keyframes showAnimation {
  0% {
    -moz-transform: scaleY(0.1);
    -ms-transform: scaleY(0.1);
    -webkit-transform: scaleY(0.1);
    transform: scaleY(0.1);
  }
  40% {
    -moz-transform: scaleY(1.04);
    -ms-transform: scaleY(1.04);
    -webkit-transform: scaleY(1.04);
    transform: scaleY(1.04);
  }
  60% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.04);
    -ms-transform: scaleY(1.04);
    -webkit-transform: scaleY(1.04);
    transform: scaleY(1.04);
  }
  100% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.02);
    -ms-transform: scaleY(1.02);
    -webkit-transform: scaleY(1.02);
    transform: scaleY(1.02);
  }
  100% {
    -moz-transform: scaleY(1);
    -ms-transform: scaleY(1);
    -webkit-transform: scaleY(1);
    transform: scaleY(1);
  }
}
@-moz-keyframes showAnimation {
  0% {
    -moz-transform: scaleY(0.1);
    -ms-transform: scaleY(0.1);
    -webkit-transform: scaleY(0.1);
    transform: scaleY(0.1);
  }
  40% {
    -moz-transform: scaleY(1.04);
    -ms-transform: scaleY(1.04);
    -webkit-transform: scaleY(1.04);
    transform: scaleY(1.04);
  }
  60% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.04);
    -ms-transform: scaleY(1.04);
    -webkit-transform: scaleY(1.04);
    transform: scaleY(1.04);
  }
  100% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.02);
    -ms-transform: scaleY(1.02);
    -webkit-transform: scaleY(1.02);
    transform: scaleY(1.02);
  }
  100% {
    -moz-transform: scaleY(1);
    -ms-transform: scaleY(1);
    -webkit-transform: scaleY(1);
    transform: scaleY(1);
  }
}
@-webkit-keyframes showAnimation {
  0% {
    -moz-transform: scaleY(0.1);
    -ms-transform: scaleY(0.1);
    -webkit-transform: scaleY(0.1);
    transform: scaleY(0.1);
  }
  40% {
    -moz-transform: scaleY(1.04);
    -ms-transform: scaleY(1.04);
    -webkit-transform: scaleY(1.04);
    transform: scaleY(1.04);
  }
  60% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.04);
    -ms-transform: scaleY(1.04);
    -webkit-transform: scaleY(1.04);
    transform: scaleY(1.04);
  }
  100% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.02);
    -ms-transform: scaleY(1.02);
    -webkit-transform: scaleY(1.02);
    transform: scaleY(1.02);
  }
  100% {
    -moz-transform: scaleY(1);
    -ms-transform: scaleY(1);
    -webkit-transform: scaleY(1);
    transform: scaleY(1);
  }
}
@keyframes hideAnimation {
  0% {
    -moz-transform: scaleY(1);
    -ms-transform: scaleY(1);
    -webkit-transform: scaleY(1);
    transform: scaleY(1);
  }
  60% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.02);
    -ms-transform: scaleY(1.02);
    -webkit-transform: scaleY(1.02);
    transform: scaleY(1.02);
  }
  100% {
    -moz-transform: scaleY(0);
    -ms-transform: scaleY(0);
    -webkit-transform: scaleY(0);
    transform: scaleY(0);
  }
}
@-moz-keyframes hideAnimation {
  0% {
    -moz-transform: scaleY(1);
    -ms-transform: scaleY(1);
    -webkit-transform: scaleY(1);
    transform: scaleY(1);
  }
  60% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.02);
    -ms-transform: scaleY(1.02);
    -webkit-transform: scaleY(1.02);
    transform: scaleY(1.02);
  }
  100% {
    -moz-transform: scaleY(0);
    -ms-transform: scaleY(0);
    -webkit-transform: scaleY(0);
    transform: scaleY(0);
  }
}
@-webkit-keyframes hideAnimation {
  0% {
    -moz-transform: scaleY(1);
    -ms-transform: scaleY(1);
    -webkit-transform: scaleY(1);
    transform: scaleY(1);
  }
  60% {
    -moz-transform: scaleY(0.98);
    -ms-transform: scaleY(0.98);
    -webkit-transform: scaleY(0.98);
    transform: scaleY(0.98);
  }
  80% {
    -moz-transform: scaleY(1.02);
    -ms-transform: scaleY(1.02);
    -webkit-transform: scaleY(1.02);
    transform: scaleY(1.02);
  }
  100% {
    -moz-transform: scaleY(0);
    -ms-transform: scaleY(0);
    -webkit-transform: scaleY(0);
    transform: scaleY(0);
  }
}

</style>
</head>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>

<body>


   <div class="menu">
      <div id="sidebar">
         <div class="container">
            <ul>
               <li class="dropdown"><a href="#" data-toggle="dropdown"> 학생관리 및 개인신상 <i class="icon-arrow"></i>
               </a>
                  <ul class="dropdown-menu">
                     <ul>
        <li><a href='../professor/pro_Profile.jsp?id=<%=id%>&pw=<%=pw%>'>개인신상정정</a></li>
        <li><a href='../professor/pro_Consult_Check.jsp?id=<%=id%>&pw=<%=pw%>'>상담이력확인 및 입력</a></li>
        <%
        //배정학생내역 아직 초기값전달x
        %>
        <li><a href='../professor/pro_Consult_stulist.jsp?fname=student&id=<%=id%>&pw=<%=pw%>'>배정학생내역</a></li>
        <li><a href='../professor/pro_stulist.jsp?id=<%=id%>&pw=<%=pw%>'>학생성적입력</a></li>
      </ul>
      </ul>
      </li>
      
               <li class="dropdown"><a href="#" data-toggle="dropdown"> 수업관리 <i class="icon-arrow"></i>
               </a>
                  <ul class="dropdown-menu">
                     <ul>
        <li><a href='../professor/pro_L_list.jsp?id=<%=id%>&pw=<%=pw%>'>확인 및 강의계획서</a></li>
        <li><a href='../professor/pro_schedule.jsp?id=<%=id%>&pw=<%=pw%>'>당해학기 수업시간표</a></li>
                  </ul>
                  </ul></li>
            </ul>
         </div>
      </div>
      <div class="main-content">
         <div class="swipe-area"></div>
         <a href="#" data-toggle=".menu" id="sidebar-toggle"> <span
            class="bar"></span> <span class="bar"></span> <span class="bar"></span>
         </a>
         <div class="content"></div>
      </div>
   </div>


   <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   <script
      src="http://www.blueb.co.kr/SRC2/swipemenu/jquery.touchSwipe.min.js"></script>

   <script>
      $(window).load(
            function() {
               $("[data-toggle]").click(function() {
                  var toggle_el = $(this).data("toggle");
                  $(toggle_el).toggleClass("open-sidebar");
               });
               $(".swipe-area")
                     .swipe(
                           {
                              swipeStatus : function(event, phase,
                                    direction, distance, duration,
                                    fingers) {
                                 if (phase == "move"
                                       && direction == "right") {
                                    $(".menu").addClass(
                                          "open-sidebar");
                                    return false;
                                 }
                                 if (phase == "move"
                                       && direction == "left") {
                                    $(".menu").removeClass(
                                          "open-sidebar");
                                    return false;
                                 }
                              }
                           });
            });

      //Dropdown Menu
      var dropdown = document.querySelectorAll('.dropdown');
      var dropdownArray = Array.prototype.slice.call(dropdown, 0);
      dropdownArray
            .forEach(function(el) {
               var button = el.querySelector('a[data-toggle="dropdown"]'), menu = el
                     .querySelector('.dropdown-menu'), arrow = button
                     .querySelector('i.icon-arrow');

               button.onclick = function(event) {
                  if (!menu.hasClass('show')) {
                     menu.classList.add('show');
                     menu.classList.remove('hide');
                     arrow.classList.add('open');
                     arrow.classList.remove('close');
                     event.preventDefault();
                  } else {
                     menu.classList.remove('show');
                     menu.classList.add('hide');
                     arrow.classList.remove('open');
                     arrow.classList.add('close');
                     event.preventDefault();
                  }
               };
            })

      Element.prototype.hasClass = function(className) {
         return this.className
               && new RegExp("(^|\\s)" + className + "(\\s|$)")
                     .test(this.className);
      };
   </script>

</body>
</html>