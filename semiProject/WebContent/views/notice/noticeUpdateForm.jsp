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
        	height: 1000px;
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
        
        
     #notice-table{
        	width: 1000px;
        	
            height: 700px;
                  
        }
    .notice-area{
    	
    	width:1050px;
    	height: 740px;
    	padding:10px;
    	background-color: rgb(245, 228, 206); 
    	border-radius: 30px;
    	margin:auto;

    }
     #notice-table>thead{
        	padding: 20px; 
        }
     #notice-table th{
	   	 font-size: 20px;
	   	  border-bottom: 3px solid white;
	   	  
	   }
	 #notice-table td{
	   	font-size: 18px;
	   	 border-bottom: 3px solid white;
	   	 
	   }
        #notice-table>table{border : 1px solid white;}
        #notice-table input,textarea{
        	width : 100%;
        	box-sizing:border-box;
        }
        
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="suel">
		<br><br>
		<h2 >공지사항 작성</h2>
		<br><br>
		<form action="<%=contextPath%>/update.no" method="post" id="enroll-form">
		<div class="notice-area">
			<input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
			<table align="center" id="notice-table">
				<tr>
					<td width="50">제목 </td>
					<td width="450"><input type="text" name="title" value="<%=n.getNoticeTitle() %>" required></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td colspan="2">
						<textarea rows="20" cols="15" name="content" required>
						<%=n.getNoticeContent() %>
						</textarea>
					</td>
					
				</tr>
				
			</table>
			</div>
			<br><br>
			<div id="but" align="center">
				 <button type="submit" class="btn btn-success">등록하기</button>
			</div>
		
		</form>
		<br><br><br><br>
	</div>
</body>
</html>