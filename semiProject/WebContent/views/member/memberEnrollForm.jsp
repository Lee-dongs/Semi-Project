<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<head>
    <meta charset="UTF-8">
    <style>
        *{
            box-sizing: border-box;
            outline: none;
        }
        body{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 14px;
            background-color: #fffcf6;
            line-height: 2;
            margin: 0;
        }
        a{
            text-decoration: none; /*a태그로 이용약관 넣을지...*/
        }
        /*회원가입 구역*/
        .enrollWrap{
            width: 600px;
            /* border: 1px solid black; */
            margin: auto;
            padding: 0px 20px;
            margin-bottom: 40px;
            min-height:100%;
        	position :relative;
        }
        .logo{
            display: block;
            margin: 50px auto;
        }
       .enroll{
            margin: 20px 0;
        }
        .enrollWrap b{
            /* border: 1px solid black; */
            display: block; /*위아래로 정렬*/
            margin-bottom: 5px;
        }
        
       /*유효성 검사 글씨 스타일*/
       .check-info{
        font-size: 12px;
        font-weight: 400;
       }
       
       /*가입하기 버튼 스타일*/
       #enroll-form #submit-btn{
        background-color: #6DA292;
        color: white;
       }
       #enroll-form #submit-btn:hover{
        background-color: #537369;
       }
       
    </style>
        
    <title>회원가입</title>
