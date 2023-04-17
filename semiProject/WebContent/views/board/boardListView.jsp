<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.pageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	pageInfo pi = (pageInfo)request.getAttribute("pi");
	
	ArrayList<Board> list = (ArrayList)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .list-area{
        width: 700px;
        margin: auto;
        border-top: 1px solid black;
    }
    .list-area>thead>tr, .list-area>tbody>tr{
        text-align: center;
        border-bottom: 1px solid rgb(189, 187, 187);
    }
    .list-area>thead{
        font-size: 15px;    
    }
    .list-area>tbody{
        font-size: 17px;
    }
    #board_search{
        float: right;
        height: 100%;
        width: 35%;
    }
    #boardNo,#userId,#date{
        text-align: center;
    }
    #count{
        text-align: right;
    }
    #title{
    	text-align: left;
    }
    #btn{
        float: right;
        background-color: rgb(232, 245, 207);
        border: none;
        width: 15%;
        margin-top: 5px;
    }
    tbody>tr:hover{
        background-color: rgb(243, 242, 242);
        cursor: pointer;
    }


</style>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">자유 게시판</h2>
        <table class="list-area" >
            <thead>
                <tr>
                    <th class="search_input" colspan="5">
                        <input type="search" name="keyword" placeholder="검색" id="board_search">
                    </th>
                </tr>
                <tr>
                    <th width="70px">No</th>
                    <th width="250px">제목</th>
                    <th width="70px">작성자</th>
                    <th width="100px">작성일</th>
                    <th width="70px">조회수</th>
                </tr>
            </thead>
            <tbody>
                <%for(Board b : list){ %>
            	<%if(list.isEmpty()){ %>
            		<tr><td colspan='5'>존재하는 게시글이 없습니다.</td></tr>
            	<%}else{ %>
                <tr>
                    <td id="boardNo"><%=b.getBoardNo() %></td>
                    <td id="title">[<%=b.getLocationCode() %>] <%=b.getTitle() %></td>
                    <td id="userId"><%=b.getBoardWriter() %></td>
                    <td id="date"><%=b.getCreateDate() %></td>
                    <td id="count"><%=b.getCount() %></td>
                </tr>
            	<%} %>
            <%} %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5"><button type="button" id="btn" onclick="enrollform();">글작성</button></td>
                </tr>
            </tfoot>
        </table>
        <br><br>
        <div align="center" class="pagin-area">
	        <%if(pi.getCurrentPage()!=1) {%>
	        	<button onclick="location.href = '<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()-1%>'">이전</button>
	        <%} %>
	        <%for(int i=pi.getStartPage();i<=pi.getEndPage();i++){ %>
	        	<%if(i!=pi.getCurrentPage()){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=i%>';"><%=i %></button>
        	<%}else{ %>
        		<button disabled><%=i %></button>
        	<%} %>
        <%} %>
        <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
        	<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()+1%>'">다음</button>
        <%} %>
        </div>
    </div>
    	<script>
    		function enrollform(){
    		
    			location.href ="<%=contextPath%>/insert.bo"
    		}
    	</script>
    
</body>
</html>