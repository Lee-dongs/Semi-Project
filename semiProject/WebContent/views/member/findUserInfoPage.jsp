<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기</title>

<style>
        .find-wrap{
            width: 700px;
            height: 500px;
            margin: auto;
        	position :relative;
        	border: 2px solid black;
        	position :relative;
        	margin-top: 60px;
        	border-radius: 20px;
        }
        .findInfo{
            margin: auto;
            text-align: center;
        }
        #find-title>p{
        	font-family: 'SDSamliphopangche_Outline';
            font-size: 40px;
            color : black;
            line-height: 4;
            margin: auto;
            margin-top: 10px;
            display: block;
            width: 80%;
            border-bottom: double black 3px;
       
        }
        .find-userId table, .find-userPwd table{
        	width : 100%;
        	height: 100%;
        	border-collapse: separate;
 			border-spacing: 0 10px;
        }
        
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div class="find-wrap">
    
         <div class="findInfo" id="find-title">
            <p>찾으시려는 정보를 선택해주세요.</p>
        </div>
        <br><br><br>
        <!--아이디찾기 모달-->
        <div class="findInfo">
            <!-- Button to Open the Modal -->
             <button type="button" class="btn btn-lg btn-outline-info" data-toggle="modal" data-target="#findUserIdModal">
            	아이디 찾기
            </button>
  
            <!-- The Modal -->
            <div class="modal" id="findUserIdModal">
                <div class="modal-dialog">
                	<div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="find-userId">
                            <table>
                        		<tr>
                        			<td><b>이름</b></td>
                        			<td colspan="2"><input type="text" class="form-control" id="findId-userName" name="findId-userName" required></td>
                        		</tr>
                        		<tr>
                        			<td><b>이메일</b></td>
                        			<td><input type="email" class="form-control" id="findId-userEmail" name="findId-userEmail" placeholder="이메일 주소를 입력해주세요." required></td>
                                	<td><input type="button" class="btn btn-secondary btn-sm" id="findId-emailChk" onclick="findUserId()" value="이메일 전송"><br></td>
                        	</table>
                        	
	                        <div class="text-center">
	                    		<div class="btn-gruop">
	                    			<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="findCompleted()">확인</button>
	                    			<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="resetInput()">취소</button>
	                    		</div>
	                    	</div>
                           
                        </div>
                    </div>

                    
                	</div>
                </div>
            </div>
          </div>
        <!--아이디찾기 모달 끝-->
            <br><br>
            
        <!--비밀번호찾기 모달-->
        <div class="findInfo">
            
                <!-- Button to Open the Modal -->
                <button type="button" class="btn btn-lg btn-outline-info" data-toggle="modal" data-target="#findUserPwdModal">
                	비밀번호 찾기
                </button>
      
                <!-- The Modal -->
                <div class="modal" id="findUserPwdModal">
                    <div class="modal-dialog">
                    	<div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">비밀번호 찾기</h4>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="find-userPwd">
                                <table>
                        		<tr>
                        			<td><b>아이디</b></td>
                        			<td colspan="2"><input type="text" class="form-control" id="findPwd-userId" name="findPwd-userId" required></td>
                        		</tr>
                        		<tr>
                        			<td><b>이메일</b></td>
                        			<td><input type="email" class="form-control" id="findPwd-userEmail" name="findPwd-userEmail" placeholder="이메일 주소를 입력해주세요." required></td>
                                	<td><input type="button" class="btn btn-secondary btn-sm" id="findPwd-emailChk" onclick="findUserPwd()" value="비밀번호 전송"><br></td>
                        		</table>
                        		
                        		<div class="text-center">
		                    		<div class="btn-gruop">
		                    			<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="findCompleted()">확인</button>
		                    			<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="resetInput()">취소</button>
		                    		</div>
	                    		</div>
                            </div>
                          </div>
                            
                        
                    	</div>
                    </div>
                </div>
        	</div>
        <!--비밀번호찾기 모달 끝-->

  </div>
    
    <script>
    
    // 아이디/비번 찾기 끝남 버튼 누르면 로그인 창 나타나게
     function findCompleted() {
    	  var modal = document.getElementById("login-modal");
    	  modal.style.display = "block";
    	};
    
    // 취소버튼 누르면 input창 초기화
    function resetInput(){
    	$(".findInfo input[type=text]").val("");
    	$(".findInfo input[type=email]").val("");
    };
    
    // 아이디찾기
    function findUserId(){ // 회원이 입력한 이메일, 이름 정보로 조회 -> 이메일로 아이디 발송
    	
    	var userName = $("#findId-userName").val();
    	var userEmail = $("#findId-userEmail").val();
    	
    	$.ajax({
    		type : "GET",
    		url : "findUserId.me",
    		data : { 
    			userName : userName, // 서블릿에 이름과 이메일 보내기
    			userEmail : userEmail
    			},
    		success : function(result){
    			if(result == "N"){ // 아이디와 이름이 일치하지 않으면
    				alert("입력하신 정보는 일치하는 회원이 없습니다. 다시 확인해주세요.");
    				$("#findId-userName").focus();
    				$("#findId-successEmailChk").text("유효한 이메일 주소를 입력하세요.");
    				$("#findId-successEmailChk").css("color","red");
    			} else{
    				alert("이메일 발송이 완료되었습니다.");
    				$("#findId-emailVerifyNo").attr("disabled", false);
    				$("#findId-successEmailChk").text("입력한 이메일에서 아이디를 확인하세요.");
    				$("#findId-successEmailChk").css("color","green");
    				}
    			},
    		
    		error: function(){
    			console.log("통신실패");
    		}    		
    	});
    	
    };
    
    function findCompleted() {
    	  var modal = document.getElementById("login-modal");
    	  modal.style.display = "block";
    	};
    
    // 비밀번호 찾기
    var code=""; // 전역변수 선언
    // 인증번호 메일 보내기
    function findUserPwd(){
    	
    	var userId = $("#findPwd-userId").val();
    	var userEmail = $("#findPwd-userEmail").val();
    	
    	$.ajax({
    		type : "GET",
    		url : "findUserPwd.me",
    		data : {
    			userId : userId,
    			userEmail : userEmail
    		},
    		success : function(result){
    			if(result == "error"){ // 이메일 전송이 되지 않았다면
    				alert("정보가 일치하는 회원이 없습니다.");
    				$("#findPwd-userName").focus();
    				$("#findPwd-successEmailChk").text("유효한 이메일 주소를 입력하세요.");
    				$("#findPwd-successEmailChk").css("color","red");
    	
    			}else{ // 이메일 전송이 되었다면
    				alert("인증번호 발송이 완료되었습니다. 입력한 이메일에서 변경된 비밀번호를 확인하세요.");
    				$("#findPwd-emailVerifyNo").attr("disabled", false);
    				$("#findPwd-successEmailChk").text("입력한 이메일에서 변경된 비밀번호를 확인하세요.");
    				$("#findPwd-successEmailChk").css("color","green");
    				code = result; // 매개변수로 받은 인증번호
    			}
    		},
    		error : function(){
    			console.log("통신실패");
    		}
    	});
    };
   
    </script>
	<br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>