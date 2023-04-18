<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.mainPage.model.vo.Cafe"%>
    <% ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
       String location = (String)request.getAttribute("location");
       String status = (String)request.getAttribute("status");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #outer1{
            border: 1px solid black;
            width: 1200px;
            height: 500px;
            margin: auto;
            position: relative;
        }

        #outer1>div{
            position: absolute;
            width: 100%;
            height: 70%;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #outer1>div div{
            box-sizing: border-box;
            float: left;
        }
        
        #sortDiv, #cafeListDiv, #nextDiv{
            height: 100%;
            position: relative;
        }

        /* ========== 정렬 버튼 ========== */
        #sortDiv{
            width: 13%;
        }

        #cafeListDiv{
            width: 77%;
        }

        #nextDiv{
            width: 10%;
        }

        #sortDiv>div{
            width: 80%;
            height: 40%;
            position: absolute;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #scoreDiv, #reviewDiv{
            width: 100%;
            height: 50%;
        }

        #sortDiv button{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            font-weight: 800;
            font-size: 15px;
            background-color: orange;
        }

        #sortDiv button:hover{
            background-color: coral;
            color: white;
        }

        /* ========== 카페 리스트 ========== */
        #cafeListDiv>div{
            width: 25%;
            height: 100%;
            position: relative;
        }

        #cafeListDiv>div>div{
            background-color: antiquewhite;
            width: 80%;
            height: 80%;
            position: absolute;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #cafeImgDiv{
            width: 100%;
            height: 70%;
            box-sizing: border-box;
        }

        #cafeInfoDiv{
            width: 100%;
            height: 30%;
        }

        #cafeImgDiv>img{
            width: 100%;
            height: 100%;
        }

        /* ========== next btn ========== */
        #nextDiv>div{
            width: 60%;
            height: 15%;
            position: absolute;
            margin : auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #nextDiv button{
            width: 100%;
            height: 100%;
        }


    </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="outer1">
        <div>
            <div id="sortDiv"> <!--카페 정렬 버튼 위치할 div-->
                <div>
                    <div id="scoreDiv">
                        <button onclick="sortByScore()">평점순</button>
                    </div>
                    <div id="reviewDiv">
                        <button onclick="sortByReview()">리뷰순</button>
                    </div>
                </div>
            </div>

            <div id="cafeListDiv"> <!--카페 리스트 위치할 div-->
                <%for(int i=0; i<4; i++){ %>
                	<div>
	                    <div>
	                        <div id="cafeImgDiv">
	                            <img src="resources/images/농담곰.jpg" alt="">
	                            <input type="hidden" name="address" value="<%=list.get(i).getAddress() %>">
	                        </div>
	                        <div id="cafeInfoDiv">
	                            	이름(임시) : <%=list.get(i).getCafeName() %> <br>
	                            	평점(임시) : <%=list.get(i).getScore() %> <br>
	                            	리뷰개수(임시) : <%=list.get(i).getReplyCount() %>
	                        </div>
	                    </div>
	                </div>
                <%} %>
            </div>
			<div id="prevDiv">
				<div>
					<button onclick="prevPage()" disabled="true">prev</button>
					<input class="currentPage" type="hidden" name="pageCount" value=1>
				</div>
			</div>
            <div id="nextDiv"> <!--다음 버튼 위치할 div-->
                <div>
                    <button onclick="nextPage()">next</button>
                    <input class="currentPage" type="hidden" name="pageCount" value=1>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br>
    
    <script>
    	function sortByScore(){ //평점순 버튼을 클릭
    		location.href = "<%=contextPath%>/sbScore.cf?location="+"<%=location%>";
    	}
    	
    	function sortByReview(){ //리뷰순 버튼을 클릭
    		location.href = "<%=contextPath%>/sbReview.cf?location="+"<%=location%>";
    	}
    
    	$("#cafeListDiv img").click(function(){//이미지 클릭시 주소랑 같이 넘김
    		var address = $(this).next().val();
    		location.href = "<%=contextPath%>/detail.cf?add="+address;
    	});
    	
    	
    	function nextPage(){ //다음 페이지 처리
    		$("#prevDiv button").attr("disabled", false);
    		$.ajax({
    			url:"nextPage.cf",
    			data:{
    				pageCount : $(".currentPage").val(),   				
    			},
    			type : "get",
    			async: false,
    			success : function(result){
    				$(".currentPage").attr("value", result); //currentPage를 result로 바꿈
    				var list = newCafeList();
    				var str="";
    				for(var i=result*4-4; i<result*4; i++){
    					if(list[i] != null){
        					str += "<div>"
      						  +"<div>"
      						  +"<div id='cafeImgDiv'>"
      						  +"<img src='resources/images/농담곰.jpg'>"
      						  +"<input type='hidden' name='address' value='"+list[i].address+"'>"
      						  +"</div>"
      						  +"<div id='cafeInfoDiv'>"
      						  +"이름(임시) : " + list[i].cafeName + "<br>"
      						  +"평점(임시) : " + list[i].score + "<br>"
      						  +"리뷰개수(임시) : " + list[i].replyCount
      						  +"</div>"
      						  +"</div>"
      						  +"</div>"
    					}else{
    						$("#nextDiv button").attr("disabled", true);
    					}
    				}
    				$("#cafeListDiv").html(str);
    			}
    		});
    	}
    	
    	function prevPage(){ //이전 페이지 처리
    		$("#nextDiv button").attr("disabled", false);
    		$.ajax({
    			url:"prevPage.cf",
    			data:{
    				pageCount : $(".currentPage").val(),   				
    			},
    			type : "get",
    			async: false,
    			success : function(result){
    				$(".currentPage").attr("value", result); //currentPage를 result로 바꿈
    				if(result == 1){
    					$("#prevDiv button").attr("disabled", true);
    				}
    				var list = newCafeList();
    				var str="";
    				for(var i=result*4-4; i<result*4; i++){
    					str += "<div>"
    						  +"<div>"
    						  +"<div id='cafeImgDiv'>"
    						  +"<img src='resources/images/농담곰.jpg'>"
    						  +"<input type='hidden' name='address' value='"+list[i].address+"'>"
    						  +"</div>"
    						  +"<div id='cafeInfoDiv'>"
    						  +"이름(임시) : " + list[i].cafeName + "<br>"
    						  +"평점(임시) : " + list[i].score + "<br>"
    						  +"리뷰개수(임시) : " + list[i].replyCount
    						  +"</div>"
    						  +"</div>"
    						  +"</div>"
    				}
    				$("#cafeListDiv").html(str);
    			}
    		});
    	}
    	
    	function newCafeList(){ //새로운 카페 리스트 띄우기
    		var cafeList;
    		$.ajax({
    			url:"newList.cf",
    			data:{
    				location : "<%=location%>",
    				status : "<%=status%>"
    			},
    			type : "get",
    			async: false,
    			success : function(list){
    				cafeList = list;
    			}
    		});
    		
    		return cafeList;
    	}
    </script>
</body>
</html>