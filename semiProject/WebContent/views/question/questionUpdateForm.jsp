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
            width: 1000px;
        	height: 850px;
        	margin: auto;
        	min-height:100%;
        	position :relative;
        	
        }
     .suel>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(243, 199, 199);
            width: 500px;
            margin:auto;
            text-align:center;
            padding:10px;
        }
        #question-table>table{border : 1px solid white;}
        #question-table input,textarea{
        	width : 100%;
        	box-sizing:border-box;
        }
        #question-table{
        	width: 1000px;
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
		 <input type="hidden" name="qqo" value="<%=qq.getQuestionNo()%>">
		      	<table align="center" id="question-table">
                     <thead>                       
                       <tr>                           
                         <td>제목</td>
                         <td><input type="text"  name="quTitle" value="<%=qq.getQuestionTitle() %>" required></td>
                        
                       </tr>
                         <tr><td height="20"> </td></tr>
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
	</form>
	</div>
</body>
</html>