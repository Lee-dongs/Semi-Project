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
<<<<<<< HEAD
            width: 1500px;
=======
            width: 1000px;
>>>>>>> refs/remotes/origin/main
        	height: 1000px;
        	margin: auto;
        	min-height:100%;
        	position :relative;
        	
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
        
        
     #question-table{
        	width: 1000px;
        	
            height: 700px;
                  
        }
    .question-area{
    	
    	width:1050px;
    	height: 740px;
    	padding:10px;
    	background-color: #d9e8e3; 
    	border-radius: 30px;
    	margin:auto;

    }
     #question-table>thead{
        	padding: 20px; 
        }
     #question-table th{
	   	 font-size: 20px;
	   	  border-bottom: 3px solid white;
	   	  
	   }
	 #question-table td{
	   	font-size: 18px;
	   	 border-bottom: 3px solid white;
	   	 
	   }
        #question-table>table{border : 1px solid white;}
        #question-table input,textarea{
        	width : 100%;
        	box-sizing:border-box;
        }
        
</style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<div class="suel">
    <br><br>
	<h2 align="center">고객문의 수정</h2>
	<br><br>
	<form action="<%=contextPath %>/update.qo" method="post" >
	
		 <div class="question-area" align="center">
		 <input type="hidden" name="qqo" value="<%=qq.getQuestionNo()%>">
		      	<table align="center" id="question-table">
                     <thead>                       
                       <tr>                           
                         <th>제목</th>
                         <td><input type="text"  name="quTitle" value="<%=qq.getQuestionTitle() %>" required></td>
                         	
                       </tr>
                         
                         <tr>
                         	<th>내용</th>
                            <td><textarea rows="20" cols="47" name="quContent"><%=qq.getContent() %></textarea></td>
                         </tr>
                                                 
                      </thead>
                      
                      
               </table>
               <br><br>
               <div align="center"><button type="submit" class="btn btn-success">등록</button></div>	
		 </div>
               
	</form>
	</div>
</body>
</html>