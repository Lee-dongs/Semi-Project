<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
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
        .enrollWrap input:not(input[type=radio]), .enrollWrap select{
            border: 1px solid #c5c6bed0;
            padding: 15px;
            width: 100%;
            margin-bottom: 5px;
        }
        .enrollWrap input[type="button"], .enrollWrap input[type="submit"]{
            background-color: #eab935e6;
            color: #fff;
        }
        .enrollWrap input:focus, .enrollWrap select:focus{
            border: 1px solid #eab935e6;
        }
       
       .birth div{
        display: flex; /*옆으로 정렬*/
        gap: 10px;
       }
       .gender div{
        border: 1px solid #dadada;
        padding: 15px 5px;
        background-color: #fff;
       }
       .gender input{
        margin: 10px;
       }
       #userPwd, #userPwdCheck{
        background-color: #fff;
       }

       /*유효성 검사 글씨 스타일*/
       .check-info{
        font-size: 12px;
        font-weight: 400;
       }
    </style>
        
    <title>회원가입</title>
</head>
<body>
	<!-- 메뉴바 include : 깔끔해보이지 않으면 빼고, 로고 클릭 시 메인페이지 넘어가도록 하겠습니다.-->
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="enrollWrap"> 
    <form action="<%=contextPath %>/enrollForm.me" id="enroll-form" method="post"> <!-- MemberEnrollController이동 -->
        <!--로고 이미지 넣을 곳-->
        <img class="logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToPSdcD8kql44nbuJGZ5mvMyLuJZZFUOQhXA&usqp=CAU">

        <!--회원가입-->
        <!-- 아이디  -->
        <div class="enroll">
            <b>아이디</b>
            <span><input type="text" id=userId name="userId" required placeholder="첫 글자는 영문자로 그리고 영문자, 숫자를 포함하여 총 4~12자로 입력하세요"></span>
            <button class="btn btn-primary" onclick="idCheck();" type="button">아이디 중복체크</button>
            <!--아이디 유효성 검사 결과 프린트구역-->
            <div class="check-info" id="checkId"></div>
        </div>
        <div class="enroll">
            <b>비밀번호</b>
            <input type="password" id="userPwd" name="userPwd" required 
            	placeholder="영문자, 숫자, 특수문자(!,@,#,$,%,^,&,*)로 총 8~15자로 입력하세요">
            <!--비밀번호 유효성 검사 결과 프린트구역-->
            <div class="check-info" id="checkPwd"></div>
        </div> 
        <div class="enroll">
            <b>비밀번호 재확인</b>
            <input type="password" id="userPwdCheck" name="userPwdCheck" required 
            	placeholder="위의 비밀번호와 일치하는지 확인해주세요">
            <!--비밀번호 재확인 결과 프린트구역-->
            <div class="check-info" id="checkPwd2"></div>
        </div>
        <div class="enroll">
            <b>이름</b>
            <input type="text" name="userName" required>
        </div>

        <!--생년월일-->
        <div class="birth">
            <b>생년월일</b>
            <div>
                <input type="date"  name="birth">
            </div>
        </div>

        <!--이메일 및 전화번호-->
        <div class="enroll">
            <b>이메일<small>(필수)</small></b>
            <input type="email" name="email" placeholder="필수사항입니다." required>
        </div>

        <div class="phone">
            <b>연락처<small>(필수)</small></b>
            <div>
                <input type="tel" name="phone" placeholder="전화번호는 -포함하여 입력" required>
            </div>
        </div><br>
        <div class="address">
        	<b>주소<small>(선택)</small></b>
        	<div>
        		<input type="text" name="address" placeholder="select박스 만들게요">
        	</div>
        </div>
        <br><br>

        <input class="btn" type="submit" value="가입하기" disabled>
        <!-- 아이디 중복검사를 해야 버튼 눌림 -->
        
    </form>

	</div>
    <script>
    
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
    					$("#enroll-form input[type=submit]").removeAttr("disabled");
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
		
		var regExp = /^[a-zA-Z][a-zA-Z0-9]{8,15}$/;
		var userPwd = $(this).val();
		
		if(!regExp.test(userPwd)){ // 아이디가 정규식을 만족하지 못하면
			$('#checkPwd').html("비밀번호 형식을 확인해주세요");
			$("#checkPwd").css("color", "red");
		} else{
			$('#checkPwd').html("사용할 수 있는 비밀번호 형식입니다.");
			$("#checkPwd").css("color", "green");
		}
	});
    
    </script>
    
    
</body>
</html>
