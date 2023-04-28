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
    <style>
        .member-wrap *{
            box-sizing: border-box;
        }
        /*검색창 스타일*/
        .search-area{
            width: 70%;
            height: 8%;
            margin: auto;
        }
        .member-wrap{
            width: 1000px;
            height: 600px;
            margin: auto;
            min-height:100%;
        	position :relative;
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
        thead td{
            text-align: center;
        }
        
        .member-wrap table td{
           text-align: center;
            
        }
       /* 제목스타일 */
       .member-wrap>#title{
        text-align: center;
        margin: auto;
        padding: 10px;
        background-color: rgba(247, 222, 0, 0.781);
        color: white;
        font-size: 20px;
        font-weight: 600;
        border-radius: 10px;
       }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div class="member-wrap">
        <br><br>

        <div id="title">
            회원목록
        </div>
        <br><br>

      <div class="search-area">
        <form action="searchMember.ma" method="get" id=search-form onsubmit="return checkBlank()">
        <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage()%>">
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
                <input type="submit" value="검색"></input>
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

        <br>

      <table class="member-list table-striped" align="center">
            <thead>
                <tr>
                    <td width="80">아이디</td>
                    <td width="80">이름</td>
                    <td width="150">연락처</td>
                    <td width="150">이메일</td>
                    <td width="400">주소</td>
                    <td width="80">생일</td>
                    <td width="80">경고횟수</td>
                    <td width="100">가입일</td>
                    <td width="80">탈퇴처리</td>
                </tr>
            </thead>
            <tbody>
            <%if(list.isEmpty()){ %>
            	<tr>
            		<td colspan="9">조회된 회원이 없습니다.</td>
            	</tr>
            <%}else{ %>
            	<%for(Member m : list){ %>
	            	<tr>
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
        <div class="paging-area" align="center" >
			<%if(pi.getCurrentPage()!= 1){ %>
				<button onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=<%=pi.getCurrentPage()-1%>'">이전</button>
			<%} %>
			
			<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
				<!-- 내가 보고있는 페이지 버튼은 비활성화 하기  -->
				<%if(i != pi.getCurrentPage()){ %>
					<button onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=<%=i%>';"><%=i %></button>
				<%}else{ %>
					<button disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				<button onclick="location.href='<%=contextPath%>/memberManagement.ma?currentPage=<%=pi.getCurrentPage()+1%>'">다음</button>
			<%} %>
		</div>
    
    </div>
<br><br><br><br>
<br><br>
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>