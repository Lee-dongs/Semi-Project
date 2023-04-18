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
        #enroll-form>table{border : 1px solid white;}
        #enroll-form input,textarea{
        	width : 100%;
        	box-sizing:border-box;
        }
        #enroll-area{
        	width: 1000px;
        }
        
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 >공지사항 작성</h2>
		<br>
		<form action="<%=contextPath%>/update.no" method="post" id="enroll-form">
			<input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
			<table align="center" id="enroll-area">
				<tr>
					<td width="50">제목 </td>
					<td width="450"><input type="text" name="title" value="<%=n.getNoticeTitle() %>" required></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td colspan="2">
						<textarea rows="25" cols="15" name="content" required>
						<%=n.getNoticeContent() %>
						</textarea>
					</td>
					
				</tr>
				
			</table>
			<br><br>
			<div id="but" align="center">
				 <button type="submit">등록하기</button>
			</div>
		
		</form>
		<br><br><br><br>
	</div>
</body>
</html>