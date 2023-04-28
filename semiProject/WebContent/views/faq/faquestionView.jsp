<%@page import="com.kh.common.model.vo.pageInfo"%>
<%@page import="com.kh.question.model.vo.Question"%>
<%@page import="com.kh.faq.model.vo.FAQ"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
    	ArrayList<Question> qlist =(ArrayList<Question>)request.getAttribute("qlist");
    	pageInfo pi = (pageInfo)request.getAttribute("pi");    	
    	
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
            margin-top: 50px;
            min-height:100%;
        	position :relative;
        }
        .outer>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(247, 195, 127);
            width: 600px;
            margin:auto;
            text-align:center;
        }
        thead>tr{
        border-top: 1px solid black; 
        border-bottom: 1px solid black;
        }
        .faq-area,.question-area{           
           width: 700px;
        }       
        .tr1:hover{
            background-color: rgb(234, 210, 179);
        }
        .questionTr1:hover{
        	background-color: rgb(234, 210, 179);
        }
       
         #tr2{
            background-color: rgb(245, 225, 198);
            display: none;
        }
        
        .div1{
            border: 1px solid black;
            width: 500px;
            height: 200px;
            background-color: white; 
        }
        .modal-header>h4{
        	text-align:center;
        	color:black;
        }
        
        #qtitle>input{
        	width:500px;
        }
        #tr3{
        background-color:rgb(245, 225, 198);
        display: none;
        width:700px;
        }
        #tr4{
        background-color:  rgb(244, 196, 133);
        width:600px;
        
        }
        .question-area>tbody{width:700px;       	
        }
        #search-area{float: right;
        }
       
               
    </style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
	<br>
    <div class="outer">
        <h2 align="center">FAQ</h2>
        <br>
        <div align="center">
        <%if(loginUser !=null && loginUser.getUserId().equals("admin")) {%>
		        <!-- Button to Open the Modal -->
		<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-secondary">
		  자주묻는 질문 작성
		</button>
		
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title" align="center">문의글 작성</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		       <form action="<%=contextPath %>/insert.fo" method="post" >
		      		  <table id="faq-table">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td><input type="text"  name="title" placeholder="제목입력" required></td>
                        
                            </tr>
                            <tr><td height="20"> </td></tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea rows="10" cols="47" name="content"></textarea></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2" align="center"><button type="submit" class="btn btn-success">등록</button></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </tbody>
                    </table>	 
		       </form>
		      </div>
		
		
		    </div>
		  </div>
		</div>
            
            <%} %>
        </div>
         
        <br>
        <table align="center" class="faq-area" >
            <thead>
                <tr align="center">
                    <th colspan="2">자주묻는 질문</th>
                </tr>
            </thead>
            <tbody>
            <%if(list.isEmpty()){ %>
                <tr>
                	<td>공지게시글이 없습니다.</td>
                </tr>
                
                <%}else{ %>
                <%for(FAQ f :list){ %>
                <tr class="tr1">
                    <td align="center"><%=f.getFaqNo() %></td>
                    <td align="center" width=""><%=f.getFaqTitle() %></td>
                    <%if(loginUser !=null && loginUser.getUserId().equals("admin")) {%>
                    <td width="100"><a href="<%=contextPath%>/delete.fo?ffo=<%=f.getFaqNo()%>"class="btn btn-danger">삭제하기</a></td>  
                    <%} %>
                </tr>
                
                <tr id="tr2">
                    <td colspan="3" id="td1" align="center">
                        <br>                                           
                        <div class="div1">
                            <%=f.getFaqContent() %>
                        </div> 
                        <br><br>                     
                    </td>
                </tr>
                <%} %>
                <%} %>
            </tbody>
        </table>
        <br><br><br>
        
                <div align="center">
        <%if(loginUser !=null) {%>
		        <!-- Button to Open the Modal -->
		<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-secondary">
		  문의글 작성
		</button>
		
		<!-- The Modal 2 -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header 2 -->
		      <div class="modal-header">
		        <h4 class="modal-title" align="center">문의글 작성</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body 2 -->
		      <div class="modal-body">
		       <form action="<%=contextPath %>/insert.qo" method="post" >
		      		  <table id="question-table">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td><input type="text"  name="title" placeholder="제목입력" required></td>
                        
                            </tr>
                            <tr><td height="20"> </td></tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea rows="10" cols="47" name="content"></textarea></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2" align="center"><button type="submit" class="btn btn-success">등록</button></td>
                            </tr>
                            <tr><td height="20"> </td></tr>
                        </tbody>
                    </table>	 
		       </form>
		      </div>
		
		
		    </div>
		  </div>
		</div>
            
            <%} %>
        </div>
