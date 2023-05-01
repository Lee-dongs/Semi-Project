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
	.suel{
            width: 1500px;
        	height: 850px;
        	margin: auto;
        }
     .suel>h2{
            border-style: solid white;
            border-radius: 120px;
             background-color: #7ea197;
            width: 500px;
            margin:auto;
            text-align:center;
            padding:10px;
        }
        #question-table input,textarea{
        	width : 100%;
        	border:3px solid white;
        }
        #question-table{
        	width: 1000px;
        	
        }
        .question-area{
        	width:1050px;
    	height: auto;
    	padding:20px;
    	background-color: #d9e8e3; 
    	border-radius: 30px;
    	margin:auto;
        }
</style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<div class="suel">
		<br>
	<h2>고객문의 수정</h2>
	<br>
	<form action="<%=contextPath %>/update.qo" method="post" >
		 <div class="question-area">
		 <input type="hidden" name="qqo" value="<%=qq.getQuestionNo()%>">
		      	<table align="center" id="question-table">
                     <thead>                       
                       <tr>                           
                         <td>제목</td>
                         <td><input type="text"  name="quTitle" value="<%=qq.getQuestionTitle() %>" required></td>
                        
                       </tr>
                         <tr height="20"></tr>
                         <tr>
                         	<td>내용</td>
                            <td><textarea rows="10" cols="47" name="quContent"><%=qq.getContent() %></textarea></td>
                         </tr>
                            
                         <tr><td height="20"> </td></tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td colspan="2" align="center"><button type="submit" class="btn btn-success">등록</button></td>
                         </tr>
                         <tr><td height="20"> </td></tr>
                            
                     </tbody>
               </table>	 
		 </div>
	</form>
	</div>
</body>
</html>