<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    <%
    	String contextPath = request.getContextPath();
    
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	Attachment profileAt = (Attachment)session.getAttribute("profileAt");

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
    <!-- 네이버로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
    <style>
         /*웹 폰트 CDN*/
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
     @font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    
    
}
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
        .menubar-outer{
            width: 100%;
            height: 300px;
            margin: auto;
        }
        div{
            box-sizing: border-box;
        }
        #header,#menubar{
            width:100%;
        }
        #header{
        	background-color: #FFDC7C;
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
            width: 20%;
        }
        #header_2{
            width: 60%;
            margin: auto;
        }
        #header_3{
            width: 20%;
        }
        #login_form{
            margin-top: 50px;
        }
        #login-modal .modal-footer a{
            text-decoration: none;
            color: black;
            font-size: 13px;
        }
        #header_2 #logo-img{
        	display: block;
        	margin: auto;
        	margin-top: 40px;
        	height : 150px; 
        	width : 350px;
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
            font-size: 18px;
            font-weight: 800;
            width: 60%;
            height: 90%;
            display: block;
            line-height: 47px;
            border-style: solid;
            border-radius: 120px;
            background-color: #6DA292;
            margin-left: 30px;
            box-sizing: border-box;
            transform: scale(1);
        }
        #navi a:hover{
            color: white;
            font-size: 16px;
        }
        #navi>li>ul{
            list-style-type: none;
            padding: 0; 
            display: none; 
        }
        #navi>li>ul a{
            font-size: 17px;
        }
        #navi>li>ul a:hover{
            font-size: 14px;
        }
        #navi>li>a:hover +ul {
            display: block;
        }
        #navi>li>ul:hover{  
            display: block;
        }
        .menubar-outer .list{
			width :70%;
			margin :auto;
		}

        /* ================ login-modal ================ */
        #header_3{
            position: relative;
        }
        #header_3 #login-btn{
           	width: 150px;
	        height: 30px; 
	        position: absolute;
         	right: 0;
         	margin: 10px 10px;
        }
        #login-btn>button{
        	background-color: #FFDC7C;
        	border: none;
        	color: #006699;
        }
        #header_3 #submit-btn{
            width: 100%;
            height: 100%;
            line-height: 10px;
            color: white;
        }
        #login-modal .modal-title{
	        font-weight: 600;
	        color: rgb(220, 205, 35);
	        margin: auto;
        }
        #login-modal #login-table{
            margin: auto;
            height: 100%;
            width: 100%;
        }
        #login-modal #login-table input{
            height: 100%;
            width: 100%;
        }
        #login-modal #login-table>tbody button{
        	height: 100%;
        	width: 100%;
        }
        #login-modal .modal-footer a{
            text-decoration: none;
            color: black;
            font-size: 13px;
        }
        #login-modal #page-title{
	        font-size: 30px;
	        font-family: 'SDSamliphopangche_Outline';
	        color: #6DA292;
        }
        
       /* ================ 회원정보카드 ================ */
        .info-card{
	        width: 90%;
	        height: 60%;
	        border: 2px solid #6DA292;
	        border-radius: 5%;
	        box-sizing: border-box;
	        position: absolute;
	        top: 0;
	        bottom: 0;
	        left: 0;
	        right: 0;
	        margin: auto;
	    }
	    #info-table{
	        padding: 10px 5px;
	        width: 100%;
	        height: 100%;
	    }
	    .info-wrap thead img{
	        width: 11px;
	        height: 11px;
	    }
	    .info-card #managerPage{
	    	padding-bottom: 0px;
	    	padding-top: 20px;   	
	    }
	    .info-card #logout{
	    	padding-top: 5px;
	    }
	    #info-table button{
	    	text-align: right;
	    }
	    /*프로필사진, 프로필모달*/
	   .filebox{
	   		display: flex;
	   		align-items: center;
	   }
	   .filebox .upload-name {
	   		flex: 1;
		    display: inline-block;
		    height: 40px;
		    padding: 0 10px;
		    vertical-align: middle;
		    border: 1px solid #dddddd;
		    color: #999999;
		}
		
		.filebox label {
			padding: 5px 10px;
		    color: #fff;
		    background-color: #999999;
		    cursor: pointer;
		    height: 40px;
		    margin: auto;
		    font-size: 9px;
		    line-height: 28px
		    line-height: 10px;
		   
		}
		.filebox input[type="file"] { /*원래 css 지우기*/
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
	 	/*프로필사진*/
	 	.box{
	 		width: 100px;
		    height: 100px; 
		    border-radius: 70%;
		    overflow: hidden;
	 	}
	 	#profileImg{
	 		width: 100%;
		    height: 100%;
		    object-fit: cover;
		    border: 0;
	 	}
	    
    </style>