<!-- --------------------------------------------------고객문의-------------------------------------- -->       
        <br>
        <table align="center" class="question-area">
        
        	<thead>
        		<tr align="center">
        		
                    <th colspan="5">고객문의</th>
                </tr>
        	</thead>
        	<tbody>
        	 <tr>
                  <th class="search_input" colspan="5">
                    	<form action="search.qo" method="get" id="search-area">
                    	<input type="hidden" name="currentPage" value="<%=pi.getCurrentPage()%>">
                    		<select name="category" id="category">
                                <option value="제목">제목</option>
                                <option value="내용">내용</option>
                                <option value="작성자">작성자</option>
                            </select>
                            <input type="text" name="searchText" placeholder="검색어 입력" id="question_search">
                            <button>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="17" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                  </svg>
                            </button>
                        </form>
                  </th>
             </tr>
             
             
            
             <%if(qlist.isEmpty()){ %>
                <tr>
                	<td>공지게시글이 없습니다.</td>
                </tr>
                
                <%}else{ %>
             <%for(Question q:qlist){ %>
        	<tr class="questionTr1">
        		<td width="50" align="center" id="questionNo"><%=q.getQuestionNo() %></td>
        		<td width="400"><%=q.getQuestionTitle() %></td>
        		<td align="center"><%=q.getQuestionWriter() %></td> 
        		<td align="center"><%=q.getModifyDate() %></td>
        		
        	</tr>
             
             <%} %>
            <%}%>
            
            </tbody>
            <tfoot>
            <tr align="center" class="paging-area" >                     
            <td align="center" colspan="4">
            	 <br><br>
					<%if(pi.getCurrentPage()!=1){ %>
						<button onclick="location.href='<%=contextPath%>/list.fo?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
					<%} %>
					<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){ %>
						<!-- 내가보고있는 페이지 버튼은 비활성화 하기 -->
						<%if(i != pi.getCurrentPage()){ %>
						<button onclick="location.href='<%=contextPath%>/list.fo?currentPage=<%=i%>';"><%=i %></button>
						
						<%}else{ %><!-- 내가 보고있는 페이지와 페이징바 버튼의 수가 같다면 i와 currentPage -->
							<button disabled><%=i %></button>
						<%} %>
						
					<%} %>
					
					<%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
						<button onclick="location.href='<%=contextPath%>/list.fo?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
					<%} %>
			
				
			</td>
            </tr>
        	</tfoot>
        </table>
         <br><br><br>
    </div>
   
    
    <script>
        
        $(".tr1").click(function(){
             var $tr = $(this).next(); 
             if($tr.css("display") == "none"){
                 $(this).siblings("#tr2").slideUp();
                 $tr.slideDown(0);
             }else{
                 $tr.slideUp(0);
             }
         });
        $(".faq-area>tbody>tr").click(function(){
        	//console.log($(this).children().eq(0).text());
        	var ffo =$(this).children().eq(0).text();       	       	
        });
        
        
       
        $(".question-area>tbody>.questionTr1").click(function(){
        	//console.log($(this).children().eq(0).text());
        	var qqo =$(this).children().eq(0).text();
        	location.href= '<%=contextPath%>/detail.qo?qqo='+qqo;
        	
        })
 
    </script>
</body>
<br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>

</html>