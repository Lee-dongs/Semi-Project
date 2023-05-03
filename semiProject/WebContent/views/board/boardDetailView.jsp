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
        margin: auto;
       	min-height:100%;
        position :relative;
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
     .reply,.replyList-area>table, #reply-area{
    	margin:auto;
        width: 600px;
    	border-bottom: 1px solid black;
        
    }
    .reply button, .replyList-area button{
        text-decoration: none;
        margin-left: 5px;
        color: black;
        float: right;
		border: 0;
		background-color: rgb(243, 197, 112);
    }
    #btn-area{
        height: 80px;
    }
    #btn-area > button{
        float: right;
        height: px;
        width: 80px;
        margin-left: 10px;
    }
    #btn{
        background-color: rgb(243, 197, 112);
        border: 0;
        height: 40px;
        width: 80px;
    }
    #btn-area2{
        height: 10%;
        text-align: center;
        padding-bottom : 20px;
    } 
    #btn-area2>button{
        margin-left: 10px;
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
    #rereply-content{
    	width:100%
    }
    .wrap>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(247, 195, 127);
            width: 600px;
            margin:auto;
            text-align:center;
        }
 
    
</style>

<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="wrap">
        <br>
        <h2 align="center">자유게시판</h2>
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
            <button type="button" id="btn" onclick ="enrollform();">글쓰기</button>
            <button type="button" id="btn" onclick ="listBoard();">목록</button>
        </div> 
        <br>
        <%if(loginUser!=null && loginUser.getUserId().equals(b.getBoardWriter())){ %>
        <div id="btn-area2">
            <button type="button" id="btn" onclick="location.href ='<%=contextPath%>/update.bo?bno=<%=b.getBoardNo()%>'">수정</button>
            <%if(at!=null){ %>
            <button type="button" id="btn" onclick="location.href = '<%=contextPath %>/delete.bo?bno=<%=b.getBoardNo()%>&changeName=<%=at.getChangeName()%>'">삭제</button>
        	<%}else{%>
        	<button type="button" id="btn" onclick="location.href = '<%=contextPath %>/delete.bo?bno=<%=b.getBoardNo()%>'">삭제</button>
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
            </table>
	         <div class="replyList-area">
	         </div>
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
			<%if(loginUser==null){%>
			var userId = null;
			<%}else{%>
			var userId = '<%=loginUser.getUserId()%>';
			<%}%>
			$.ajax({
				url	: "selectReplyList.bo",
				data : {
					bno : <%=b.getBoardNo()%>
				},
				success : function(list){
					var str = "";
					for(var i=0;i<list.length;i++){
					str += "<table class ='replyList"+list[i].replyNo+"'>"
					     + "<body>"
					     + "<tr>"
						 + "<td rowspan='2' width='10%' id='replyNo'>" +list[i].replyNo+ "</td>"
						 + "<td>"+ list[i].replyWriter+"&nbsp;&nbsp;&nbsp;"+list[i].createDate+"</td>"
						 + "</tr>"
					     + "<tr>"
						 + "<td	width='90%'>"+list[i].content+"</td>"
						 + "</tr>"
						 if(userId ==list[i].replyWriter){
					str += "<tr>"
						 + "<td colspan='3'>"
						 + '<button onclick = "deleteReply('+list[i].replyNo+');">'
						 + '삭제'
						 + '</button>'
						 + '<button onclick = "updateReplyForm('+list[i].replyNo+',\''+list[i].createDate+'\''+',\''+list[i].replyWriter+'\''+',\''+list[i].content+'\');">'
						 + '수정'
						 + '</button>'
						 + '<button onclick = "reReply('+list[i].replyNo+');">'
						 + '작성'
						 + '</button>'
						 + "</td>"
						 + "</tr>"
						 }else if(userId =='admin'){
					str += "<tr>"
						 + "<td colspan ='3'>"
						 + '<button onclick = "deleteReply('+list[i].replyNo+');">'
						 + '삭제'
					 	 + '</button>'
					 	 + '</td>'
					 	 + '</tr>'
						 }
					str += "</body>"
						 + "<tfoot>"
						 + "</tfoot>"
						 + "</table>"
						
						
						 
						 selectReReplyList(list[i].replyNo);
				}
					$(".replyList-area").html(str)
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
		};
		/*댓글 삭제*/
			function deleteReply(replyNo){
				
				$.ajax({
					url : "delete.re",
					data :{
						replyNo : replyNo
					},
					success : function(result){
						if(result>0){
						alert("댓글이 삭제 되었습니다.");
						selectReplyList();
						}
					}
				});
			};
		/*댓글 수정*/
			function updateReplyForm(replyNo,createDate, replyWriter, content){
			var updateReply = "";
			updateReply += "<tbody>"
			 			 + "<tr>"
						 + "<td width='15%'>" +replyWriter+"</td>"
						 + "<td	width='60%'><textarea style='resize: none;' cols='40' rows='3' id='content' >"+content+"</textarea></td>"
						 + "<td>"+createDate+"</td>"
						 + "</tr>"
						 + "<tr>"
						 + "<td colspan='3'>"
						 + '<button onclick = "deleteReply('+replyNo+');">'
						 + '삭제'
						 + '</button>'
						 + '<button onclick = "selectReplyList();">'
						 + '취소'
						 + '</button>'
						 + '<button onclick = "updateReply('+replyNo+')">'
						 + '수정'
						 + '</button>'
						 + "</td>"
						 + "</tr>"
						 + "</tbody>"
						 $(".replyList"+replyNo).html(updateReply)
		};
			
			function updateReply(replyNo){
				var newContent = $("#content").val();
			$.ajax({
				url:"update.re",
				type:"post",
				data:{
					replyNo : replyNo,
					content : newContent
				},
				success :function(result){
					if(result>0){
					alert("댓글이 수정되었습니다.")
					selectReplyList();
					}
				}
			});
		};
		/*대댓글 입력폼 & 입력*/
			function reReply(replyNo){
				var str ="";
				str += "<tr>"
					 + "<td	width='60%' colspan='4'><textarea style='resize: none;' cols='40' rows='3' id='rereply-content' ></textarea></td>"
					 + "</tr>"
					 + "<tr>"
					 + "<td colspan='4'>"
					 + '<button onclick = "selectReplyList();">'
					 + '취소'
					 + '</button>'
					 + '<button onclick = "insertReReply('+replyNo+');">'
					 + '등록'
					 + '</button>'
					 + "</td>"
					 + "</tr>"
					
					 $(".replyList"+replyNo).children("tfoot").html(str);
					 
			};
			function insertReReply(replyNo){
				bno = <%=b.getBoardNo()%>
				$.ajax({
					url :"insertReReply.re",
					type : "post",
					data :{
						bno : bno,
						replyNo : replyNo,
						content : $("#rereply-content").val()
					},
					success: function(result){
						if(result>0){
							selectReReplyList(replyNo);
						}
					}
				});
			};
			//대댓글 리스트
			function selectReReplyList(replyNo){
				<%if(loginUser==null){%>
				var userId = null;
				<%}else{%>
				var userId = '<%=loginUser.getUserId()%>';
				<%}%>
				$.ajax({
					url : "selectReReply.re",
					data :{
						replyNo : replyNo
					},
					success : function(list){
						var str="";
						console.log(str);
						for(var i=0;i<list.length;i++){
						str += "<tr>"
							 + "<td rowspan='2'>↳</td>"
							 + "<td>"+ list[i].reReplyWriter+"&nbsp;&nbsp;&nbsp;"+list[i].createDate+"</td>"
							 + "</tr>"
						     + "<tr>"
							 + "<td	width='90%' id='content'>"+list[i].content+"</td>"
							 + "</tr>"
							 if(userId==list[i].reReplyWriter){
						str	+= "<tr>"
							 + "<td colspan='3'>"
							 + '<button onclick = "deleteReReply('+list[i].reReplyNo+','+list[i].refRno+');">'
							 + '삭제'
							 + '</button>'
							 + '<button onclick = "updateReReplyForm('+list[i].reReplyNo+','+list[i].refRno+',\''+list[i].createDate+'\''+',\''+list[i].reReplyWriter+'\''+',\''+list[i].content+'\');">'
							 + '수정'
							 + '</button>'
							 + "</td>"
							 + "</tr>"
							 }else if(userId =='admin'){
						str	+= "<tr>"
							+ "<td colspan='3'>"
							+ '<button onclick = "deleteReReply('+list[i].reReplyNo+','+list[i].refRno+');">'
							+ '삭제'
							+ '</button>'
							+ "</td>"
							+ "</tr>"
								 
							 }
								}
						
							$(".replyList"+replyNo).children("tfoot").html(str);
							}
						});
					}
			/*대댓글 삭제*/
			function deleteReReply(reReplyNo,refRno){
				$.ajax({
					url : "deleteReReply.re",
					data :{
						reReplyNo : reReplyNo,
						replyNo : refRno
					},
					success : function(result){
						alert("댓글이 삭제 되었습니다.");
						selectReplyList();
					}
				});
			}
		 /*대댓글 수정폼*/
		 function updateReReplyForm(reReplyNo,refRno,createDate,reReplyWriter,content){
		 	var str ="";
		 	str += "<tr>"
				 + "<td width='15%'>" +reReplyWriter+"</td>"
				 + "<td	width='60%'><textarea style='resize: none;' cols='40' rows='3' id='reReplycontent' >"+content+"</textarea></td>"
				 + "<td>"+createDate+"</td>"
				 + "</tr>"
				 + "<tr>"
				 + "<td colspan='3'>"
				 + '<button onclick = "deleteReReply('+reReplyNo+','+refRno+');">'
				 + '삭제'
				 + '</button>'
				 + '<button onclick = "selectReplyList();">'
				 + '취소'
				 + '</button>'
				 + '<button onclick = "updateReReply('+reReplyNo+','+refRno+')">'
				 + '수정'
				 + '</button>'
				 + "</td>"
				 + "</tr>"
				
				 $(".replyList"+refRno).children("tfoot").html(str);
		 }
		 
		 function updateReReply(reReplyNo,refRno) {
			 var newReReplyContent = $("#reReplycontent").val();
		 		$.ajax({
		 			url : "updateReReply.re",
		 			type : "post",
		 			data : {
		 				rno : refRno,
		 				reReplyNo : reReplyNo,
		 				content : newReReplyContent
		 			},
		 			success :function(result){
						alert("댓글이 수정되었습니다.")
						selectReplyList();
		 			}
		 		});
		 	};
		 
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
			};
			
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
		};
    </script>
    <br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>