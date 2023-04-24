<%@page import="com.kh.board.model.vo.unLike"%>
<%@page import="com.kh.board.model.vo.Like"%>
<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Board b = (Board)request.getAttribute("b");
    
    	Attachment at = (Attachment)request.getAttribute("at");
    	
		Like l = (Like)request.getAttribute("l");
		
		unLike ul = (unLike)request.getAttribute("ul");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세페이지</title>
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
        width: 40%;
        height: 30%;
        margin-left: 150px;
    	
    }
    #reply-input{
        width: 100%;
        height: 100px;
        box-sizing: border-box;
        
    }
    #btn-reply{
        background-color: rgb(243, 197, 112);
        border: 0;
        width: 80%;
        height: 80px;
        float: left;
    }
    #byte{
        margin-left: 360px;
    }
    .reply{
    	margin:auto;
        width: 600px;
    	border-bottom: 1px solid black;
        
    }
    .reply button{
        text-decoration: none;
        margin-left: 5px;
        color: black;
        float: right;
		border: 0;
		background-color: rgb(243, 197, 112);
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
    }
    #file-area{
        border: 1px solid;
    }
    #btn-like{
        width: 50px;
        height: 30px;
        background-color:white;
        border: 1px solid darkgray;
    }
    #btn-like img{
    	width:30px;
    	height:30px;
    }
 
    
</style>

