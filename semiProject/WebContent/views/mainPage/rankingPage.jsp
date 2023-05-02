<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.mainPage.model.vo.*"%>
    <% ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
       String location = (String)request.getAttribute("location");
       String status = (String)request.getAttribute("status");
       ArrayList<CafeAttachment> cfatList = (ArrayList<CafeAttachment>)request.getAttribute("cfatList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #outer1{
            border: 2px solid orange;
            width: 1200px;
            height: 500px;
            margin: auto;
            position: relative;
            min-height:100%;
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

        .cafeImgDiv{
            width: 100%;
            height: 70%;
            box-sizing: border-box;
        }

        .cafeInfoDiv{
            width: 100%;
            height: 30%;
        }
        
        .cafeInfoDiv>p{
        	font-size : 20px;
        	text-align : center;
        	font-weight : 500;
        	color : orange;
        	-webkit-text-stroke: 0.5px black;
        }
        
        .cafeImgDiv>img{
            width: 100%;
            height: 100%;
        }
        
        .cafeImgDiv>img:hover{
        	cursor : pointer;
        }

        /* ========== next btn ========== */
        #nextDiv>div{
            width: 60%;
            height: 15%;
            position: absolute;
            margin : auto;
            top: -300px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #nextDiv button{
            width: 100%;
            height: 100%;
        }

        #prevDiv>div{
            width: 60%;
            height: 15%;
            margin-top: 100px;
        }

        #prevDiv button{
            width: 70px;
            height: 53px;
        }
        
        .star-ratings {
  			color: #aaa9a9; 
			position: relative;
			unicode-bidi: bidi-override;
			width: max-content;
			-webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
			-webkit-text-stroke-width: 1.3px;
			-webkit-text-stroke-color: #2b2a29;
			margin-left: 50px;
		}
 
		.star-ratings-fill {			
			color: #fff58c;
			padding: 0;
			position: absolute;
			z-index: 1;
			display: flex;
			top: 0;
			left: 0;
			overflow: hidden;
			-webkit-text-fill-color: gold;
		}
		 
		.star-ratings-base {
			z-index: 0;
			padding: 0;
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
            <%int end = 0;%>
            <%if(cfatList.size() <=4) {%>
            	<%end = cfatList.size(); %>
            <%}else{ %>
            	<%end = 4; %>
            <%} %>
                <%for(int i=0; i<end; i++){ %>
                	<div>
	                    <div>
	                        <div class="cafeImgDiv">
	                        	<%for(int j=0; j<cfatList.size(); j++) {%>
	                        		<%if(cfatList.get(j).getCafeRefNo() == list.get(i).getCafeNo()) {%>
	                        			<img src="<%=cfatList.get(j).getNewPath()%>">
	                        		<%} %>
	                        	<%} %>
	                            <input type="hidden" name="address" value="<%=list.get(i).getAddress() %>">
	                        </div>
	                        <div class="cafeInfoDiv">
	                            	<p><%=list.get(i).getCafeName() %></p>
	                            	
	                            	<div class="star-ratings">
                                    	<div class="star-ratings-fill space-x-2 text-lg" 
                                    	style="width:400px;">
                                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                        </div>
                                        <div class="star-ratings-base space-x-2 text-lg">
                                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                        </div>
                                    </div>
	                        </div>
	                    </div>
	                </div>
                <%} %>
            </div>
			<div id="prevDiv">
				<div>
					<button onclick="prevPage()" disabled="true" class="btn btn-warning">prev</button>
					<input class="currentPage" type="hidden" name="pageCount" value=1>
				</div>
			</div>
            <div id="nextDiv"> <!--다음 버튼 위치할 div-->
                <div>
                    <button onclick="nextPage()" class="btn btn-warning">next</button>
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
    
    	$(".cafeImgDiv>img").click(function(){//이미지 클릭시 주소랑 같이 넘김
    		var address = $(this).next().val();
    		location.href = "<%=contextPath%>/detail.cf?location="+"<%=location%>&&add="+address;
    	});
    	
    	$(function(){ //별점 부여
    		var list = newCafeList();
			var k = 0;
    		for(var i=0; i<4; i++){
				var size = list[0][i].score * 20 + 1.5;
				$(".star-ratings-fill:eq("+k+")").width(size+"%");
				k = k+1;			
    		}
    	});
    	
    	$(function(){
    		<%if(cfatList.size() <= 4){%>
    			$("#nextDiv button").attr("disabled", true);
    		<%}%>
    	})
    	
    	function score(){
    		str = "";
    		str += "<div class='star-ratings'>"
    			+"<div class='star-ratings-fill space-x-2 text-lg' style='width:400px'>"
    			+"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
    			+"</div>"
    			+"<div class='star-ratings-base space-x-2 text-lg'>"
    			+"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
    			+"</div>"
    			+"</div>"

    		return str;
    	}
    		
    	
    	var list = newCafeList(); //화면에 새로 보여줄 카페 리스트 가져오기
    	function nextPage(){ //다음 페이지 처리
    		$("#prevDiv button").attr("disabled", false);
    		$.ajax({
    			url:"nextPage.cf", //현재 pageCount의 데이터를 보내 +1을 하여 돌려줌
    			data:{
    				pageCount : $(".currentPage").val(),  //페이지 정보를 전달
    			},
    			type : "get",
    			success : function(result){
    				$(".currentPage").attr("value", result); //currentPage를 result로 바꿈

					var newPath; //카페 사진 가져올 경로
    				var str="";
    				for(var i=result*4-4; i<result*4; i++){
    					if(list[0][i] != null){ //새로운 경로 찾기
    						for(var j=0; j<list[1].length; j++){
    							if(list[1][j].cafeRefNo == list[0][i].cafeNo){
    								var newPath = list[1][j].newPath;
    							}
    						}
        					str += "<div>"
      						  +"<div>"
      						  +"<div class='cafeImgDiv'>"
      						  +"<img src='"+ newPath +"'>"
      						  +"<input type='hidden' name='address' value='"+list[0][i].address+"'>"
      						  +"</div>"
      						  +"<div class='cafeInfoDiv'>"
      						  +"<p>" + list[0][i].cafeName + "</p>"
      						  +score() + "<br>"
      						  +"</div>"
      						  +"</div>"
      						  +"</div>"
    					}else{
    						$("#nextDiv button").attr("disabled", true); //더이상 보여줄 리스트가 없으면 다음 페이지 disabled
    					}
    				}
    				if(list[0].length == result*4){
    					$("#nextDiv button").attr("disabled", true); //리스트의 크기가 4배수면 다음 페이지 disabled
    				}
    				$("#cafeListDiv").html(str);
    				
					var k = 0;
    				for(var j=result*4-4; j<result*4; j++){ //별점 사이즈 조정하기(* .html로 새로이 갱신한 뒤에 해야함)
    					var size = list[0][j].score * 20 + 1.5;
    					$(".star-ratings-fill:eq("+k+")").width(size+"%");
    					k = k+1;
    				}
    				
    				$(".cafeImgDiv>img").click(function(){ //이미지 클릭하면 address값에 맞는 페이지 띄워줌
    					var address = $(this).next().val();
    					location.href = "<%=contextPath%>/detail.cf?add="+address;
    				});
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
    			success : function(result){
    				$(".currentPage").attr("value", result); //currentPage를 result로 바꿈
    				if(result == 1){
    					$("#prevDiv button").attr("disabled", true);
    				}

					var newPath;
    				var str="";
    				for(var i=result*4-4; i<result*4; i++){
						for(var j=0; j<list[1].length; j++){
							if(list[1][j].cafeRefNo == list[0][i].cafeNo){
								var newPath = list[1][j].newPath;
							}
						}
    					str += "<div>"
    						  +"<div>"
    						  +"<div class='cafeImgDiv'>"
    						  +"<img src='"+newPath+"'>"
    						  +"<input type='hidden' name='address' value='"+list[0][i].address+"'>"
    						  +"</div>"
    						  +"<div class='cafeInfoDiv'>"
      						  +"<p>" + list[0][i].cafeName + "</p>"
    						  +score() + "<br>"
    						  +"</div>"
    						  +"</div>"
    						  +"</div>"
    				}
    				$("#cafeListDiv").html(str);
    				
					var k = 0;
    				for(var j=result*4-4; j<result*4; j++){
    					var size = list[0][j].score * 20 +1.5;
    					$(".star-ratings-fill:eq("+k+")").width(size+"%");
    					k = k+1;
    				}
    				
    				$(".cafeImgDiv>img").click(function(){ 
    					var address = $(this).next().val();
    					location.href = "<%=contextPath%>/detail.cf?add="+address;
    				});
    			}
    		});
    	}
    	
    	function newCafeList(){ //새로운 카페 리스트 띄우기
    		var arr = [];
    		$.ajax({
    			url:"newList.cf",
    			data:{
    				location : "<%=location%>",
    				status : "<%=status%>" // 현재 평점순인지 리뷰순인지 기본인지 체크 할 상태값
    			},
    			type : "get",
    			async: false, //순서를 보장해야하기 때문에 동기식으로 처리
    			success : function(list){
    				arr[0] = list[0];
    				arr[1] = list[1];
    			}
    		});
    		
    		return arr;
    		
    	}

    </script>
    <br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>