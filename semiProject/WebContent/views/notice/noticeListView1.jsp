
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	
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
            margin-top: 30px;
        }
       .notice-area>tbody>tr:hover{
        background-color: burlywood;
        cursor: pointer;
       }
      
    </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <h2>공지사항</h2>
        <br>
        <div align="center">
            <a href="<%=contextPath %>/insert.no" class="btn btn-secondary">공지사항 작성</a>
            <br><br>
        </div>
        <table class="notice-area" align="center">
            <thead>
            </thead>
            <tbody>
                <%if(list.isEmpty()){ %>
                <tr>
                	<td>공지게시글이 없습니다.</td>
                </tr>
                
                <%}else{ %>
                <%for(Notice n:list) {%>
                <tr>
                	<td><input type="hidden" name="nno"></td>
                    <td width="400">[공지]<%=n.getNoticeTitle() %></td>
                    <td width="100"><%=n.getNoticeWriter() %></td>
                    <td width="100"><%=n.getCount() %></td>
                    <th width="100"><button type="reset" class="btn btn-danger">삭제하기</button></th>
                </tr>
                <%} %>
                <%} %>
                
            </tbody>
        </table>

    </div>
    <script>
    $(".notice-area>tbody>tr").click(function(){
    		console.log($(this).children().eq(0).text());
    		
    		var nno = $(this).children().eq(0).text();
    		
    		//location.href= '<%=contextPath%>/detail.no?nno='+nno;
    	})
    </script>

</body>
</html>