<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="wrap">
        <br>
        <h2 align="center">자유게시판</h3>
        <br>
        <h4>[<%=b.getLocationCode()%>]<%=b.getTitle() %></h4>
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
        <div id="file-area">
        	첨부파일
            <%if(at==null){%>
            <p></p>
            <%}else{%>
            <a href="<%=contextPath +at.getFilePath()+"/"+at.getChangeName()%>" download><%=at.getOriginName()%></a>
            <%} %>
        </div>
        <br><br>
        <%if(loginUser!=null){ %>
        <div id="like-area">
        		<%if(ul!=null && loginUser.getUserNo()==ul.getUserNo()){ %>
    			<button id="btn-like" onclick="unlike()">
        		<img src="resources/images/싫어요후.png" alt="하트2" id="heartbreak">
    			<%=b.getBad() %>
    			</button>
    			<%}else{ %>
                <button id="btn-like" onclick="unlike()">
        		<img src="resources/images/싫어요전.png" alt="하트2" id="heartbreak">
    			<%=b.getBad() %>
    			</button>
    			<%} %>
                <%if(l!=null && loginUser.getUserNo()==l.getUserNo()){ %>
				<button id="btn-like" onclick="like();">
		        <img src="resources/images/free-icon-heart-833472좋아요후.png" alt="하트" id="heart">
		    	<%=b.getGood() %>
		    	</button>
				<%}else{ %>
                <button id="btn-like" onclick="like();">
		        <img src="resources/images/free-icon-hearth-4225972좋아요전.png" alt="하트" id="heart">
		    	<%=b.getGood() %>
		    	</button>
				<%} %>
                
        </div>
        <%} %>
        <hr>
        <div id="btn-area">
            <button type="button" id="btn-insert" onclick ="enrollform();">글쓰기</button>
            <button type="button" onclick ="listBoard();">목록</button>
        </div> 
        <hr>
        <br>
        <%if(loginUser!=null && loginUser.getUserId().equals(b.getBoardWriter())){ %>
        <div id="btn-area2">
            <button type="button" onclick="location.href ='<%=contextPath%>/update.bo?bno=<%=b.getBoardNo()%>'">수정</button>
            <%if(at!=null){ %>
            <button type="button" onclick="location.href = '<%=contextPath %>/delete.bo?bno=<%=b.getBoardNo()%>&changeName=<%=at.getChangeName()%>'">삭제</button>
        	<%}else{%>
        	<button type="button" onclick="location.href = '<%=contextPath %>/delete.bo?bno=<%=b.getBoardNo()%>'">삭제</button>
        	<%} %>
        <%} %>
        </div>
        <div id="reply-area">
            <table class="reply">
            <thead>
            	<%if(loginUser !=null){ %>
                <tr>
                    <td colspan="2"><textarea name="input" id="reply-input" placeholder="댓글을 입력하세요" 
                    cols="20" rows="10" style="resize: none;" onkeyup="chkByte(this, '500')"></textarea></td>
                    <td><button type="submit" id="btn-reply" onclick="insertReply();">등록</button></td>
                </tr>
                <tr>
                    <td colspan="3"><span id="byte">0</span>/500byte <br><br><br><br></td>
                </tr>
                <%}else{ %>
                <tr>
                    <td colspan="2"><textarea name="input" id="reply-input" placeholder="로그인 후 댓글 남겨주세요" 
                    cols="20" rows="10" style="resize: none;" onkeyup="chkByte(this, '500')"></textarea></td>
                    <td><button type="submit" id="btn-reply" onclick="insertReply();">등록</button></td>
                </tr>
                <%} %>
            </thead>
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
						 + "<td	width='60%' id='content'>"+list[i].content+"</td>"
						 + "<td>"+list[i].createDate+"</td>"
						 + "</tr>"
						 + "<%if(loginUser!=null && (loginUser.getUserId().equals(b.getBoardWriter())||loginUser.getUserId().equals("admin"))){ %>"
						 + "<tr>"
						 + "<td colspan='3'>"
						 + '<button onclick = "deleteReply('+list[i].replyNo+');">'
						 + '삭제'
						 + '</button>'
						 + '<button onclick = "updateReplyForm('+list[i].replyNo+',\''+list[i].createDate+'\''+',\''+list[i].replyWriter+'\''+',\''+list[i].content+'\');">'
						 + '수정'
						 + '</button>'
						 + "</td>"
						 + "<%}%>"
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
		/*댓글 삭제*/
			function deleteReply(replyNo){
				
				$.ajax({
					url : "delete.re",
					data :{
						replyNo : replyNo
					},
					success : function(result){
						alert("댓글이 삭제 되었습니다.");
						selectReplyList();
					}
				});
			}
		/*댓글 수정*/
			function updateReplyForm(replyNo,createDate, replyWriter, content){
			var updateReply = "";
			 updateReply += "<tr>"
						 + "<td width='15%'>" +replyWriter+"</td>"
						 + "<td	width='60%'><textarea style='resize: none;' cols='40' rows='3' id='content' >"+content+"</textarea></td>"
						 + "<td>"+createDate+"</td>"
						 + "</tr>"
						 + "<tr>"
						 + "<td colspan='3'>"
						 + '<button onclick = "deleteReply();">'
						 + '삭제'
						 + '</button>'
						 + '<button onclick = "updateReply('+replyNo+')">'
						 + '수정'
						 + '</button>'
						 + "</td>"
						 + "</tr>"
						 $(".reply tbody").html(updateReply)	 
		}	
			
			function updateReply(replyNo,newContent){
				var newContent = $("#content").val();
			$.ajax({
				url:"update.re",
				type:"post",
				data:{
					replyNo : replyNo,
					content : newContent
				},
				success :function(result){
					alert("댓글이 수정되었습니다.")
					selectReplyList();
				}
			});
		}
		/*좋아요 기능*/
		
		function like(){
			$.ajax({
				url:"like.bo",
				type:"post",
				data:{
					bno : <%=b.getBoardNo()%>,
				},
				success:function(result){
					if(result>0){
						$("#heart").attr("src","resources/images/free-icon-heart-833472좋아요후.png");
						location.reload();
					}else{
						$("#heart").attr("src","resources/images/free-icon-hearth-4225972좋아요전.png");
						location.reload(); //새로고침
						 }
					
					}
				});
			}
			
		/*싫어요 기능*/
		function unlike(){
			$.ajax({
				url:"unLike.bo",
				type:"post",
				data:{
					bno : <%=b.getBoardNo()%>,
				},
				success:function(result){
					if(result>0){
						$("#heartbreak").attr("src","resources/images/싫어요후.png");
						location.reload();
					}else{
						$("#heartbreak").attr("src","resources/images/싫어요전.png");
						location.reload();
					}
					
				}
			});
		}
		
    </script>
</body>
</html>