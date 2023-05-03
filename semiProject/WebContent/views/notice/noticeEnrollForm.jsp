<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       .suel{
            width: 1100px;
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
        #enroll-form input,textarea{
        	width : 100%;
        	border: 3px solid rgb(247, 195, 127);
        }
        #enroll-area{
        	width: 1000px;
        	     	
        }
        #enroll-area{
         	font-size: 20px;
        }
        #notice-area{
        	padding: 20px;
        	 
        	background-color:  #6DA292;
        }
        
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="suel">
		<br>
		<h2 >공지사항 작성</h2>
		<br><br>
		<form action="<%=contextPath%>/insert.no" method="post" id="enroll-form">
		<div id="notice-area">
		
			<table align="center" id="enroll-area">
				<tr>
					<th width="50">제목</th>
					<td width="450"><input type="text" name="title" required></td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea rows="25" cols="15" name="content"  required></textarea>
					</td>
					
				</tr>
				
			</table>
		</div>
			<br><br>
			<div id="but" align="center">
				 <button type="submit">등록하기</button>
				 
				 <button type="button" onclick="history.back();">뒤로가기</button>
				 <!-- history.back() :이전페이지로 돌아가기 -->
			</div>
		
		</form>
		<br><br><br><br>
	</div>
	<br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>