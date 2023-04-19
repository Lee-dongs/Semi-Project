<%@page import="com.kh.member.model.vo.Member"%>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="카공족을 위한 카페추천">
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
    <style>
         /*구글 웹 폰트 CDN*/
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
        body{
        /*
            background-image: url('resources/images/사진.jpg');
            background-repeat : no-repeat;
           object-fit : fill;    
        */
        }
        *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .outer{

        
            width: 100%;

            height: 300px;
            margin: auto;
        }
        div{
           
            box-sizing: border-box;
        }
        #header,#menubar{
            border: 1px solid black;
            width:100%;
        }
        #header{
            height: 80%;
        }
        #menubar{
            height: 20%;
        }
        /*================ login+header ================*/
        #header>div{
            height: 100%;
            float: left;
            text-align: center;
        }
        #header_1{
            width: 15%;
        }
        #header_2{
            width: 70%;
        }
        #header_3{
            width: 15%;
        }
        #login_form{
            margin-top: 50px;
        }
        .modal-footer a{
            text-decoration: none;
            color: black;
            font-size: 13px;
        }
        /*================ menubar ================*/
        #navi{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            height: 100%;
        }

        #navi>li{
            float: left;
            width: 15%;
            height: 100%;
            text-align: center;
            margin-top: 2px;
        }  
        #navi a{
            text-decoration: none;
            color: white;
            font-size: 15px;
            font-weight: 800;
            width: 60%;
            height: 90%;
            display: block;
            line-height: 40px;
            border-style: solid;
            border-radius: 120px;
            background-color: rgb(223, 223, 30);
            margin-left: 30px;
            box-sizing: border-box;
            transform: scale(1);
        }
        #navi a:hover{
            color: darkgray;
            font-size: 16px;
        }
        #navi>li>ul{
            list-style-type: none;
            padding: 0; 
            display: none; 
        }
        #navi>li>ul a{
            font-size: 12px;
        }
        #navi>li>ul a:hover{
            font-size: 13px;
        }
        #navi>li>a:hover +ul {
            display: block;
        }
        #navi>li>ul:hover{  
            display: block;
        }
        .list{
		width :70%;
		margin :auto;
		}

        /* ================ modal ================ */
        #header_3{
            position: relative;
        }
        #login-btn{
           border: 1px solid red;
           width: 150px;
           height: 30px; 
           position: absolute;
           margin: auto;
           top: 0;
           bottom: 0;
           left: 0;
           right: 0;
        }
        #login-btn>button{
            width: 100%;
            height: 100%;
            line-height: 10px;
            color: white;
        }
        .modal-title{
        font-weight: 600;
        color: rgb(220, 205, 35);
        margin: auto;
        }
        #login-table{
            margin: auto;
            height: 100%;
            width: 100%;
        }
        #login-table input{
            height: 100%;
            width: 100%;
        }
        #login-table>tbody button{
        	height: 100%;
        	width: 65%;
        }
        .modal-footer a{
            text-decoration: none;
            color: black;
            font-size: 13px;
        }

    </style>
</head>
<body>
    <div class="outer">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"><!--로그인모달영역 : 로그인전은 로그인버튼, 로그인 후 마이페이지 이동-->
         <%if(loginUser == null){ %>
                    <!-- Button to Open the Modal -->
                  <div id="login-btn">
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">로그인하기</button>
               	</div>
                <!-- The Modal -->
            <div class="modal" id="myModal">
            <div class="modal-dialog">
            <div class="modal-content">
  
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">우리사이트이름</h4>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <form action="<%=contextPath %>/login.me" method="post">
                    <table id="login-table">
                        <thead>
                            <tr>
                                <td>아이디</td>
                                <td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required></td>
                        
                            </tr>
                            <tr><td height="20"> </td></tr>
                            <tr>
                                <td>비밀번호</td>
                                <td><input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요" required></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2"><button type="submit" class="btn btn-success">로그인</button></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </tbody>
                    </table>
                </form>
                
                <img src="resources/images/kakao_login_medium_wide.png" id="kakao-login-btn" 
                onclick="kakaoLogin();">
                <form id="kakao-login-form" method="post" action="<%=contextPath %>/kakao-login.me">
                	<input type="hidden" name="email">
                	<input type="hidden" name="nickname">
                	<input type="hidden" name="birthday">
                </form>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <div id="resetPwd"><a href="">비밀번호 찾기</a></div>|
                <div id="findUserId"><a href="">아이디 찾기</a></div>|
                <div id="enroll"><a href="<%=contextPath%>/enrollForm.me">회원가입</a></div> 
            
            </div>
            <br>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            
        	</div>
        </div>
    </div>
    
    <%}else{ %>
    <div id="user-info">
     <b><%=loginUser.getUserName() %>님</b> 환영합니다. <br>
     <br>
     <div align="center">
  	   <a href="<%=contextPath%>/myPage.me">마이페이지</a>
  	   <a href="<%=contextPath%>/logout.me">로그아웃</a>
  	   <a href="javascript:void(0)">
       <input type="button" onclick="kakaoLogout();" class="btn btn-warning" value="카카오로그아웃">
       </a>
     </div>
    
    </div>
    
    
    <%} %>
        </div><!-- 헤더3끝 --> <!--로그인 모달 끝-->
        
            </div><!-- 헤더 끝 -->
           
            
            <div id="menubar">
                <ul id="navi">
                    <li><a href="">공지사항</a>
                        <ul>
                            <li><a href="">공지사항</a></li>
                            <li><a href="">FAQ</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=contextPath%>/list.bo?currentPage=1">자유게시판</a></li>
                    <li><a href="">카페등록요청</a></li>
                </ul>
            </div>

        </div>
        
        
   <!-- 카카오 로그인 -->
	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script>
	
	Kakao.init('698ae24b3c91e63011b0fe6f4bee6fe4');
	
	console.log(Kakao.isInitialized());
	
	// 로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response);
	        	  
	        	  var email = response.kakao_account.email;
	        	  var nickname = response.kakao_account.profile.nickname;
	        	  var birthday = response.kakao_account.birthday;
	        	  
	        	  $('input[name=email]').attr('value', email);
	        	  $('input[name=nickname]').attr('value', nickname);
	        	  $('input[name=birthday]').attr('value', birthday);
	        	  
	        	  document.querySelector('#kakao-login-form').submit();
	        	  
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	
	</script>
	










</body>
</html>