</head>
<body>
	<!-- 메뉴바 include : 깔끔해보이지 않으면 빼고, 로고 클릭 시 메인페이지 넘어가도록 하겠습니다.-->
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="enrollWrap"> 
    <form action="<%=contextPath %>/enrollForm.me" id="enroll-form" method="post" onsubmit="return checkAll()"> <!-- MemberEnrollController이동 -->
        <!--로고 이미지 넣을 곳-->
        <img class="logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToPSdcD8kql44nbuJGZ5mvMyLuJZZFUOQhXA&usqp=CAU">

        <!--회원가입-->
        <!-- 아이디  -->
        <div class="enroll">
            <b>*아이디</b>
            <span><input type="text" class="form-control" id=userId name="userId" required placeholder="첫 글자는 영문자로 그리고 영문자, 숫자를 포함하여 총 4~12자로 입력하세요"></span>
            <button class="btn btn-sm btn-outline-warning" onclick="idCheck();" type="button">아이디 중복체크</button>
            <!--아이디 유효성 검사 결과 프린트구역-->
            <div class="check-info" id="checkId"></div>
        </div>
        <div class="enroll">
            <b>*비밀번호</b>
            <input type="password" class="form-control" id="userPwd" name="userPwd" required 
            	placeholder="영문자, 숫자, 특수문자(!,@,#,$,%,^,&,*)로 총 8~15자로 입력하세요">
            <!--비밀번호 유효성 검사 결과 프린트구역-->
            <div class="check-info" id="checkPwd"></div>
        </div> 
        <div class="enroll">
            <b>*비밀번호 재확인</b>
            <input type="password" class="form-control" id="userPwdCheck" name="userPwdCheck" required 
            	placeholder="위의 비밀번호와 일치하는지 확인해주세요">
            <!--비밀번호 재확인 결과 프린트구역-->
            <div class="check-info" id="checkPwd2"></div>
        </div>
        <div class="enroll">
            <b>*이름</b>
            <input type="text" class="form-control" name="userName" required>
        </div>

        <!--생년월일-->
        <div class="birth">
            <b>생년월일</b>
            <div>
                <input type="date" class="form-control" name="birth">
            </div>
        </div>

        <!--이메일 및 전화번호-->
        <div class="enroll">
            <b>*이메일</b>
            <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소를 입력해주세요." required>
            	<button type="button" class="btn btn-sm btn-outline-warning" id="emailChk">인증번호 보내기</button> <br><br>
            <input type="text" class="form-control" id="emailVerifyNo" name="emailVerifyNo" placeholder="인증번호" disabled required>
            	<button type="button" class="btn btn-sm btn-outline-warning" id="emailChk2">인증번호 입력하기</button>
            <div id="successEmailChk">이메일 입력 후 인증번호 보내기를 해주세요.</div>
            <input type="hidden" id="emailDoubleChk">
            
        </div>
        

        <div class="phone">
            <b>연락처</b>
            <div>
                <input type="tel" class="form-control" name="phone" placeholder="전화번호는 -포함하여 입력">
            </div>
        </div><br>
        <div class="address">
        <table>
        	<thead>
                <tr>
                    <td><input type="text" name="postCode" id="sample6_postcode" placeholder="우편번호" id="post_no"></td>
                    <td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
                </tr>
            </thead>
            </table>
            <input type="text" name="address" id="sample6_address" placeholder="주소"><br>
            <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소">
            <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목">

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("sample6_extraAddress").value = extraAddr;
                            
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
            </script>	
        </div>
        <br><br>
        <!-- 필수입력사항 프린트구역 -->
		<div class="check-info" id="checkAll"></div>
        <input class="form-control btn" id="submit-btn" type="submit" value="가입하기"><br><br><br>
        <!-- 아이디 중복검사를 해야 버튼 눌림 -->
        
    </form>

	</div>
    <script>
    // 모든 필수입력사항 입력하면 submit가능
    function checkAll(){
    	if($("#userName") == "" && $("#userEmail").attr("readonly",false)
    		&& $('#enroll-form input[name=userPwd]').attr("readonly",false)){
	    		alert("필수입력사항을 모두 입력해주세요");
	    		$("#checkAll").text("*표시는 필수입력사항입니다.");
	    		$("#checkAll").css("color","red");
	    		return false;
    	}
	     };
    
    $("#enroll-form input[type=submit]").removeAttr("disabled");
    
    // 아이디 중복검사 없이 비밀번호를 입력하려고 하면 alert
	 $(".enroll>#userPwd").click(function(){
		if (!$("#enroll-form input[name=userId]").prop("readonly")) {
		 	window.alert("아이디 중복확인을 먼저 진행해주세요.");
		}
	  });
    
    // 아이디 중복검사
    function idCheck(){
    	
    	var $checkId = $("#enroll-form input[name=userId]");
    	
    	$.ajax({
    		
    		url : "idCheck.me",
    		data : { checkId : $checkId.val() },
    		success : function(result){
    			if(result == "N"){ // 중복되는 아이디가 있다면
    				alert("이미 존재하거나 탈퇴한 유저의 아이디입니다.");
    				$checkId.focus();
    			} else{
    				if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
    					$checkId.attr("readonly", true); // 아이디값 변경 불가
    				}else{
    					$checkId.focus();
    					}
    				}
    			},
    		
    		error: function(){
    			console.log("통신실패");
    		}    		
    	});
    	
    };
   
    // 비밀번호 일치 검사
    $("#enroll-form input[name=userPwdCheck]").keyup(function(){
    	var pwd1 = $('#enroll-form input[name=userPwd]').val();
    	var pwd2 = $(this).val();
    	
    	if(pwd1 !="" && pwd2 !=""){ // 비밀번호 입력 둘 다 공백이 아닐 때
    		if(pwd1 == pwd2){ // 비밀번호 일치하면
    			$('#checkPwd2').html("비밀번호가 일치합니다.");
    			$('#checkPwd2').css("color","green");
    			$('#enroll-form input[name=userPwd]').attr("readonly",true);//비밀번호값 변경 불가
    		}else{
    			$('#checkPwd2').html("비밀번호가 일치하지 않습니다.");
    			$('#checkPwd2').css("color","red");
    		}
    	}
    	
    });
    
    // 아이디 유효성검사
	$('#enroll-form input[name=userId]').keyup(function(){
		
		var regExp = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/;
		var userId = $(this).val();
		
		if(!regExp.test(userId)){ // 아이디가 정규식을 만족하지 못하면
			$('#checkId').html("아이디 형식을 확인해주세요");
			$("#checkId").css("color", "red");
		} else{
			$('#checkId').html("사용할 수 있는 아이디 형식입니다. 중복검사를 해주세요");
			$("#checkId").css("color", "green");
		}
	});
    // 비밀번호 유효성검사
	$('#enroll-form input[name=userPwd]').keyup(function(){
		
		var regExp = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/;
		var userPwd = $(this).val();
		
		if(!regExp.test(userPwd)){ // 아이디가 정규식을 만족하지 못하면
			$('#checkPwd').html("비밀번호 형식을 확인해주세요");
			$("#checkPwd").css("color", "red");
		} else{
			$('#checkPwd').html("사용할 수 있는 비밀번호 형식입니다.");
			$("#checkPwd").css("color", "green");
		}
	});
    
    // 이메일 인증 : 인증번호 입력하기
    var code=""; // 전역변수로 선언
    $("#emailChk").click(function(){ // 인증번호 보내기를 입력하면
    	
    	var userEmail = $("#userEmail").val();
    	//console.log(userEmail);
    	
    	$.ajax({
    		type : "GET",
    		url : "emailCheck",    		
    	    data: {
    	        userEmail: userEmail // 전송할 데이터 (사용자 이메일)
    	    },
    		success : function(result){
    			if(result == "error"){ // 이메일 전송이 되지 않았다면
    				alert("이미 사용중인 이메일입니다. 다른 이메일 주소를 입력해주세요.");
    				$("#userEmail").attr("autofucus", true);
    				$("#successEmailChk").text("이미 사용중인 이메일입니다. 다른 이메일 주소를 입력해주세요.");
    				$("#successEmailChk").css("color","red");
    			}else{ // 이메일 전송이 되었다면
    				alert("인증번호 발송이 완료되었습니다. 입력한 이메일에서 인증번호를 확인하세요.");
    				$("#emailVerifyNo").attr("disabled", false);
    				$("#successEmailChk").text("인증번호를 입력하고 이메일 인증을 눌러주세요.");
    				$("#successEamilChk").css("color","green");
    				$("#userEmail").attr("readonly",true); // 이메일 변경불가
    				
    				code = result; // 매개변수로 받은 인증번호
    			}
    		},
    	    error : function(){
    	    	console.log("통신실패");
    	    }
    		
    	});
    });
    
    // 이메일 인증 : 인증번호 일치 확인하기
    $("#emailChk2").click(function(){ // 인증번호 입력하기 버튼을 누르면
    	
    	if($("#emailVerifyNo").val() == code){ // 인증번호가 일치하면
    		$("#successEmailChk").text("인증번호가 일치합니다.");
    		$("#successEmailChk").css("color", "green");
    		$("#emailDoubleChk").val("true");
    		$("#emailVerifyNo").attr("disabled",true);
    	}else{
    		$("#successEmailChk").text("인증번호가 일치하지 않습니다. 다시입력하세요.");
    		$("#successEmailChk").css("color", "red");    
    		$("#emailDoubleChk").val("false");
    		$("#emailVerifyNo").attr("autofocus",true);
    		
    	}
    });
    </script>
    <br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>