</head>
<body>
 
	<script>
	// alert창 한 번 띄워주기
	var msg = "<%=alertMsg%>";
	
	if(msg !="null"){
		alert(msg);
		
		<%session.removeAttribute("alertMsg");%>
	}
	</script>
	<!-- alert메시지 부트스트랩으로 해봤어요 
	<%if(alertMsg != null){ %>
	<div class="alert alert-success alert-dismissible fade show">
  <strong>Success!</strong> <%=alertMsg%>
	</div>
	<% session.removeAttribute("alertMsg"); } %>
	
	<script>
	setTimeout(function() {
	    document.querySelector('.alert').style.display = 'none';
	  }, 1500);
	</script>
-->


    <div class="menubar-outer">
        <div id="header">
            <div id="header_1" style="border: none">
            </div>
            <div id="header_2" style="border: none">
	            <a href="http://localhost:8888/semiProject/">
	             <img id="logo-img" src="resources/images/로고파랑.png" >
	            </a>
            </div>
            <div id="header_3" style="border: none"><!--로그인모달영역 : 로그인전은 로그인버튼, 로그인 후 마이페이지 이동-->
         <%if(loginUser == null){ %>
 
            <div id="login-btn" style="border: none">
            	<button type="button" data-toggle="modal" data-target="#login-modal" style="font-size:15px">로그인 / 회원가입</button>
          	</div>
               
            <div class="modal" id="login-modal">
            	<div class="modal-dialog">
            		<div class="modal-content">
  
            <div class="modal-header">
            	<img src="resources/images/로고노랑.png" width="300" height="100">
            </div>
    
  
            <div class="modal-body">
                <form action="<%=contextPath %>/login.me" method="post">
                    <table id="login-table">
                        <thead>
                            <tr>
                                <td>아이디</td>
                                <td><input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요" required></td>
                        
                            </tr>
                            <tr><td height="20"> </td></tr>
                            <tr>
                                <td>비밀번호</td>
                                <td><input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요" required></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </thead>
                        <tbody>
                            <tr width="300" height="45">
                                <td colspan="2"><button type="submit" id="submit-btn"class="btn btn-success">로그인</button></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </tbody>
                    </table>
                </form>
                
                <img src="resources/images/kakao_login_medium_wide.png" id="kakao-login-btn" onclick="kakaoLogin();">
	               	 <form id="kakao-login-form" method="post" action="<%=contextPath %>/kakao-login.me">
	                	<input type="hidden" name="email">
	                	<input type="hidden" name="nickname">
	                	<input type="hidden" name="birthday">
	                </form>
	                <!-- 네이버 로그인 -->
	                 <!-- 네이버 로그인 버튼 노출 영역 -->
					  	<div id="naver_id_login" style="display:none"></div>
					 <!-- //네이버 로그인 버튼 노출 영역 -->
  					<script>
					  <%
					  	String clientId = "aIxQUJI0DPZGmIDYZ94e";//애플리케이션 클라이언트 아이디값";
					    String redirectURI = URLEncoder.encode("http://localhost:8888/semiProject/naverLogin.me", "UTF-8");
					    SecureRandom random = new SecureRandom();
					    String state = new BigInteger(130, random).toString();
					    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					    apiURL += "&client_id=" + clientId;
					    apiURL += "&redirect_uri=" + redirectURI;
					    apiURL += "&state=" + state;
					    session.setAttribute("state", state);	
					    
					 %>
					
					 </script>
					 
					
            </div>
    
 
            <div class="modal-footer">
                <div id="resetPwd"><a href="<%=contextPath%>/findUserInfo.me">비밀번호 찾기</a></div>|
                <div id="findUserId"><a href="<%=contextPath%>/findUserInfo.me">아이디 찾기</a></div>|
                <div id="enroll"><a href="<%=contextPath%>/enrollForm.me">회원가입</a></div> 
            </div>
            	<br>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
            
        	</div>
        </div>
    </div>
    
    <%}else{%> <!-- 회원정보카드 -->
    <div class="info-wrap">
        <div class="info-card">
            <table id="info-table">
                <thead>
                    <tr>
                        <td id="showUserRank"><img src="resources/images/user.png"><small><%=loginUser.getUserName() %></small></td>
                        <td id="logout">
                            <input type="button" class="logout btn btn-sm btn-outline-info" value="로그아웃&gt;"></td>
                    </tr>
                </thead>
                <tbody>
                	<tr>
			            <%if(profileAt == null){ %>
						<!-- 첨부파일이 없는 경우 -->
						<td rowspan="2"><input type="button" id="upload-profile" class="btn btn-sm btn-outline-info" value="프로필등록&gt;" 
							data-toggle="modal" data-target="#profile-modal"></td>
						<%}else{ %>
						<!-- 첨부파일이 있는 경우 -->
						<td rowspan="2">
							<div class="box">
								<img src="<%=contextPath + profileAt.getFilePath() + '/' + profileAt.getChangeName()%>" 
									id="profileImg"  data-toggle="modal" data-target="#profile-modal"  style="cursor:pointer">
							</div>
						</td>
						<%} %>
						<td id="managerPage">
                            <input type="button" id="managerPage-btn" class="managerPage btn btn-sm btn-outline-info" value="관리페이지&gt;" 
                            	style="display:none"></td>
					</tr>
                    <tr>
                        <td id="myPage">
                            <input type="button" class="myPage btn btn-sm btn-outline-info" value="나의정보&gt;"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!--프로필사진 변경/등록/삭제모달 -->
	<div class="modal" id="profile-modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	 
	      <div class="modal-header">
	        <h4 class="modal-title">프로필사진 관리</h4>
	      </div>
	      
	     <form id="update-profile">
	     	<div class="modal-body">
	     	 	<table>
	     	 		<tr>
	     	 			<%if(loginUser != null && profileAt != null){ %>
	     	 			<td rowspan="2"><img src="<%=contextPath + profileAt.getFilePath() + '/' + profileAt.getChangeName()%>" class="profileImg" width="150" height="170"></td>
	     	 			<td>
	     	 				<div class="filebox">
							    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
							    <label for="file">파일찾기</label> 
							    <input type="file" id="file" name="updateProfile" onchange="loadImg(this);">
							</div>
	     	 			
	     	 			<input type="hidden" name="fileNo" value="<%=profileAt.getFileNo() %>">
						<input type="hidden" name="originFileName" value="<%=profileAt.getChangeName() %>"></td>
	     	 			
	     	 			<%}else{ %>
	     	 			<td rowspan="2"><img src="resources/images/빵먹는 도라에몽.png" class="profileImg" width="200" height="170" ><br>
	     	 			프로필 사진이 아직 없어요</td>
	     	 			<td><input type="file" class="form-control" name="updateProfile" value="프로필사진 등록" onchange="loadImg(this);"></td>
	     	 			<%} %>
	     	 		</tr>
	     	 		<tr>
	     	 			<td><button type="button" id="deleteProfile" name="deleteProfile" class="btn btn-warning">프로필사진 삭제</button></td>
	     	 		</tr>
	     	 	</table>
	      	</div>
	
		      <div class="modal-footer">
		      	<button type="submit" id="form-submit-btn"class="btn btn-info">수정하기</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		</form>
		
	    </div>
	  </div>
	</div>
	<!-- 프로필변경 모달 끝 -->
	
    <script>
    // 프로필 변경 모달에서 파일 첨부하면 파일명 보이게
    $("#file").on('change',function(){
  		var fileName = $("#file").val();
 		 $(".upload-name").val(fileName);
	});
    
    // 관리자면 관리자페이지 이동 버튼 보이게
    if(<%=loginUser != null && loginUser.getUserId().equals("admin")%>){
    	$("#managerPage-btn").css("display","block");
    }
    // 프로필사진 등록 및 수정 - 멀티파트 폼 데이터 ajax처리
    $("#form-submit-btn").click(function(){
    	
    	var form = $("#update-profile")[0];
    	var formData = new FormData(form);
    	
    	$.ajax({
    		url : 'updateProfile.me',
    		type : 'post',
    		enctype : 'multipart/form-data',
    		data : formData,
    		contentType : false,
    		processData : false,
    		cache: false,
    		success : function(result){
    		 	window.alert(result);
    		 	location.reload();
    		},
    		error : function(){
    			console.log("통신실패");
    		}
    	});
    	
    });
    
    // 프로필사진 수정 미리보기 
    function loadImg(inputFile){
    	//console.log(inputFile.files)
    	if(inputFile.files.length == 1) {// 새로 프로필사진을 선택하면
    		var reader = new FileReader(); // 파일 읽어줄 객체
    		reader.readAsDataURL(inputFile.files[0]); // 파일읽어서 url부여
    		
    		reader.onload = function(e){
    			//console.log(e);
    			//console.log(e.target.result);
    			
    			$("#profile-modal .profileImg").attr("src", e.target.result);
    		}
    	}
    	
    };
    
    
    // 프로필사진 삭제
    $("#deleteProfile").click(function(){
    	var userNo = <%=loginUser.getUserNo()%>
    	
    	if(<%=profileAt ==null%>){
    		alert("삭제할 프로필이 없습니다.");
    	}else{
    		
	    	if(window.confirm("정말 프로필을 초기화 하실건가요?")){
	    		$.ajax({
	    			type : "post",
	        		url : "deleteProfile.me",
	        		data : { userNo : userNo },
	        		success : function(result){
	        			
	        			if(result > 0){
		        			alert("프로필을 삭제했습니다.");
		        			location.reload();
	        			}else{
	        				alert("프로필 삭제에 실패했습니댜.");
	        			}
	        		},
	        		
	        		error: function(){
	        			console.log("통신실패");
	        		}    		
	        	});
	    	}else{
	    		$("#profile-modal").css("display","none"); // 프로필 수정 모달닫기
	    	}
    	}
    });
    
    $(".myPage").click(function(){
    	location.href="<%=contextPath%>/myPage.me?uno=<%=loginUser.getUserNo()%>";
    });
   
    </script>
    <%} %>
        </div><!-- 헤더3끝 --> <!--로그인 모달 끝-->
       
      </div><!-- 헤더 끝 -->
            
            <div id="menubar">
                <ul id="navi">
                    <li><a href="<%=contextPath%>/list.no">공지사항</a>
                        <ul>
                            <li><a href="<%=contextPath%>/list.no">공지사항</a></li>
                            <li><a href="<%=contextPath%>/list.fo?currentPage=1">FAQ</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=contextPath%>/list.bo?currentPage=1&sort=1">자유게시판</a></li>
                    <li><a href="<%=contextPath%>/cafeRequest.co">카페등록요청</a></li>
                </ul>
            </div>

        </div>
        
     
	
    
	<script>
    
    $(".logout").click(function(){
    	location.href="<%=contextPath%>/logout.me";
    });
    $(".managerPage").click(function(){
    	location.href="<%=contextPath%>/adminPage.ma";
    });
    
    </script>
	   
        
   <!-- 카카오 로그인 -->
	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script>
	Kakao.init('698ae24b3c91e63011b0fe6f4bee6fe4');
	
	//console.log(Kakao.isInitialized());
	
	// 카카오로그인
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
	  };
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
	  };  
	
	// 모달 닫기
	function closeModal(){
		var modal = document.getElementById("login-modal");
		modal.style.display = "none";
	};
	
	
	
	</script>

</body>
</html>
