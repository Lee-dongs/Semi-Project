<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기</title>

<style>
        .find-wrap{
            width: 1000px;
            height: 600px;
            margin: auto;
            border: 1px solid black;
            min-height:100%;
        	position :relative;
        }
        .find{
            border: 1px solid red;
            margin: auto;
            text-align: center;
        }
        #find-title{
            font-size: 20px;
            font-weight: 900;
            color : dodgerblue;
            line-height: 5;
        }
        
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div class="find-wrap">
    
        <div class="find" id="find-title">
            찾으시려는 정보를 선택해주세요.
        </div>
        <br><br><br>
        <!--아이디찾기 모달-->
        <div class="find">
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#findUserIdModal">
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
                            <b>이름</b>
                            <input type="text" id="findId-userName" name="findId-userName" required>
                        </div>
                        <div class="find-userId">
                            <b>이메일</b>
                            <input type="email" id="findId-userEmail" name="findId-userEmail" placeholder="이메일 주소를 입력해주세요." required>
                                <button type="button" class="btn btn-secondary btn-sm" id="findId-emailChk" onclick="findUserId()">이메일로 아이디 보내기</button> <br>
                            
                            <div id="findId-successEmailChk">이메일 입력 후 이메일로 아이디 보내기 버튼을 눌러주세요.</div>
                           
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="findCompleted()">확인</button>
                    </div>
            
                </div>
                </div>
            </div>
            </div>
        <!--아이디찾기 모달 끝-->
            <br><br>
            
        <!--비밀번호찾기 모달-->
        <div class="find">
            
                <!-- Button to Open the Modal -->
                <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#findUserPwdModal">
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
                                <b>아이디</b>
                                <input type="text" id="findPwd-userId" name="findPwd-userId" required>
                            </div>
                            <div class="find-userPwd">
                                <b>이메일</b>
                                <input type="email" id="findPwd-userEmail" name="findPwd-userEmail" placeholder="이메일 주소를 입력해주세요." required>
                                    <button type="button" class="btn btn-secondary btn-sm" id="findPwd-emailChk" onclick="findUserPwd()">새로운 비밀번호 보내기</button> <br>
                               
                                <div id="findPwd-successEmailChk">이메일 입력 후 새로운 비밀번호 보내기를 해주세요.</div>
                           </div>
                        </div>
                
                        <!-- Modal footer -->
                        <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="findCompleted()">확인</button>
                        </div>
                
                    </div>
                    </div>
                </div>
        </div>
        <!--비밀번호찾기 모달 끝-->

    </div>
    
    <script>
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
    	  var modal = document.getElementById("myModal");
    	  modal.style.display = "block";
    	}
    
    // 비밀번호 찾기
    var code=""; // 전역변수 선언
    // 인증번호 메일 보내기
    function findUserPwd(){
    	
    	var userId = $("#findPwd-userId").val();
    	var email = $("#findPwd-userEmail").val();
    	
    	$.ajax({
    		type : "GET",
    		url : "findUserPwd.me",
    		data : {
    			userId : userId,
    			email : email
    		},
    		success : function(result){
    			if(result == "error"){ // 이메일 전송이 되지 않았다면
    				alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
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