<%@page import="com.kh.manager.model.vo.Report"%>
<%@page import="com.kh.common.model.vo.pageInfo"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
    	pageInfo pi = (pageInfo)request.getAttribute("pi");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고글관리</title>
    <style>
        .member-wrap *{
            box-sizing: border-box;
        }
        /*검색창 스타일*/
        .search-area{
            width: 50%;
            height: 8%;
            margin: auto;
        }
        .member-wrap{
            width: 1300px;
            height: 800px;
            margin: auto;
        }
        .search-area div{
            float: left;
        }
        #search-text{
            width: 70%;
            height: 100%;
        }
        #search-btn{
            width: 10%;
            height: 100%;
        }
        #search-by-sth{
            width: 20%;
            height: 100%;
        }
        .search-area input, .search-area select{
            width: 100%;
            height: 100%;
        }
        /*테이블스타일*/
        .report-list{
        	table-layout: fixed;
        }
        .report-list td{
            text-align: center;
            word-break: break-all;
            height: auto;
        }
        .member-wrap table td{
           text-align: center;
            
        }
       /* 제목스타일 */
       .member-wrap>#title{
        width: 80%;
        text-align: center;
        margin: auto;
        padding: 10px;
        background-color: rgba(247, 222, 0, 0.781);
        color: white;
        font-size: 20px;
        font-weight: 600;
        border-radius: 10px;
       }
       /*페이징 구역*/
      .paging-area{
      	padding-bottom: 100px;
      	padding-top: 20px;
      }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div class="member-wrap">
        <br><br>

        <div id="title">
            신고글 관리
        </div>
        <br><br>

      <div class="search-area">
        <form action="searchReport.ma" method="get" id=search-form onsubmit="return checkBlank()">
         <input type="hidden" name="currentPage" value="1">
            <div id="search-by-sth">
                <select name="searchBy" id="search-by">
                    <option value="userId">신고된 아이디</option>
                    <option value="content" id="searchByContent">상세신고내용</option>
                </select>
            </div>
            <div id="search-text">
                <input type="search" name="keyword" id="keyword" 
                	value="<%=(request.getAttribute("keyword")==null)?"":request.getAttribute("keyword")%>">
            </div>
            <div id="search-btn">
                <input type="submit" value="검색"></input>
            </div>
        </form>
      </div>
      
     <script>
     
  // 검색 값 유지하기
  	$(function() {
 	    // 값 불러오기
 	    var savedSearchBy = "<%=request.getAttribute("searchBy")%>";
 	    
 	    // servlet에서 가져온 값 있으면 대입하기
 	    if (savedSearchBy=="content") {
 	      $("#searchByContent").attr("selected",true);
 	    }
 	  });
  
  // 빈칸 검색하지 못하게 하는 함수
	     function checkBlank(){
	    	if($("#keyword").val().length == 0){
	    		alert("검색할 내용을 입력해주세요");
	    		return false;
	    	}
	     };
     
     </script>

        <br>

      <table class="report-list table-striped" align="center">
            <thead>
                <tr>
                    <td width="5%">글번호</td>
                    <td width="10%">신고된 아이디</td>
                    <td width="10%">신고사유</td>
                    <td width="50%">상세사유</td>
                    <td width="10%">신고한 아이디</td>
                    <td width="10%">신고처리</td>
                    <td width="5%">글삭제</td>
                </tr>
            </thead>
            <tbody>
            <%if(list.isEmpty()){ %>
            	<tr>
            		<td colspan="7">조회된 신고글이 없습니다.</td>
            	</tr>
            <%}else{ %>
            	<%for(Report r : list){ %>
	            	<tr>
	                    <td><%=r.getReportNo() %></td>
	                    <td><%=r.getUserId() %></td>
                        <td><%=r.getCategory() %></td>
                        <td style="text-align:left"><%=r.getReportContent() %></td>
                        <td><%=r.getReportWriter() %></td>
	                    <td><button type="button" class="btn btn-danger btn-sm" onclick="confirmDelete()">신고처리</button></td>
	                    <td><button type="button" class="btn btn-info btn-sm" onclick="deleteReport()">글삭제</button></td>
	                </tr>
            	<%} %>
            <%} %>
            </tbody> 
        </table>
        <br>
        
        <script>
        // 신고 확인 메세지
        function confirmDelete(){
        	var result = window.confirm("정말 신고처리 하시겠습니까?");
        	
        	if(result){ // 확인을 누르면 -> DB에서 MEMBER-REPORT랑 REPORT-STATUS 바꾸기
        		
	        	$(".report-list>tbody>tr").click(function(){
	           
	            	var rno = $(this).children().eq(0).text();
	            	var id = $(this).children().eq(1).text();
	            	        		
	            	location.href = "<%=contextPath %>/report.ma?id=" + id + "&rno=" + rno; // 회원아이디랑 신고글번호
        		});
        	}
            
        };
        // 글 삭제 확인 메세지
        function deleteReport(){
        	var result = window.confirm("정말 삭제하시겠습니까?");
        	
        	if(result){
        		$(".report-list>tbody>tr").click(function(){
        			
        			var rno = $(this).children().eq(0).text();
        			//console.log(rno);
        			
        			location.href = "<%=contextPath%>/deleteReport.ma?rno=" + rno; // 신고글번호
        			
        		});	
        	}
        };
        
        </script>
        
  
  		<!-- 페이징 -->
  		
  		<%if(request.getAttribute("keyword")==null){ %> <!-- 검색어가 없는 경우 -->
  		      
        <div class="paging-area text-center">
        	<div class="btn-group btn-group-sm">
			<%if(pi.getCurrentPage()!= 1){ %>
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/reportManagement.ma?currentPage=<%=pi.getCurrentPage()-1%>'">이전</button>
			<%} %>
			
			<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
				<!-- 내가 보고있는 페이지 버튼은 비활성화 하기  -->
				<%if(i != pi.getCurrentPage()){ %>
					<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/reportManagement.ma?currentPage=<%=i%>';"><%=i %></button>
				<%}else{ %>
					<button class="btn btn-warning" disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if((!list.isEmpty()) && pi.getCurrentPage() != pi.getMaxPage()){ %>
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/reportManagement.ma?currentPage=<%=pi.getCurrentPage()+1%>'">다음</button>
			<%} %>
			</div>
		</div>
		
		<%}else{ %> <!-- 검색어가 있는 경우 -->
		
		<div class="paging-area text-center" >
			<div class="btn-group btn-group-sm">
			<%if(pi.getCurrentPage()!= 1){ %>
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/searchReport.ma?currentPage=<%=pi.getCurrentPage()-1%>&searchBy=<%=request.getAttribute("searchBy")%>&keyword=<%=request.getAttribute("keyword")%>'">이전</button>
			<%} %>
			
			<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
				<!-- 내가 보고있는 페이지 버튼은 비활성화 하기  -->
				<%if(i != pi.getCurrentPage()){ %>
					<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/searchReport.ma?currentPage=<%=i%>&searchBy=<%=request.getAttribute("searchBy")%>&keyword=<%=request.getAttribute("keyword")%>';"><%=i %></button>
				<%}else{ %>
					<button class="btn btn-warning" disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if((!list.isEmpty()) && pi.getCurrentPage() != pi.getMaxPage()){ %><!-- 조회결과 없으면 다음버튼 안보이게 -->
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/searchReport.ma?currentPage=<%=pi.getCurrentPage()+1%>&searchBy=<%=request.getAttribute("searchBy")%>&keyword=<%=request.getAttribute("keyword")%>'">다음</button>
			<%} %>

			<!-- 검색 초기화버튼 -->
				<button class="btn btn-info" onclick="location.href='<%=contextPath%>/reportManagement.ma?currentPage=1'">전체보기</button>
			</div>
			
		</div>
		
		<%} %>
    
    </div>
<br><br><br><br>


</body>
</html>