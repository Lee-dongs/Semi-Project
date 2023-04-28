<%@page import="com.kh.question.model.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Question qq = (Question)request.getAttribute("question");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .outer{
            color: black;
            width: 1000px;
            height: 500px;
            margin: auto;
            margin-top: 50px;
        }
        .outer>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(247, 195, 127);
            width: 600px;
            margin:auto;
            text-align:center;
        }
        #question-table>table{border : 1px solid white;}
        #question-table input,textarea{
        	width : 100%;
        	box-sizing:border-box;
        }
        #question-table{
        	width: 1000px;
        }
        table th{
	   	 font-size: 20px;
	   	  border-bottom: 1px solid black;
	   }
	   table td{
	   	font-size: 18px;
	   	 border-bottom: 1px solid black;
	   }
	   
	  
</style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<div class="outer">
		<br>
	<h2>고객문의 </h2>
	<br>
		 <input type="hidden" name="qqo" value="<%=qq.getQuestionNo()%>">
		      	<table align="center" id="question-table">
                     <thead>                       
                       <tr>                           
                         <th width="70">제목</th>
                         <td width="350" colspan="3"><%=qq.getQuestionTitle() %></td>
                        
                       </tr>
                       <tr>
                       	<th>작성자</th>
				           <td width="200"><%=qq.getQuestionWriter() %></td>
				           <th>날짜</th>
				           <td><%=qq.getModifyDate() %></td>
                       </tr>
                         <tr>
                         	
                         	<th>내용</th>
                            <td colspan="3"><p style="height:500px"><%=qq.getContent() %></p></td>
                         </tr>
                            
                         <tr><td height="20"> </td></tr>
                         
                      </thead>
                      
               </table>	 
               
               <br>
               <%if(loginUser !=null && loginUser.getUserId().equals(qq.getQuestionWriter())) {%>
        		<div align="center">
        			<a href="<%=contextPath%>/update.qo?qqo=<%=qq.getQuestionNo()%>"class="btn btn-warning">수정하기</a>
        		 	<a href="<%=contextPath%>/delete.qo?qqo=<%=qq.getQuestionNo() %>"class="btn btn-danger">삭제하기</a>
        		 </div>
        		<%} %>
        		<br>
        		
        <div >
        	<table border="1" align="center" class="reply-area">
        		<thead>
        		<%if(loginUser != null&& loginUser.getUserId().equals("admin")){ %>
        			<tr> 
        				<td>작성</td>      				
        				<td><textarea id="text-box" rows="5" cols="70" style="resize:none" ></textarea></td>
        				<td><button onclick="insertReply();" >관리자댓글등록</button></td>
        			</tr>
        			<%}else{ %>
        			
        		<%} %>
        		</thead>
        		<tbody>
        			
        		</tbody>
        	</table>
        	<br><br>
        </div>
        	
        	 <script>
     /*댓글삽입*/
    function insertReply(){
		//댓글 삽입
		//게시글 번호 필요
		//성공시에는 댓글 리스트 조회함수 실행 후 
			
		$.ajax({
			url:"insertRe.qo",
			data : {
				
				questionNNo:<%=qq.getQuestionNo()%>,
				
				content: $("#text-box").val()
			},
			type : "post",
			success : function(result){
				
				if(result>0){
				//console.log(result);
				alert("댓글 작성 완료");
				selectReplyList();//댓글리스트 갱신
				$("#text-box").val("");
					
				}
				
			},
			error : function(){
				console.log("댓글 작성 통신 실패");
			}
		})
	}
    /*댓글불러오기*/
    function selectReplyList(){
    	
    	//console.log($(".question-area>tfoot>#tr3>td>#questionDiv"));
    	$.ajax({
    		url:"selectReList.qo",
    		data : {
    			questionNNo:<%=qq.getQuestionNo()%>
    		},
    		type:"post",
    		success: function(list){
    			console.log(list)
				var str ="";
				
				for(var i=0; i<list.length; i++){
					str+="<tr>"
						+"<td>"+list[i].createDate+"</td>"
						+"<td width='75%'>"+list[i].replyContent+"</td>"
						+"<td>"+list[i].replyWriter+"</td>"						
						+"</tr>"
						+ "<%if(loginUser!=null && loginUser.getUserId().equals("admin")){ %>"
						+ "<tr>"
						+ "<td colspan='3' align='center'>"
						+ '<button onclick = "updateReplyForm('+list[i].replyNo+',\''+list[i].createDate+'\''+',\''+list[i].replyContent+'\''+',\''+list[i].replyWriter+'\');">'
						+ '수정'
						+ '</button>'
						+ '<button onclick = "deleteReply('+list[i].replyNo+');">'
						+ '삭제'
						+ '</button>'
						+ "</td>"
						+ "</tr>";												
						+ "<%}%>"
				}
				$(".reply-area tbody").html(str);
			},
			error : function(){
				console.log("댓글조회 실패");	
    		}
    	});
    }
    $(function(){
		selectReplyList();
	});
    
    /*댓글 삭제*/
    function deleteReply(replyNo){
    	$.ajax({
    		url:"deleteReply.qo",
    		data:{
    			replyNo : replyNo
    		},   		
    		success:function(result){
    			if(result>0){
					//console.log(result);
					alert("댓글 삭제 완료");
					selectReplyList();
    			}
    			
    		}
    	})
    }
    
    /*댓글수정*/
    function updateReplyForm(replyNo,createDate,replyContent,replyWriter){
    	var updateReply="";
    	updateReply+="<tr>"
    				+"<td>"+createDate+"</td>"
    				+"<td><textarea style='resize: none;' cols='70' rows='5' id='reContent' >"+replyContent+"</textarea></td>"
    				+"<td>"+replyWriter+"</td>"
    	            +"</tr>"
    	            +"<tr>"
    	            +"<td colspan='2'>"
    	            +'<button onclick = "updateReply('+replyNo+');">'
					+'수정하기'
					+'</button>'
					+"</td>"
    	            +"</tr>";
    	$("#reply-area tbody").html(updateReply);
    	            
    	            
    };
    function updateReply(replyNo,replyContent){
    	var content = $("#reContent").val();
    	$.ajax({
    		url:"updateReply.qo",
    		data:{
    			replyNo:replyNo,
    			content : content
   
    		},
    		type:"post",
    		success:function(result){   			
				//console.log(result);
				alert("댓글 수정 완료");
				selectReplyList();

    		}
    	})
    }
    
    
    
   
	
    </script>
	
	</div>
</body>
</html>