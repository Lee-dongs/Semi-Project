<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import= "com.kh.member.model.vo.CafeRequest"
	import= "com.kh.member.model.vo.Question"
	import= "com.kh.member.model.vo.Board"
	import= "com.kh.member.model.vo.CafeRequestReply"
	import= "com.kh.member.model.vo.QuestionReply"
	import= "com.kh.member.model.vo.BoardReply"
	import= "java.util.ArrayList"
 %>
<%
	ArrayList<CafeRequest> cList= (ArrayList)request.getAttribute("cList");
	ArrayList<Question> qList = (ArrayList)request.getAttribute("qList");
	ArrayList<Board> bList = (ArrayList)request.getAttribute("bList");
	
	ArrayList<CafeRequestReply> crList = (ArrayList)request.getAttribute("crList");
	ArrayList<BoardReply> brList = (ArrayList)request.getAttribute("brList");
	ArrayList<QuestionReply> qrList = (ArrayList)request.getAttribute("qrList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		margin-top: 150px;
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
	
	svg{
            height: 25px;
            width: 25px;
        }
        .myBoard{
            margin-top: 0px;
        }
        .myRequest,.myQuestion{
            margin-top: 10px;
        }
        
        .myBoard,.myRequest,.myQuestion{
            padding-top: 20px;
        }
        .myBoard>label,.myRequest>label,.myQuestion>label{
            text-decoration: none;
            color: black;
            vertical-align: top;
            font-size: 10px;
        }
        .myBoard>label>p,.myRequest>label>p,.myQuestion>label>p{
            margin:5px;
        }
        .myBoardNotice,.myRequestNotice,.myQuestionNotice {
            position: relative;
        }
        .boardIcon,.requestIcon,.questionIcon {
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
            left:30px;
            bottom: 40px;
        }
        #fix{
            padding-top: 110px;
            font-size: 11px;
        }
        #fix>a{
            text-decoration: none;
            color: black;
        }
	/*        팝업         */
     
    .modal1,.modal2,.modal3{
         position: fixed;
         left: 0;
         top: 0;
         width: 100%;
         height: 100%;
         background-color: rgba(0, 0, 0, 0.5);
         opacity: 0;
         visibility: hidden;
         transform: scale(1.1);
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
     }
     .modal-content1,.modal-content2,.modal-content3{
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
         background-color: white;
         padding: 1rem 1.5rem;
         width: 800px;
         height: 500px;
         border-radius: 0.5rem;
     }
     .close-button1,.close-button2,.close-button3 {
         float: right;
         width: 1.5rem;
         line-height: 1.5rem;
         text-align: center;
         cursor: pointer;
         border-radius: 0.25rem;
         background-color: lightgray;
     }
     .close-button1:hover {
         background-color: darkgray;
     }
     .close-button2:hover {
         background-color: darkgray;
     }
     .close-button3:hover {
         background-color: darkgray;
     }
     .show-modal {
         opacity: 1;
         visibility: visible;
         transform: scale(1.0);
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
     }
     /*           */
    
     .modal-content1>div{
        border: 1px solid black;
        position: absolute;
        top: 20%;
        left:5%;
        width: 720px;
        height: 300px;
        overflow: auto;
     }
     .modal-content2>div{
        border: 1px solid black;
        position: absolute;
        top: 20%;
        left:5%;
        width: 720px;
        height: 300px;
        overflow: auto;
     }
     .modal-content3>div{
        border: 1px solid black;
        position: absolute;
        top: 20%;
        left:5%;
        width: 720px;
        height: 300px;
        overflow: auto;
     }
     /*  scroll   */
     .a{
            width: 720px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            border: 1px solid black;
            cursor: pointer;
        }

        .b{
            border: 1px solid black;
            text-align: center;
            width: 720px;
            height: 30px;
            display: none; 
        }
        .b tr:nth-child(odd) td{
           background:lemonchiffon;
		}
		.b tr:nth-child(even) td{
            background:whitesmoke;
		}
        #message{
        	margin-top: 135px;
        	font-size: 20px;
        	color:grey;
        	opacity:50%;
        }
        #updateme,.myBoardNotice,.myRequestNotice,.myQuestionNotice{
        	cursor : pointer;
        }
        
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c420b0d0354a87e72cc4af213423763f&libraries=services"></script>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	 <div id="outer2">
            <%if(loginUser!=null){ %>
            <div id="myPage">
                <div id="myTitle" align="center"><h1>마이페이지</h1></div>
                <div id="information" align="center" style="margin-top:50px">
                <form method="post" action="<%=contextPath %>/update.me">
                    <input name="userNo" type="hidden" value="<%=loginUser.getUserNo()%>">
                    <table style="width: 400px; height: 200px;" >
                        <tr>
                            <th>이름:</th>
                            <td class="info"><span ><%=loginUser.getUserName() %></span></td>
                            <td class="update" style="display:none"><input name="name" type="text" value=<%=loginUser.getUserName() %>></td>
                        </tr>
                        <tr class="info">
                            <th>아이디:</th>
                            <td><span><%=loginUser.getUserId() %></span></td>
                        </tr>
                        <tr class="update" style="display:none">
                        	<th>비밀번호:</th>
                        	<td><input id="pwd" name="password" type="password" placeholder="영문자, 숫자, 특수문자(!,@,#,$,%,^,&,*)로 총 8~15자로 입력하세요"></td>
                        	<input type="hidden" name="originpassword" value="<%=loginUser.getUserPwd()%>">
                        </tr>
                        <tr id="update1" style="display:none" >
                        	<td colspan="2"><p id="chk1"></p></td>
                        </tr>
                        <tr class="update" style="display:none">
                        	<th>비밀번호 확인:</th>
                        	<td><input id="pwdchk" name="passwordChk" type="password" onchange="isSame()" disabled></td>
                        </tr>
                        <tr id="update2" style="display:none" >
                        	<td colspan="2"><p id="chk2"></p></td>
                        </tr>
                        <tr class="info">
                            <th>생일:</th>
                            <td><span><%=loginUser.getBirth() %></span></td>
                        </tr>
                        <tr>
                            <th>이메일:</th>
                            <td class="info"><span><%=loginUser.getEmail() %></span></td>
                            <td class="update" style="display:none"><input name="email" type="text" value=<%=loginUser.getEmail() %>></td>
                        </tr>
                        <tr>
                            <th>번호:</th>
                            <td class="info"><span><%=loginUser.getPhone() %></span></td>
                            <td class="update" style="display:none"><input name="phone" type="text" value=<%=loginUser.getPhone() %>></td>
                        </tr>
                        <tr>
                            <th>주소:</th>
                            <td class="info"><span><%=loginUser.getAddress() %></span></td>
                            <td class="update" style="display:none">
                            <input type="text" id="sample5_address" name="address" value="<%=loginUser.getAddress() %>">
							<input type="button"  onclick="sample5_execDaumPostcode()" value="검색하기"><br>
                            </td>
                        </tr>
                    </table>
                    <div class="update" style="display:none; margin-top:30px;">
                    <button id="submit" type="submit">수정</button>
                    <button type="button" id="cancelupdate">취소</button>
                    </div>
                 </form>
                </div>
                
                <div id="line"></div>
                <div id="modify">
                    <div class="myBoard" align="center">
                        <label class="myBoardNotice" href="">
                        <%if(bList.size()!=0){ %>
                        <span class="boardIcon"><%=bList.size() %></span>
                        <%} %>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 23"><path d="M21.04 12.13C21.18 12.13 21.31 12.19 21.42 12.3L22.7 13.58C22.92 13.79 22.92 14.14 22.7 14.35L21.7 15.35L19.65 13.3L20.65 12.3C20.76 12.19 20.9 12.13 21.04 12.13M19.07 13.88L21.12 15.93L15.06 22H13V19.94L19.07 13.88M11 19L9 21H5C3.9 21 3 20.1 3 19V5C3 3.9 3.9 3 5 3H9.18C9.6 1.84 10.7 1 12 1C13.3 1 14.4 1.84 14.82 3H19C20.1 3 21 3.9 21 5V9L19 11V5H17V7H7V5H5V19H11M12 3C11.45 3 11 3.45 11 4C11 4.55 11.45 5 12 5C12.55 5 13 4.55 13 4C13 3.45 12.55 3 12 3Z" /></svg>
                        <p>내 게시글</p>
                        </label>
                    </div>
                    <div class="myRequest" align="center">
                        <label class="myRequestNotice" href="">
                        <%if(cList.size()!=0){ %>
                        <span class="requestIcon"><%=cList.size() %> </span>
                        <%} %>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 23"><path d="M5,3C3.89,3 3,3.89 3,5V19C3,20.11 3.89,21 5,21H19C20.11,21 21,20.11 21,19V5C21,3.89 20.11,3 19,3H5M5,5H19V19H5V5M7,7V9H17V7H7M7,11V13H17V11H7M7,15V17H14V15H7Z" /></svg>
                        <p>내 요청글</p>
                        </label>
                    </div>
                    <div class="myQuestion" align="center">
                        <label class="myQuestionNotice" href="">
                        <%if(qList.size()!=0){ %>
                        <span class="questionIcon"><%=qList.size() %> </span>
                        <%} %>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>chat-question-outline</title><path d="M12 3C6.5 3 2 6.6 2 11C2 13.2 3.1 15.2 4.8 16.5C4.8 17.1 4.4 18.7 2 21C4.4 20.9 6.6 20 8.5 18.5C9.6 18.8 10.8 19 12 19C17.5 19 22 15.4 22 11S17.5 3 12 3M12 17C7.6 17 4 14.3 4 11S7.6 5 12 5 20 7.7 20 11 16.4 17 12 17M12.2 6.5C11.3 6.5 10.6 6.7 10.1 7C9.5 7.4 9.2 8 9.3 8.7H11.3C11.3 8.4 11.4 8.2 11.6 8.1C11.8 8 12 7.9 12.3 7.9C12.6 7.9 12.9 8 13.1 8.2C13.3 8.4 13.4 8.6 13.4 8.9C13.4 9.2 13.3 9.4 13.2 9.6C13 9.8 12.8 10 12.6 10.1C12.1 10.4 11.7 10.7 11.5 10.9C11.1 11.2 11 11.5 11 12H13C13 11.7 13.1 11.5 13.1 11.3C13.2 11.1 13.4 11 13.6 10.8C14.1 10.6 14.4 10.3 14.7 9.9C15 9.5 15.1 9.1 15.1 8.7C15.1 8 14.8 7.4 14.3 7C13.9 6.7 13.1 6.5 12.2 6.5M11 13V15H13V13H11Z" /></svg>
                        <p>내 질문</p>
                        </label>
                    </div>
                    <div id="fix" align="center">
                        <a href="<%=contextPath %>/delete.me?mno=<%=loginUser.getUserId()%>" onclick="return check()">회원 탈퇴</a> |
                        <label id="updateme">정보 수정</label>
                    </div>
                </div>
                <%} %>    
            </div>
        </div>
        
    	
        <!-- 팝업 될 레이어 -->
        <div class="modal1">
            <div class="modal-content1">
                <span class="close-button1">&times;</span>
                <div>
                	<%if(bList.isEmpty()){ %>
                    	<p id="message" align="center">비어있음</p>
                    <%}else{ %>
	                	<%for(Board b : bList){ %>
	                	<p style="display:none">false</p>
	                    <input type="hidden" name="boardNo" value="<%=b.getBoardNo() %>">
	                    <table class="a">
	                        <tr>
	                            <td width="100px">제목: <%=b.getBoardTitle() %></td>
	                            <td width="50px"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,4C21.11,4 22,4.89 22,6V18C22,19.11 21.11,20 20,20H4C2.89,20 2,19.11 2,18V6C2,4.89 2.89,4 4,4H20M8.5,15V9H7.25V12.5L4.75,9H3.5V15H4.75V11.5L7.3,15H8.5M13.5,10.26V9H9.5V15H13.5V13.75H11V12.64H13.5V11.38H11V10.26H13.5M20.5,14V9H19.25V13.5H18.13V10H16.88V13.5H15.75V9H14.5V14A1,1 0 0,0 15.5,15H19.5A1,1 0 0,0 20.5,14Z" /></svg></td>
	                            <td width="420px">
	                            <%if(b.getBoardContent().length()>30){ %>
	                            <%String content = b.getBoardContent().substring(0,30).concat("..."); %>
	                            내용: <%=content%>
	                            <%}else{ %>
	                            내용: <%=b.getBoardContent()%>
	                            <%} %>
	                            </td>
	                            <td width="150px">날짜: <%=b.getCreateDate() %></td>
	                        </tr>
	                    </table>
	                    <table  class="b">
	                    	<%for(BoardReply br : brList){ %>
		                        <%if(b.getBoardNo()==br.getBoardRefNo()){ %>
		                        <tr>
		                            <td width="150px">작성자: <%=br.getBoardReplyWriter() %></td>
		                            <td width="420px">답변: <%=br.getBoardReplyContent() %></td>
		                            <td width="150px">날짜: <%=br.getCreateDate() %></td>
		                        </tr>
		                        <%} %>
	                        <%} %>
	                    </table>
	                    <%} %>
					<%} %>
                    
                </div>
            </div>
        </div>
        <!-- 팝업 될 레이어 -->
        <div class="modal2">
            <div class="modal-content2">
                <span class="close-button2">&times;</span>
                <div>
                    <%if(cList.isEmpty()){ %>
                    	<p id="message" align="center">비어있음</p>
                    <%}else{ %>
                    	<%for(CafeRequest c : cList){ %>
                    	<p style="display:none">false</p>
	                    <input type="hidden" name="requestNo" value="<%=c.getRequestNo()%>">
	                    <table class="a">
	                        <tr>
	                            <td width="150px">요청번호: <%=c.getRequestNo() %></td>
	                            <td width="420px">
	                            <%if(c.getContent().length()>30){ %>
	                            <%String content = c.getContent().substring(0,30).concat("..."); %>
	                            내용: <%=content%>
	                            <%}else{ %>
	                            내용: <%=c.getContent()%>
	                            <%} %>
	                            </td>
	                            <td width="150px">날짜: <%=c.getCreateDate() %></td>
	                        </tr>
	                    </table>
	                    <table  class="b">
	                    	<%for(CafeRequestReply cr : crList){ %>
		                        <%if(c.getRequestNo()==cr.getRefBno()){ %>
		                        <tr>
		                            <td width="150px">작성자: <%=cr.getReplyWriter() %></td>
		                            <td width="420px">답변: <%=cr.getReplyContent() %></td>
		                            <td width="150px">날짜: <%=cr.getCreateDate() %></td>
		                        </tr>
		                        <%} %>
	                        <%} %>
	                    </table>
	                    <%} %>
                    <%} %>
                </div>
            </div>
        </div>
        <!-- 팝업 될 레이어 -->
        <div class="modal3">
            <div class="modal-content3">
                <span class="close-button3">&times;</span>
                <div>
                    <%if(qList.isEmpty()){ %>
                    	<p id="message" align="center">비어있음</p>
                    <%}else{ %>
                    	<%for(Question q : qList){ %>
                    	<p style="display:none">false</p>
	                    <input type="hidden" name="questionNo" value="<%=q.getQuestionNo()%>">
	                    <table class="a">
	                        <tr>
	                            <td width="150px">제목: <%=q.getQuestionTitle() %></td>
	                            <td width="420px">
	                            <%if(q.getContent().length()>30){ %>
	                            <%String content = q.getContent().substring(0,30).concat("..."); %>
	                            내용: <%=content%>
	                            <%}else{ %>
	                            내용: <%=q.getContent()%>
	                            <%} %>
	                            </td>
	                            <td width="150px">날짜: <%=q.getCreateDate() %></td>
	                        </tr>
	                    </table>
	                    <table  class="b">
	                    	<%for(QuestionReply qr : qrList){ %>
		                        <%if(q.getQuestionNo()==qr.getRefBno()){ %>
		                        <tr>
		                            <td width="150px">작성자: <%=qr.getReplyWriter() %></td>
		                            <td width="420px">답변: <%=qr.getReplyContent() %></td>
		                            <td width="150px">날짜: <%=qr.getCreateDate() %></td>
		                        </tr>
		                        <%} %>
	                        <%} %>
	                    </table>
	                    <%} %>
                    <%} %>
                </div>
            </div>
        </div>
      
         <script>
			 
		     function sample5_execDaumPostcode() {
		         new daum.Postcode({
		             oncomplete: function(data) {
		                 var addr = data.address;
		                 document.getElementById("sample5_address").value = addr;
			         }
			     }).open();
		    }
	         function check(){
		        	var chk = confirm("정말로 탈퇴하실껀가요?");
		        	return chk;
		     };
		     
		     function isSame(){
		     	var pwd1 = document.getElementById('pwd').value;
		     	var pwd2 = document.getElementById('pwdchk').value;
		     	var chk1 = document.getElementById("chk1").innerHTML;
		     	console.log(chk1);
		     	if(chk1!="비밀번호 형식을 확인해주세요"){
			     	if(pwd1 !="" && pwd2 !=""){
			     			document.getElementById("update2").style.display = "";
			     		if(pwd1 == pwd2){
			     			document.getElementById('chk2').innerHTML = '비밀번호가 일치합니다.';
			     			document.getElementById('chk2').style.color='blue';
			     			document.getElementById("submit").removeAttribute("disabled");
			     		}else{
			     			document.getElementById('chk2').innerHTML = '비밀번호가 일치하지 않습니다.';
			     			document.getElementById('chk2').style.color='red';
			     			
			     		}
			     		
			     	}
		     	}
	     };
	     
	     
         var modal1 = document.querySelector(".modal1");
         var trigger1 = document.querySelector(".myBoardNotice");

         var modal2 = document.querySelector(".modal2");
         var trigger2 = document.querySelector(".myRequestNotice");

         var modal3 = document.querySelector(".modal3");
         var trigger3 = document.querySelector(".myQuestionNotice");

         var closeButton1 = document.querySelector(".close-button1");
         var closeButton2 = document.querySelector(".close-button2");
         var closeButton3 = document.querySelector(".close-button3");

        

        // console.log(modal1);

        function toggleModal1() {
             modal1.classList.toggle("show-modal");
        }
        function toggleModal2() {
             modal2.classList.toggle("show-modal");
        }
        function toggleModal3() {
             modal3.classList.toggle("show-modal");
        }
         
 
        function windowOnClick(event) {
             if (event.target === modal1) {
                 toggleModal1();
             }
             if (event.target === modal2) {
                 toggleModal2();
             }
             if (event.target === modal3) {
                 toggleModal3();
             }
             
         }

        trigger1.addEventListener("click", toggleModal1);
        trigger2.addEventListener("click", toggleModal2);
        trigger3.addEventListener("click", toggleModal3);
        closeButton1.addEventListener("click", toggleModal1);
        closeButton2.addEventListener("click", toggleModal2);
        closeButton3.addEventListener("click", toggleModal3);
        window.addEventListener("click", windowOnClick);
        
        $(function(){
        	$('input[name=password]').keyup(function(){
        		
        		var regExp = /^[a-zA-z0-9*!@#$%^&]{8,15}$/;
        		var userPwd = $(this).val();
        		console.log(userPwd);
        		$("#update1").css({"display":""});
        		if(!regExp.test(userPwd)){ // 아이디가 정규식을 만족하지 못하면
        			$('#chk1').html("비밀번호 형식을 확인해주세요");
        			$("#chk1").css("color", "red");
        			$("#submit").attr("disabled","true");
        		} else{
        			$('#chk1').html("사용할 수 있는 비밀번호 형식입니다.");
        			$("#chk1").css("color", "green");
        			$("input[name=passwordChk]").removeAttr("disabled");
        		}
        	});
        	
        	$("#updateme").click(function(){
        		$(".info").css({"display":"none"});
        		$(".update").css({"display":""});
        	});
        	$("#cancelupdate").click(function(){
        		$(".info").css({"display":""});
        		$(".update").css({"display":"none"});
        	});
        	
        	$(".a").click(function(){
                /* console.log($(this).next()); */
                var $p = $(this).next(); 
                
                $(this).find("svg").css({"display":"none"});
                if($p.css("display")=="none"){ 
                    $(this).siblings(".b").slideUp(); 
                    $p.slideDown(100); 
                }else{
                    $p.slideUp(100); 
                }
                var no = $(this).prev().prev();
                var isRun = no.text();
                var binput = $(this).prev("input[name=boardNo]").val();
        		var rinput = $(this).prev("input[name=requestNo]").val();
        		var qinput = $(this).prev("input[name=questionNo]").val();
        		
                go();
                function go(){
                	if(isRun == "true") {
                        return;
                    };
                	
        		$.ajax({
                	url:"ReadDoc.me",
                	data:{
                		boardNo: binput,
                		requestNo: rinput,
                		questionNo: qinput
                	},
                	type: "get",
                	success: function(result){
                		console.log("통신 성공했습니다.");
                		
                		if(result[0]>0){
                			$(".boardIcon").html(result[0]);
                		}else if(result[0]==0){
                			$(".boardIcon").css({"display":"none"});
                		}
                		
                		if(result[1]>0){
                			$(".requestIcon").html(result[1]);
                		}else if(result[1]==0){
                			$(".requestIcon").css({"display":"none"});
                		}
                		
                		if(result[2]>0){
                			$(".questionIcon").html(result[2]);
                		}else if(result[2]==0){
                			$(".questionIcon").css({"display":"none"});
                		}
                	
                	},
                	error: function(){
                		console.log("통신 실패했습니다.");
                	}
            	
            	});
        		no.text("true");
                };
                
            });
        	
        	
        });
        </script> 
        <br><br><br> 
</body>
</html>