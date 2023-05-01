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
        	min-height:100%;
        	position :relative;

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
            
        #notice-table input,textarea{

        	width : 100%;
        	border:1px solid white;
        }
        #notice-table{
        	width: 1000px;
        }
        .notice-area{
        	width:1050px;
    		height: 740px;
	    	padding:20px;
	    	background-color: rgb(245, 228, 206); 
	    	border-radius: 30px;	
	    	margin:auto;
        }
        
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>

	<div class="suel">

		<br>
		<h2 >공지사항 작성</h2>
		<br>
		<form action="<%=contextPath%>/update.no" method="post" id="enroll-form">
		<div class="notice-area">
			<input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
			<table align="center" id="notice-table">
				<tr>
					<td width="50">제목 </td>
					<td width="450"><input type="text" name="title" value="<%=n.getNoticeTitle() %>" required></td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td>내용</td>
					<td colspan="2">
						<textarea rows="25" cols="15" name="content" required>
						<%=n.getNoticeContent() %>
						</textarea>
					</td>
					
				</tr>
				
			</table>
		</div>
			<br><br>
			<div id="but" align="center">
				 <button type="submit">등록하기</button>
			</div>
		
		</form>
		<br><br><br><br>
	</div>
</body>
</html>