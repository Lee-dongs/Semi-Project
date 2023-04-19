<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#outer2 {
		width: 1200px;
		margin: auto;
	}
	
	#line {
		width: 0.1%;
		background-color: black;
		height: 390px;
	}
	
	#myPage {
		width: 50%;
		margin: auto;
		margin-top: 50px;
		box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
		border: 1px solid black;
		height: 500px;
	}
	
	#myTitle {
		width: 100%;
		height: 15%;
	}
	
	#myPage>div {
		float: left;
	}
	
	#modify {
		width: 29.5%;
		height: 85%;
	}
	
	#information {
		width: 70%;
		height: 85%;
		padding-top: auto;
	}
	
	#information>table {
		font-weight: bold;
		margin-top: 10%;
	}
	
	svg {
		height: 25px;
		width: 25px;
	}
	
	.myBoard {
		margin-top: 25px;
	}
	
	.myRequest, .myQuestion {
		margin-top: 10px;
	}
	
	.myBoard, .myRequest, .myQuestion {
		padding-top: 20px;
	}
	
	.myBoard>a, .myRequest>a, .myQuestion>a {
		text-decoration: none;
		color: black;
		vertical-align: top;
		font-size: 10px;
	}
	
	.myBoard>a>p, .myRequest>a>p, .myQuestion>a>p {
		margin: 0px;
	}
	
	.myBoardNotice, .myRequestNotice, .myQuestionNotice {
		position: relative;
	}
	
	.boardIcon, .requestIcon, .questionIcon {
		background-color: rgb(205, 42, 42);
		width: 20px;
		height: 20px;
		border-radius: 15px;
		display: flex;
		justify-content: center;
		align-items: center;
		color: white;
		font-weight: 600;
		position: absolute;
		left: 14px;
		bottom: 30px;
	}
	
	#fix {
		padding-top: 140px;
		font-size: 11px;
	}
	
	#fix>a {
		text-decoration: none;
		color: black;
	}
</style>
<body>
	<%@include file="../common/menubar.jsp" %>
	 <div id="outer2">
            <div id="myPage">
                <div id="myTitle" align="center"><h1>마이페이지</h1></div>
                <div id="information" align="center">
                    <table style="width: 230px; height: 200px;" >
                        <tr>
                            <th>이름:</th>
                            <td><span><%=loginUser.getUserName() %></span></td>
                        </tr>
                        <tr>
                            <th>아이디:</th>
                            <td><span><%=loginUser.getUserId() %></span></td>
                        </tr>
                        <tr>
                            <th>생일:</th>
                            <td><span><%=loginUser.getBirth() %></span></td>
                        </tr>
                        <tr>
                            <th>이메일:</th>
                            <td><span><%=loginUser.getEmail() %></span></td>
                        </tr>
                        <tr>
                            <th>번호:</th>
                            <td><span><%=loginUser.getPhone() %></span></td>
                        </tr>
                        <tr>
                            <th>주소:</th>
                            <td><span><%=loginUser.getAddress() %></span></td>
                        </tr>
                    </table>
                </div>
                
                <div id="line">
                
                </div>
                <div id="modify">
                    <div class="myBoard" align="center">
                        <a class="myBoardNotice" alt="내게시글" href="">
                        <span class="boardIcon">34 </span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 23"><path d="M21.04 12.13C21.18 12.13 21.31 12.19 21.42 12.3L22.7 13.58C22.92 13.79 22.92 14.14 22.7 14.35L21.7 15.35L19.65 13.3L20.65 12.3C20.76 12.19 20.9 12.13 21.04 12.13M19.07 13.88L21.12 15.93L15.06 22H13V19.94L19.07 13.88M11 19L9 21H5C3.9 21 3 20.1 3 19V5C3 3.9 3.9 3 5 3H9.18C9.6 1.84 10.7 1 12 1C13.3 1 14.4 1.84 14.82 3H19C20.1 3 21 3.9 21 5V9L19 11V5H17V7H7V5H5V19H11M12 3C11.45 3 11 3.45 11 4C11 4.55 11.45 5 12 5C12.55 5 13 4.55 13 4C13 3.45 12.55 3 12 3Z" /></svg>
                        <p>내 게시글</p>
                        </a>
                    </div>
                    <div class="myRequest" align="center">
                        <a class="myRequestNotice" href="">
                        <span class="requestIcon">1 </span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 23"><path d="M5,3C3.89,3 3,3.89 3,5V19C3,20.11 3.89,21 5,21H19C20.11,21 21,20.11 21,19V5C21,3.89 20.11,3 19,3H5M5,5H19V19H5V5M7,7V9H17V7H7M7,11V13H17V11H7M7,15V17H14V15H7Z" /></svg>
                        <p>내 요청글</p>
                        </a>
                    </div>
                    <div class="myQuestion" align="center">
                        <a class="myQuestionNotice" href="">
                        <span class="questionIcon">34 </span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>chat-question-outline</title><path d="M12 3C6.5 3 2 6.6 2 11C2 13.2 3.1 15.2 4.8 16.5C4.8 17.1 4.4 18.7 2 21C4.4 20.9 6.6 20 8.5 18.5C9.6 18.8 10.8 19 12 19C17.5 19 22 15.4 22 11S17.5 3 12 3M12 17C7.6 17 4 14.3 4 11S7.6 5 12 5 20 7.7 20 11 16.4 17 12 17M12.2 6.5C11.3 6.5 10.6 6.7 10.1 7C9.5 7.4 9.2 8 9.3 8.7H11.3C11.3 8.4 11.4 8.2 11.6 8.1C11.8 8 12 7.9 12.3 7.9C12.6 7.9 12.9 8 13.1 8.2C13.3 8.4 13.4 8.6 13.4 8.9C13.4 9.2 13.3 9.4 13.2 9.6C13 9.8 12.8 10 12.6 10.1C12.1 10.4 11.7 10.7 11.5 10.9C11.1 11.2 11 11.5 11 12H13C13 11.7 13.1 11.5 13.1 11.3C13.2 11.1 13.4 11 13.6 10.8C14.1 10.6 14.4 10.3 14.7 9.9C15 9.5 15.1 9.1 15.1 8.7C15.1 8 14.8 7.4 14.3 7C13.9 6.7 13.1 6.5 12.2 6.5M11 13V15H13V13H11Z" /></svg>
                        <p>내 질문</p>
                        </a>
                    </div>
                    <div id="fix" align="center">
                        <a href="<%=contextPath %>/delete.me?mno=<%=loginUser.getUserId()%>" onclick="return check()">회원 탈퇴</a> |
                        <a href="">정보 수정</a>
                    </div>
                </div>    
            </div>
        </div>    
        <script>
	        function check(){
	        	var chk = confirm("정말로 탈퇴하실껀가요?");
	        	return chk;
	        }
        </script>
        <br><br><br> 
</body>
</html>