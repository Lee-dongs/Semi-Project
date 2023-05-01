<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Notice n = (Notice)request.getAttribute("notice");
    	
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
            background-color: rgb(247, 195, 127);
            width: 500px;
            margin:auto;
            text-align:center;
            padding:10px;
            
        }
        .notice-area{
        	width:1050px;
    		height: 740px;
	    	padding:10px;
	    	background-color: rgb(245, 228, 206); 
	    	border-radius: 30px;	
	    	
        }        
	 	#detail-table{
	 		width: 1000px;        	
            height: 700px;	
	 	}
	 	#detail-table>thead{
	 		
        	padding: 20px; 
        }
	   #detail-table th{
	   	 font-size: 20px;
	   	  border-bottom: 3px solid white;
	   }
	   #detail-table td{
	   	font-size: 18px;
	   	 border-bottom: 3px solid white;
	   }
	   
</style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
	<div class="suel" align= "center">
	<br>
	<h2 align="center">공지사항 상세페이지</h2>
	<br><br>
	<div class="notice-area">
	
		<table id="detail-table" align="center">
		<thead>
		<tr>
           <th width="70">제목</th>
           <td width="350" colspan="3"><%=n.getNoticeTitle() %></td>
        </tr>
        <tr>
           <th>작성자</th>
           <td width="200"><%=n.getNoticeWriter() %></td>
           <th>날짜</th>
           <td><%=n.getCreateDate() %></td>
                    
        </tr>
        <tr>
           <th>내용</th>
           <td colspan="3"><p style="height:500px"><%=n.getNoticeContent() %></p></td>
                    
        </tr>
        </thead>
		</table>
	</div>
		
		
		<br>
		<%if(loginUser !=null && loginUser.getUserId().equals(n.getNoticeWriter())) {%>
		<div align="center">
			<a href="<%=contextPath %>/update.no?nno=<%=n.getNoticeNo() %>" class="btn btn-warning">수정하기</a>	
		</div>
		<%} %>
		<br><br><br><br><br>
		</div>
	
</body>
</html>