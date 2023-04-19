<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Board b = (Board)request.getAttribute("b");
    
    	Attachment at = (Attachment)request.getAttribute("at");
 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
       
    }
    #enroll-area{
        width: 700px;
        height: 800px;
        border-top: 1px solid;
        border-collapse: collapse;
        margin: auto;
    }
    #enroll-area>tr,th,td{
        border-bottom: 1px solid #444444;
        padding: 5px;
    }
    #enroll-area>thead{
        text-align: center;
    }
  
    #btn{
        text-align: center;
    }
    #title-area{
        width: 100%;
        box-sizing: border-box;
    }
    #file-area{
        width: 100%;
    }
    #reply-wrap{
        border: 1px solid;
        width: 500px;
        height: 100%;
        margin: auto;
    }
    #reply-area{
        border: 1px solid;
        width: 100%;
        height: 100%;
        text-align: center;
    }
    
    
</style>
<body>
	<%@ include file ="../common/menubar.jsp" %>
    <div class="wrap">
        <h2 align="center">게시글 작성</h2>
        <input type ="hidden" name="userNo" value="">
        <table id="enroll-area">
            <thead>
                <tr>
                    <th>위치</th>
                    <td width="50px"><%=b.getLocationCode() %></td>
                    <th>제목</th>
                    <td><%=b.getTitle() %></td>
                    </tr>
                    <tr>
                        <td colspan="4">글씨 editor 추가예정</td>
                    </tr>
            </thead>
            <tbody>
                <tr>
                	<th>내용</th>
                    <td colspan="4">
                        <p style="width:200px"><%=b.getContent() %></p>
                    </td>
                </tr>
                <tr>
                	<td>파일첨부</td>
                    <td colspan="3" id="file-area">
                    <!-- 파일 유무에 대한 조건 걸기 -->
                    <!--<a href = "" download></a>  -->                    
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                <!-- 로그인 유저만 볼수 있도록 조건걸기 -->
                    <td colspan="4" id="btn">
                        <button onclick ="updateBoard();" >수정</button>
                        <button onclick ="deleteBoard();" >삭제</button>
                        <button type="reset" onclick ="history.back()">이전화면</button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <br><br>
    <div id="reply-wrap" align = "center">
    	<table border="1" id="reply-area">
    	<thead>
	    	<tr>
	    		<th>작성자</th>
	    		<th>내용</th>
	    		<th>날짜<th>
	    	</th>
		</thead>
		<tbody>
    		<tr>
    			<td>admin</td>
    			<td>내용</td>
    			<td>0000-00-00</td>
    		</tr>
    	</tbody>
    	</table>
    </div>
    <script>
    	function updateBoard(){
    		location.href =<%=contextPath%>/update.bo?bno=<%=b.getBoardNo()%>
    	}
    	
    </script>
</body>
</html>