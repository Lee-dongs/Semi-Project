<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String contextPath = request.getContextPath();

    
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	
    	String alertMsg = (String)session.getAttribute("alertMsg");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카공족을 위한 카페추천 사이트</title>
    <!-- 부트스트랩 CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 제이쿼리 CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <style>
        body{
            background-image: scr;
        }
        .outer{
            border: 1px solid black;
            width: 1200px;
            height: 300px;
            margin: auto;
        }
        div{
            border: 1px solid black;
            box-sizing: border-box;
        }
        #header,#menubar,#content{
            border: 1px solid black;
            width:100%;
        }
        #header{
            height: 30%;
        }
        #menubar{
            height: 5%;
        }
        #content{
            height: 65%;
        }
        /*       login+header            */
        #header>div{
            height: 100%;
            float: left;
            text-align: center;
        }
        #header_1{
            width: 15%;
        }
        #header_2{
            width: 60%;
        }
        #header_3{
            width: 25%;

        }
        .modal-title{
            font-weight: 600;
            color: rgb(220, 205, 35);
         }
   
        #login_table{
            margin: auto;
            height: 100%;
            width: 100%;
       }
    
       #login_table input, #login_table>tbody button{
           height: 100%;
           width: 100%;
       }
        .modal-footer a{
            text-decoration: none;
            color: black;
            font-size: 13px;
       }
        /*        menubar      */
        #navi{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            height: 100%;
        }

        #navi>li{
            display: inline-block;
            width: 15%;
            height: 100%;
            text-align: center;
            vertical-align: top;
        }  
        #navi a{
            transform: scale(1);
            text-decoration: none;
            color: yellowgreen;
            font-size: 15px;
            font-weight: 800;
            width: 100%;
            height: 100%;
            display: block;
            line-height: 40px;
        }
        #navi a:hover{
            color: darkgray;
            font-size: 15px;
        }
        #navi>li>ul{
            list-style-type: none;
            padding: 0px; 
            display: none; 
        }
        #navi>li>ul a{
            font-size: 13px;
        }
    </style>
</head>
<body>
<script>
		//script태그 내에서도 스크립틀릿과 같은 jsp요소를 사용할 수 있다.
		var msg="<%=alertMsg %>";//성공적으로 로그인 되었습니다/null
		
		if(msg !="null"){
			alert(msg);
			//알람메세지 한번 띄웠으면 지워주기 지우지 않으면 매번 menubar.jsp가 열릴때마다 알람뜸
			
			<%session.removeAttribute("alertMsg");%>
			
		}
	</script>
    <div class="outer">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3">
                                <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">우리사이트 로그인하기</button>
  
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">우리사이트이름</h4>
        </div>

    </div>
    
    
    <div id="user-info">
     <b><%=loginUser.getUserName() %>님</b> 환영합니다. <br>
     <br>
     <div align="center">
  	   <a href="<%=contextPath%>/myPage.me">마이페이지</a>
  	   <a href="<%=contextPath%>/logout.me">로그아웃</a>
     </div>
    
    </div>
    
    
    
        </div><!-- 헤더3끝 --> <!--로그인 모달 끝-->
        
            </div><!-- 헤더 끝 -->
           
            
            <div id="menubar">
                <ul id="navi">

                    <li><a href="list.no">공지사항</a>

                        <ul>
                            <li><a href="list.no">공지사항</a></li>
                            <li><a href="list.fo">FAQ</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=contextPath%>/list.bo?currentPage=1">자유게시판</a></li>
                    <li><a href="">카페등록요청</a></li>
                </ul>
            </div>
=======
  
        <!-- Modal body -->
        <div class="modal-body">
            <form action="login.me">
                <table id="login_table">
                    <thead>
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" id="inputId" name="inputId" placeholder="아이디를 입력하세요" required></td>
                    
                        </tr>
                        <tr><td height="20"> </td></tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" id="inputPwd" name="inputPwd" placeholder="비밀번호를 입력하세요" required></td>
                        </tr>
                        <tr><td height="20"> </td></tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2"><button type="submit" class="btn btn-success">로그인</button></td>
                        </tr>
                        <tr><td height="20"> </td></tr>
                        <tr>
                            <td colspan="2"><input type="button" class="btn btn-warning" value="카카오간편로그인"></td>
                        </tr>
                    </tbody>
                </table>
>>>>>>> refs/remotes/origin/main

            </form>
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
            <div id="resetPwd"><a href="">비밀번호 찾기</a></div>|
            <div id="findUserId"><a href="">아이디 찾기</a></div>|
            <div id="enroll"><a href="">회원가입</a></div> 
          
        </div>
        <br>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
  
      </div>
    </div>
  </div>
        </div>
        <div id="menubar">
            <ul id="navi">
                <li><a href="">공지사항</a>
                    <ul>
                        <li><a href="">공지사항</a></li>
                        <li><a href="">FAQ</a></li>
                    </ul>
                </li>
                <li><a href="<%=contextPath%>/list.bo?currentPage=1">자유게시판</a></li>
                <li><a href="<%=contextPath%>/cafeRequest.co">카페등록요청</a></li>
            </ul>
        </div>
      </div>
      </div>
</body>
</html>