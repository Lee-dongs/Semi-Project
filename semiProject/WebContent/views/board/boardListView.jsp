<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.pageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
	
	String keyword = (String)request.getAttribute("keyword");
	
	String category = (String)request.getAttribute("category");
	
	
	int sort = (Integer)request.getAttribute("sort");
		
	pageInfo pi = new pageInfo();
	ArrayList<Board> list = new ArrayList<Board>();
	
	
	if(keyword !=null && category !=null){
		list = (ArrayList)request.getAttribute("slist"); 
		pi = (pageInfo)request.getAttribute("spi");
	}else{
		list = (ArrayList)request.getAttribute("list");
		pi = (pageInfo)request.getAttribute("pi");
	}
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
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
        width: 1000px;
        margin: auto;
        
        min-height:100%;
        position :relative;
    }
    .list-area>thead>tr, .list-area>tbody>tr{
        text-align: center;
        border-bottom: 1px solid rgb(189, 187, 187);
        height: 50px;
    }
    .list-area>thead{
        font-size: 15px;    
    }
    .list-area>tbody{
        font-size: 20px;
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
    #foot-btn{
    	font-size:10px;
        float: right;
        width: 12%;
        height: 10%;
        margin-top: 5px;
        margin-left: 10px;
        font-size:16px;
    }
    .list-area>tbody>tr:hover{
        background-color: rgb(243, 242, 242);
        cursor: pointer;
    }
    #board_search{
        float: right;
        height: 100%;
        width: 30%;
        margin-right: 35px;
    }
	#search-area{
        position: relative;
    }
    #search-area>button{
        position: absolute;
        height: 26px;
        width: px;
        top: 0;
        right: 0;
        margin: 0;
        background-color: white;
        border: 0;
        opacity: 1;
    }
    .bi-search{
        margin-bottom: 6px;
    }
    #category{
        margin-left: 590px;
        box-sizing: border-box;
    }
    #location{
        float: left;
    }
    .list>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(247, 195, 127);
            width: 600px;
            margin:auto;
            text-align:center;
        }
	
</style>
<body>
<%@ include file="../common/menubar.jsp" %>

    <div class="list">
        <br>
        <h2 align="center">자유게시판</h2>
        <br><br>
        <table class="list-area">
            <thead>
                <tr>
                    <th class="search_input" colspan="6">
                    	<form action="search.bo" method="get" id="search-area" onsubmit="return chkBlank();">
                    	<input type="hidden" name="currentPage" value="1">
                    	<input type="hidden" name="sort" value="1">
                    		<select name="category" id="category">
                                <option value="제목">제목</option>
                                <option value="내용">내용</option>
                                <option value="작성자">작성자</option>
                            </select>
                            <input type="text" name="keyword" placeholder="검색" id="board_search">
                            <button>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="17" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                  </svg>
                            </button>
                        </form>
                    </th>
                </tr>
                <tr>
                    <th width="70px">No</th>
                    <th width="250px">제목</th>
                    <th width="70px">작성자</th>
                    <th width="100px">작성일</th>
                    <th width="70px">조회수</th>
                    <%if(loginUser!=null && loginUser.getUserId().equals("admin")){ %>
                    <th width="50px">글삭제</th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
            	<%if(list.isEmpty()){ %>
            		<tr><td colspan='6'>존재하는 게시글이 없습니다.</td></tr>
            	<%}else{ %>
                <tr>
                	<%for(Board b : list){ %>
                    <td id="boardNo"><%=b.getBoardNo() %></td>
                    <td id="title">[<%=b.getLocationCode() %>] <%=b.getTitle() %></td>
                    <td id="userId"><%=b.getBoardWriter() %></td>
                    <td id="date"><%=b.getCreateDate() %></td>
                    <td id="count"><%=b.getCount() %></td>
                	<%if(loginUser!=null &&loginUser.getUserId().equals("admin")){ %>
                    <td><button class = "btn btn-danger">삭제</button></td>
                    <%} %>
                </tr>
            	<%} %>
            <%} %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7">
	        	    <%if(loginUser !=null){ %>
                    <button type="button" id="foot-btn" class="btn btn-warning" onclick="enrollform();">글쓰기</button>
    		        <%} %>
					    <button type="button" id="foot-btn" class="btn btn-warning" onclick="newerList();">최신순</button>
	                    <button type="button" id="foot-btn" class="btn btn-warning"  onclick="mostViewList();">조회순</button>
                    </td>
                </tr>
            </tfoot>
        </table>
        <br><br>
        <%if(keyword!=null){ %>
        <div class="paging-area text-center">
        	<div class="btn-group">
	        <%if(pi.getCurrentPage()!=1) {%>
	        	<button onclick="location.href = '<%=contextPath%>/search.bo?currentPage=<%=pi.getCurrentPage()-1%>'" class="btn btn-warning">다음</button>
	        <%} %>
	        <%for(int i=pi.getStartPage();i<=pi.getEndPage();i++){ %>
	        	<%if(i!=pi.getCurrentPage()){ %>
	        		<button onclick="location.href='<%=contextPath%>/search.bo?currentPage=<%=i%>&category=<%=category%>&keyword=<%=keyword%>';" class="btn btn-warning"><%=i %></button>
        		<%}else{ %>
        		<button disabled class="btn btn-warning"><%=i %></button>
        		<%} %>
	        <%} %>
	        <%if(!list.isEmpty() && pi.getCurrentPage()!=pi.getMaxPage()){ %>
	        	<button onclick="location.href='<%=contextPath%>/search.bo?currentPage=<%=pi.getCurrentPage()+1%>'" class="btn btn-warning">이전</button>
	        <%} %>
	    </div>
	    </div>
	    <%}else{ %>
	    <div class="paging-area text-center">
	    <div class="btn-group">
		    <%if(pi.getCurrentPage()!=1) {%>
		        <button onclick="location.href = '<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()-1%>&sort=<%=sort%>'" class="btn btn-warning">이전</button>
		    <%} %>
		    <%for(int i=pi.getStartPage();i<=pi.getEndPage();i++){ %>
		        <%if(i!=pi.getCurrentPage()){ %>
		        	<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=i%>&sort=<%=sort%>';" class="btn btn-warning"><%=i %></button>
	         	<%}else{ %>
	        		<button disabled class="btn btn-warning"><%=i %></button>
	        	<%} %>
	        <%} %>
	        <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	        	<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()+1%>&sort=<%=sort%>'" class="btn btn-warning">다음</button>
	      	  <%} %>
	    </div>
	    </div>
        	<%} %>
    </div>
    	<script>
    	function enrollform(){
			location.href ="<%=contextPath%>/insert.bo"
		};
		
		$(".list-area>tbody>tr").click(function(){
			var bno = $(this).children().eq(0).text();
			
			<%if(loginUser==null){%>
			var userId = null;
			<%}%>
    			
    			if(userId==null){
    				alert("로그인 후 사용해주시길 바랍니다.")
    			}else{
	    			location.href = "<%=contextPath%>/detail.bo?bno="+bno
    			}
    		});
		
    		function newerList(){
    			location.href ="<%=contextPath%>/list.bo?currentPage=1&sort=1"
    		};
    		
    		function mostViewList(){
    			location.href ="<%=contextPath%>/list.bo?currentPage=1&sort=2"
    		};
    		function chkBlank(){
    			if($("#board_search").val().length==0){
    				alert("검색할 내용을 입력해주세요");
    				return false;
    			}
    			
    		};
    	</script>
</body>
<br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</html>