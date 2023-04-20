<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Board b = (Board)request.getAttribute("b");
    
    	Attachment at = (Attachment)request.getAttribute("at");
    	
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .wrap{
        width: 800px;
        height: 800px;
        margin: auto;
    }
 
    hr{
        background-color: black;
        width: 100%;
        height: 2px;
    }
    .board-info{
        margin: 0;
        padding: 0;
    }
    .board-info>li{
        list-style-type: none;
        display: inline-block;
        width: 23%;
        text-align: left;
    }
    #con-area{
        width: 100%;
        height: 300px;
        box-sizing: border-box;
    }
    #like-area{
        height: 10%;
        text-align: center;
        
    }
    #like-area >button{
        height: 40px;
        width: 80px;
        margin-left: 10px;
    }
    
    #reply-area{
        width: 100%;
        height: 30%;
    	
    }
    #reply-input{
        margin-left: 100px;
        width: 70%;
        height: 20%;
    }
    #btn-reply{
        height: 20%;
        background-color: rgb(243, 197, 112);
        border: 0;
    }
    #byte{
        margin-left: 580px;
    }
    .reply{
        margin-left: 100px;
        width: 600px;
        border-bottom: 1px solid black;
        border-top: 1px solid black;
    }
    .reply button{
        text-decoration: none;
        margin-left: 8px;
        color: black;
        float: right;

    }
    #btn-area{
        height: 10%;
    }
    #btn-area > button{
        float: right;
        height: 40px;
        width: 80px;
        margin-left: 10px;
    }
    #btn-insert{
        background-color: rgb(243, 197, 112);
        border: 0;
    }
    #btn-area2{
        height: 10%;
        text-align: center;
    } 
    #btn-area2>button{
        margin-left: 10px;
        height: 40px;
        width: 80px;
    }
</style>

<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="wrap">
        <br>
        <h2 align="center">자유게시판</h3>
        <br>
        <h4><%=b.getTitle() %></h4>
            <ul class="board-info">
                <li>글번호 <%=b.getBoardNo() %></li>
                <li>작성자 <%=b.getBoardWriter() %></li>
                <li>등록일 <%=b.getCreateDate() %></li>
                <li>조회수 <%=b.getCount() %></li>
           </ul>
        <hr>
        <div id="con-area">
            <p>
                <%=b.getContent() %>
            </p>
        </div>
        <div id="like-area">
                <button type="button">싫어요</button>
                <button type="button">좋아요</button>
        </div>
        <hr>
        <div id="btn-area">
            <button type="button" id="btn-insert" onclick ="enrollform();">글쓰기</button>
            <button type="button" onclick ="listBoard();">목록</button>
        </div>
        <hr>
        <br>
        <%if(loginUser!=null && (loginUser.equals(b.getBoardWriter())||loginUser.getUserId().equals("admin"))){ %>
        <div id="btn-area2">
            <button type="button" onclick="updateBoard();">수정</button>
            <button type="button" onclick="deleteBoard();">삭제</button>
        </div>
        <%} %>
        <div id="reply-area">
            <input type="text" id="reply-input" placeholder="댓글을 입력하세요" onkeyup="chkByte(this,'500')">
            <button type="submit" id="btn-reply" onclick="insertReply();">등록</button>
            <br>
            <span id="byte">0</span>/500byte
			
            <br>
            <table class="reply">
                <tbody>
                  
                </tbody>
                
            </table> 
        </div>
    </div>
    <script>
    	/*버튼 눌렀을때 페이지 이동할 주소*/
    	function enrollform(){
    		location.href ="<%=contextPath%>/insert.bo"
    	};
    	function listBoard(){
    		location.href ="<%=contextPath%>/list.bo?currentPage=1"
    	};
    	function updateBoard(){
    		location.href ="<%=contextPath%>/update.bo"
    	};
    	function deleteBoard(){
    		location.href ="<%=contextPath%>/delete.bo"
    	};
    	
    	/*댓글 삽입*/
	    function insertReply(){
			$.ajax({
				url : "insertReply.bo",
				data : {
					bno : <%=b.getBoardNo()%>,
					content : $("#reply-input").val()
				},
				type : "post",
				success : function(result){
					if(result>0){
						$("#reply-input").val(" ");
						selectReplyList();
					}
				}
			});
		};
		/*댓글리스트 불러오기*/
		function selectReplyList(){
			$.ajax({
				url	: "selectReplyList.bo",
				data : {
					bno : <%=b.getBoardNo()%>
				},
				success : function(list){
					var str = "";
					for(var i=0;i<list.length;i++){
					str += "<tr>"
						 + "<td width='15%'>" + list[i].replyWriter+"</td>"
						 + "<td	width='60%'>"+list[i].content+"</td>"
						 + "<td>"+list[i].createDate+"</td>"
						 + "</tr>"
						 + "<tr>"
						 + "<td colspan='3'>"
						 + '<button onclick = "deleteReply('+list[i].replyNo+');">'
						 + '삭제'
						 + '</button>'
						 + '<button onclick = "updateReply('+list[i].replyNo+');">'
						 + '수정'
						 + '</button>'
						 + "</td>"
						 + "</tr>"
						 
				}
					$(".reply tbody").html(str)
				}
			});
		};
		$(function(){
			selectReplyList();
		});
		
		/*글자 입력시 바이트수 체크*/
		function chkByte(obj, maxByte){
			var str = obj.value
			var str_len = str.length;
			
			var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";


		    for(var i=0; i<str_len; i++)
		    {
		        one_char = str.charAt(i);
		        if(escape(one_char).length > 4) {
		            rbyte += 3;                                         //한글3Byte
		        }else{
		            rbyte++;                                            //영문 등 나머지 1Byte
		        }
		        if(rbyte <= maxByte){
		            rlen = i+1;                                          //return할 문자열 갯수
		        }
		     }
		     if(rbyte > maxByte)
		     {
		        alert(maxByte + "를 초과할 수 없습니다.")
		        str2 = str.substr(0,rlen);                                  //문자열 자르기
		        obj.value = str2;
		        fnChkByte(obj, maxByte);
		     }
		     else
		     {
		        document.getElementById('byte').innerText = rbyte;
		     }
		}
			function deleteReply(replyNo){
				
				$.ajax({
					url : "delete.re",
					data :{
						replyNo : replyNo
					},
					success : function(result){
						alert("댓글이 삭제 되었습니다.");
					}
				});
			}
    </script>
</body>
</html>