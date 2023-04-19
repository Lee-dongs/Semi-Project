<%@page import="com.kh.faq.model.vo.FAQ"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
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
        }
        .outer>h2{
            border-style: solid white;
            border-radius: 120px;
            background-color: rgb(247, 195, 127);
            width: 600px;
            margin:auto;
            text-align:center;
        }
        #faq-area{
           border-top: 1px solid black; 
           width: 700px;
        }
        #faq-area th{
            border-bottom: 1px solid black;
        }
        .tr1:hover{
            background-color: rgb(234, 210, 179);
        }
              
         
         #tr2{
            background-color: rgb(245, 225, 198);
            display: none;
        }
         #div1{
            border: 1px solid black;
            width: 500px;
            height: 30px;
            background-color: white;
        }
        #div2{
            border: 1px solid black;
            width: 500px;
            height: 200px;
            background-color: white; 
        }
        .modal-header>h4{
        	text-align:center;
        	color:black;
        }
        #faq-table input{
        	width:400px;
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
		  문의글 작성
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
        <table align="center" id="faq-area" >
            <thead>
                <tr align="center">
                    <th colspan="2">고객문의</th>
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
                    
                </tr>
                
                <tr id="tr2">
                    <td colspan="2" id="td1" align="center">
                        <br>
                        <div id="div1">
                            <%=f.getFaqTitle() %>
                        </div>
                        <br>
                        <div id="div2">
                            <%=f.getFaqContent() %>
                        </div>   
                        <br><br>                     
                    </td>
                </tr>
                <%} %>
                <%} %>
            </tbody>
        </table>
    </div>
    
    <script>
        $(function(){
            $(".tr1").click(function(){

				
                var $tr = $(this).next(); 
                if($tr.css("display") == "none"){
                    $(this).siblings("#tr2").slideUp();
                    $tr.slideDown(0);
                }else{
                    $tr.slideUp(0);
                }
            })
        })
    </script>
</body>
</html>