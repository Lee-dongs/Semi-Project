
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
        .outer>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(247, 195, 127);
            width: 600px;
            margin:auto;
            text-align:center;
        }
        
       .notice-area>tbody>tr:hover{
        background-color: rgb(245, 221, 190);
        cursor: pointer;
       }
       #no1{
       	border-right: 2px solid  rgb(131, 128, 128);;
       }
       .notice-area{
       	width:1000px;
       }
       #no2{
       font-weight: bolder;
       font-size: 17px;
       }
      
    </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
    <br>
        <h2 align="center">공지사항</h2>
        <br>
        <div align="center">
        	<%if(loginUser !=null && loginUser.getUserId().equals("admin")) {%>
            <a href="<%=contextPath %>/insert.no" class="btn btn-secondary">공지사항 작성</a>
            <%} %>
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
                	<td width="30" id="no1"><%=n.getNoticeNo()%></td>
                    <td width="400" id="no2">[공지]<%=n.getNoticeTitle() %></td>
                    <td width="100"><%=n.getNoticeWriter() %></td>
                    <td width="100"><%=n.getCount() %></td>
                    <%if(loginUser !=null && loginUser.getUserId().equals("admin")) {%>
                    <th width="100">
                    <a href="<%=contextPath %>/delete.no?nno=<%=n.getNoticeNo() %>" class="btn btn-danger">삭제하기</a>
                    </th>
                    <%} %>
                </tr>
                <%} %>
                <%} %>
                
            </tbody>
        </table>

    </div>
    <script>
    $(".notice-area>tbody>tr").click(function(){
    		//console.log($(this).children().eq(0).text());
    		
    		var nno = $(this).children().eq(0).text();
    		
    		location.href= '<%=contextPath%>/detail.no?nno='+nno;
    	})
    </script>

</body>
</html>