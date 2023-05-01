<%@page import="com.kh.common.model.vo.pageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    	pageInfo pi = (pageInfo)request.getAttribute("pi");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
    <style>
        .member-wrap *{
            box-sizing: border-box;
        }
        /*검색창 스타일*/
        .search-area{
            width: 50%;
            height: 5%;
            margin: auto;
        }
        .member-wrap{
            width: 1300px;
            height: 800px;
            margin: auto;
            min-height:100%;
        	position :relative;
        }
        .search-area div{
            float: left;
        }
        #search-text{
            width: 75%;
            height: 100%;
        }
        /*검색창 전체영역*/
        .search-area{
        	border: 3px solid #6DA292;
        	border-radius: 20px;
        	padding: 5px 5px;
        	
        }
        /*검색어 입력공간*/
        #search-text>input{
        	border: none;
        	&::-webkit-search-decoration,
			&::-webkit-search-cancel-button,
			&::-webkit-search-results-button,	/*기본css없애기*/
			&::-webkit-search-results-decoration{
			    display: none;}
        }
        #search-text>input:focus{
        	outline: none;
        }
        /*검색버튼*/
        #search-btn>input{
        	border: none;
        	background-color: white;
        }
        /*select박스*/
        #search-by{
        	border: none;
        }
        #search-btn{
            width: 7%;
            height: 100%;
            font-family: fontawesome;
        }
        #search-by-sth{
            width: 17%;
            height: 100%;
        }
        .search-area input, .search-area select{
            width: 100%;
            height: 100%;
        }
        /*테이블스타일*/
        .member-list{
        	table-layout: fixed;
        }
        .member-list td{
            text-align: center;
            word-break:break-all;
            height: auto;
        }
        
        .member-wrap table td{
           text-align: center;
            
        }
        .member-list button{
        	background-color: #DD614A;
        	border: none;
        }
       /* 제목스타일 */
       .member-wrap>#title{
      		font-family: 'SDSamliphopangche_Outline';
	        width: 80%;
	        text-align: center;
	        margin: auto;
	        padding: 10px;
	        color: black;
	        font-size: 50px;
	        font-weight: 600;
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
            회원관리
        </div>
        <br><br>

      <div class="search-area">
        <form action="searchMember.ma" method="get" id=search-form onsubmit="return checkBlank()">
        <input type="hidden" name="currentPage" value="1">
            <div id="search-by-sth">
                <select name="searchBy" id="search-by">
                    <option value="userId">아이디</option>
                    <option value="userName" id="searchByName">이름</option>
                </select>
            </div>
            <div id="search-text">
                <input type="search" name="keyword" id="keyword"
                	value="<%=(request.getAttribute("keyword")==null)?"":request.getAttribute("keyword")%>">
            </div>
            <div id="search-btn">
                <input type="submit" value="&#xf002;"></input>
            </div>
        </form>
      </div>
      
     <script>
     
     // 검색 값 유지하는 함수
     	$(function() {
    	    // 값 불러오기
    	    var savedSearchBy = "<%=request.getAttribute("searchBy")%>";
    	    
    	    // servlet에서 가져온 값 있으면 대입하기
    	    if (savedSearchBy=="userName") {
    	      $("#searchByName").attr("selected",true);
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

        <br><br>

      <table class="member-list table-striped" align="center">
            <thead>
                <tr height="40px">
                    <td width="10%">아이디</td>
                    <td width="5%">이름</td>
                    <td width="10%">연락처</td>
                    <td width="17%">이메일</td>
                    <td width="30%">주소</td>
                    <td width="10%">생일</td>
                    <td width="3%">경고</td>
                    <td width="10%">가입일</td>
                    <td width="5%">탈퇴처리</td>
                </tr>
            </thead>
            <tbody>
            <%if(list.isEmpty()){ %>
            	<tr height="20px">
            		<td colspan="9">조회된 회원이 없습니다.</td>
            	</tr>
            <%}else{ %>
            	<%for(Member m : list){ %>
	            	<tr height="40px">
	                    <td><%=m.getUserId() %></td>
	                    <td><%=m.getUserName() %></td>
	                    <td><%=(m.getPhone()==null)?"정보없음":m.getPhone()%></td>
	                    <td><%=(m.getEmail()==null)?"정보없음":m.getEmail()%></td>
	                    <td><%=(m.getAddress()==null)?"정보없음":m.getAddress() %></td>
	                    <td><%=(m.getBirth()==null)?"정보없음":m.getBirth() %></td>
	                    <td><%=m.getReport() %></td>
	                    <td><%=m.getEnrollDate() %></td>
	                    <td><button type="button" class="btn btn-danger btn-sm" onclick="confirmDelete()">탈퇴</button></td>
	                </tr>
            	<%} %>
            <%} %>
            </tbody> 
        </table>
        <br>
        
        <script>
        // 탈퇴 확인 메세지
        function confirmDelete(){
        	var result = window.confirm("정말 탈퇴처리 하시겠습니까?");
        	
        	if(result){ // 확인을 누르면 회원 탈퇴처리
        		
        		$(".member-list>tbody>tr").click(function(){
     	           
	            	var mno = $(this).children().eq(0).text(); // 회원아이디
	            	
	            	location.href = "<%=contextPath %>/delete.me?mno=" + mno;
        	
        		});
        	}
        };
        
        </script>
        
       <!-- 페이징 -->
       
       <%if(request.getAttribute("keyword")==null) {%><!-- 검색어가 없는 경우 -->
       
        <div class="paging-area text-center">
        	<div class="btn-group btn-group-sm">
			<%if(pi.getCurrentPage()!= 1){ %>
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=<%=pi.getCurrentPage()-1%>'">이전</button>
			<%} %>
			
			<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
				<!-- 내가 보고있는 페이지 버튼은 비활성화 하기  -->
				<%if(i != pi.getCurrentPage()){ %>
					<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=<%=i%>';"><%=i %></button>
				<%}else{ %>
					<button class="btn btn-warning" disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=<%=pi.getCurrentPage()+1%>'">다음</button>
			<%} %>
			</div>
		</div>
		
		<%}else {%><!-- 검색어가 있는 경우 -->
		
		<div class="paging-area text-center">
        	<div class="btn-group btn-group-sm">
			<%if(pi.getCurrentPage()!= 1){ %>
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/searchMember.ma?currentPage=<%=pi.getCurrentPage()-1%>&searchBy=<%=request.getAttribute("searchBy")%>&keyword=<%=request.getAttribute("keyword")%>'">이전</button>
			<%} %>
			
			<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
				<!-- 내가 보고있는 페이지 버튼은 비활성화 하기  -->
				<%if(i != pi.getCurrentPage()){ %>
					<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/searchMember.ma?currentPage=<%=i%>&searchBy=<%=request.getAttribute("searchBy")%>&keyword=<%=request.getAttribute("keyword")%>';"><%=i %></button>
				<%}else{ %>
					<button class="btn btn-warning" disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if((!list.isEmpty()) && pi.getCurrentPage() != pi.getMaxPage()){ %><!-- 조회결과 없으면 다음버튼 안보이게 -->
				<button class="btn btn-warning" onclick="location.href='<%=contextPath%>/searchMember.ma?currentPage=<%=pi.getCurrentPage()+1%>&searchBy=<%=request.getAttribute("searchBy")%>&keyword=<%=request.getAttribute("keyword")%>'">다음</button>
			<%} %>
			<!-- 검색 초기화버튼 -->
				<button class="btn btn-info" onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=1'">전체보기</button>
			</div>
		
		</div>
		
		
		<%} %>
    
    </div>
<br><br><br><br>
<br><br>
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>