<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map.Entry, java.util.Iterator, com.kh.mainPage.model.vo.Cafe,
    java.util.ArrayList, com.kh.mainPage.model.vo.*, com.kh.member.model.vo.Member"%>
    <%
    	Iterator<Entry<String, Integer>> menu = (Iterator<Entry<String, Integer>>)request.getAttribute("menu");
    	Cafe cafe = (Cafe)request.getAttribute("cafe");
    	ArrayList<CafeAttachment> detailAtList = (ArrayList<CafeAttachment>)request.getAttribute("detailAtList");
    	String add = (String)request.getAttribute("add");
    	String contextPath = request.getContextPath();
    	String alertMsg = (String)session.getAttribute("alertMsg");
    	Member m = (Member)request.getSession().getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <!-- 부트스트랩 CDN -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
             /*구글 웹 폰트 CDN*/
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
        body{
        /*
            background-image: url('resources/images/사진.jpg');
            background-repeat : no-repeat;
           object-fit : fill;    
        */
        }
        *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        #detailHead{
            width: 100%;
            height: 310px;
            
        }

        #detailHead div{
            width: 25%;
            height: 100%;
            float: left;
            box-sizing: border-box;     
        }

        #detailHead img{
            height: 100%;
            width: 100%;
            box-sizing: border-box;
        }



        /* ==========body부분========== */

        #detail1{
            width: 55%;
            height: 160px;
            margin-left: 180px;
            margin-top: 60px;
        }

        #detail1_1{
            width: 100%;
            height: 150px;

        }

        #detail1>div>div{
            float: left;
            width: 50%;
            height: 100%;
            box-sizing: border-box;
        }

        /* ==========오른쪽에 있는 버튼 부분======== */
        #btnDiv1{
            width: 200px;
            height: 100px;

            margin-left: 200px;
            margin-top: 40px;
        }

        #btnDiv1>div{
            width: 50%;
            height: 100%;

            float: left;
            box-sizing: border-box;
        }

        #reviewIcon{
            width: 100%;
            height: 80%;
            position: relative;
        }

        #reviewIcon>img{
            width: 50%;
            height: 60%;
            position: absolute;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #reviewIconText{
            width: 100%;
            height: 20%;
            text-align: center;
        }
        
        #reviewDiv:hover{
        	cursor : pointer;
        	color : orange;
        }

        #scoreIcon{
            width: 100%;
            height: 80%;
            position: relative;
        }
        
        #scoreDiv:hover{
        	cursor : pointer;
			color : orange;
        }

        #scoreIcon>img{
            width: 50%;
            height: 60%;
            position: absolute;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #scoreIconText{
            width: 100%;
            height: 20%;
            text-align: center;
        }

        /* ==============오른쪽 버튼부분 끝=============== */

        #title_score{
            width: 100%;
            height: 70%;
            box-sizing: border-box;
        }
        
        #title_score>div{
            float: left;
            margin-top: 60px;
            font-size: 25px;
        }

        /* ===================상단 제목 별점================ */

        #detail_title{
           margin-right: 10px;
           width : 100px;
           font-weight : 900;
        }

        #detail_score{
            color: orange;
        }

        /* =============상단 제목 별점 끝================= */

        /* =================조회수 리뷰수 별점준 사람 수 시작 =============== */
        
        #count_reply_review{
            width: 100%;
            height: 30%;

            box-sizing: border-box;
        }

        #count_reply_review>div{
            float: left;

        }

        #detail_count{
            width: 20%;
            height: 100%;
        }

        #detail_count>div{
            float: left;
        }

        #detail_count>div>img{
            width: 20px;
            height: 20px;
            margin-top: 11px;
        }

        #temporary1{
            margin-top: 10px;
            margin-left: 4px;
        }

        #detail_reviewCount{
            width: 15%;
            height: 100%;
        }  

        #detail_reviewCount>div{
            float: left;
        }

        #detail_reviewCount>div>img{
            width: 20px;
            height: 20px;
            margin-top: 11px;
        }

        #temporary2{
            margin-top: 10px;
            margin-left: 4px;
        }

        #detail_scoreCount{
            width: 15%;
            height: 100%;
        }

        #detail_scoreCount>div{
            float: left;
        }

        #detail_scoreCount>div>img{
            width: 20px;
            height: 20px;
            margin-top: 11px;
        }

        #temporary3{
            margin-top: 10px;
            margin-left: 4px;
        }

        /* =================조회수 리뷰수 별점준 사람 수 끝 =============== */

        /* =================상세 내용 시작===================== */
        
        #bodyContent{
            width: 40%;
            height: 450px;
            margin-left: 180px;
        }

        #bodyContent>div{
            float: left;
            box-sizing: border-box;
        }

        #category{
            width: 20%;
            height: 100%;

        }

        #content{
            width: 80%;
            height: 100%;

        }
        
        #menu{

            height: 250px;
        }

        #menu>div>div{
            float: left;
        }

        .food{
            width: 230px;
            border: 1px solid white;
        }

        .price{
            text-align: right;
            border: 1px solid white;
            width: 80px;
        }
        /* =============상세내용끝=============== */

        /* ================지도==================== */
        #map{
            width: 400px;
            height: 400px;
            border: 1px solid blue;
            margin-left: 250px;
        }

        #map, #bodyContent{
            float: left;
        }

        #bb{
            height: 460px;
        }

        #hrDiv{
            width: 55%;
            margin-left: 180px;
        }
        /* ===========지도 끝============== */

        /* ============댓글 시작========== */
        #replyDiv{
            width: 55%;
            height: auto;
            margin-left: 180px;

        }

        #replyDiv>p{
            font-size: 25px;
            color: gray;
        }
        
        #replyDiv>div{
            overflow: auto;        
        }

        #replyDiv>div>div{
            float: left;
            box-sizing: border-box;
        }

        .userInfo{
            width: 30%;
            height: 200px;
        }

        .replyContent{
            height: auto;
            width: 70%;
            white-space:pre-line;
            padding-bottom: 15px;
            padding-top : 20px;
        }
        
        .report{
        	margin-left : 450px;
        }
        
        /*=================== 댓글 끝 ==========================*/
        
        /*===================별점주는 모달창 작업=================*/
		#modal{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		}
		
		#modal2{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		}
		
		.m_head{
            height: 50px;
            margin-top: -60px;
        }

        .close_btn{
            width: 100%;
            text-align: right;
            padding-right: 20px;
            font-size: 35px;
        }
        
        .close_btn:hover{
        	cursor : pointer;
        }

		.modal_content{
		  width:400px; height:600px;
		  background:#fff; border-radius:10px;
		  position:relative; top:50%; left:50%;
		  margin-top:-300px; margin-left:-200px;
		  text-align:center;
		  box-sizing:border-box; padding:74px 0;
		  line-height:23px;
		}
		
		.modal_content>form>div>div{
			float:left;
		}
        .modal_content>form>div{
            height: 50px;
            margin-bottom: 50px;
        }
        .category{
            width: 100px;
            height: 100%;
            font-size: 35px;
            line-height: 40px;
            text-align: right;
            font-weight: 900;
            margin-left: 40px;
            text-align: center;
        }
		
       .star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 2.25rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;

            height: 100%;
            margin-left: 40px;
            
             }
            
            .star-rating input {
            display: none;
            }
            
            .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 2.3px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
            }
            
            .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
            }
            
            .star-rating label:hover,
            .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
            }
        	
        	#reviewText{
        		margin-top : 30px;
        		resize : none;
        	}

    </style>
</head>
<body>
    <div id="detailHead">
        <div><img src="<%=detailAtList.get(0).getNewPath() %>"></div>       
        <div><img src="<%=detailAtList.get(1).getNewPath() %>"></div>
        <div><img src="<%=detailAtList.get(2).getNewPath() %>"></div>
        <div><img src="<%=detailAtList.get(3).getNewPath() %>"></div>
    </div>

    <div id="detailBody">
        <div id="detail1">
            <div id="detail1_1">
                <div>
                    <div id="title_score"> <!-- 제목, 점수 영역 div-->
                        <div id="detail_title"> <!--제목-->
                            <%=cafe.getCafeName() %>
                        </div>
                        <div id="detail_score"> <!--평균점수-->
                            <%=cafe.getScore() %>
                        </div>
                    </div>
                    <div id="count_reply_review"> <!-- 제목 밑에 있는 조회수, 리뷰수, 별점수 영역 div-->
                        <div id="detail_count"> <!--조회수-->
                            <div><img src="resources/images/조회수아이콘.png"></div>
                            <div id="temporary1"><%=cafe.getCount() %></div>
                        </div>
                        <div id="detail_reviewCount"> <!--리뷰개수-->
                            <div><img src="resources/images/리뷰아이콘.png"></div>
                            <div id="temporary2"><%=cafe.getReplyCount() %></div>
                        </div>
                        <div id="detail_scoreCount"> <!--별점 준 사람들 수-->
                            <div><img src="resources/images/별아이콘.png"></div>
                            <div id="temporary3"><%=cafe.getScoreCount() %></div>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="btnDiv1"> <!--오른쪽에 있는 리뷰, 별 아이콘 영역 div-->
                        <div id="reviewDiv">
                            <div id="reviewIcon">
                                <img src="resources/images/리뷰아이콘.png" alt="">
                            </div>
                            <div id="reviewIconText">
                                	리뷰쓰기
                            </div>
                        </div>	                      
                        <div id="scoreDiv">
                            <div id="scoreIcon">
                                <img src="resources/images/별아이콘.png" alt="">
                            </div>
                            <div id="scoreIconText">
                                	별점주기
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
    </div>
    <br>
    <div id="bb">
        <div id="bodyContent">
            <div id="category">
                <div>주소</div><br>
                <div>전화번호</div><br>
                <div>영업시간</div><br>
                <div>휴무일</div><br>
                <div>메뉴</div>
            </div>
            <div id="content">
                <div><%=cafe.getAddress() %></div><br>
                <div><%=cafe.getPhone() %></div><br>
                <div><%=cafe.getOperationTime() %></div><br>
                <div><%=cafe.getOffDay() %></div><br>
                <div id="menu">
                    <div>
                    	<%while(menu.hasNext()){ %>
                    		<%Entry<String, Integer> menuEntry = menu.next(); %>
                    		<div class="food">
                    			<%=menuEntry.getKey() %>
                    		</div>
                    		<div class="price">
                    			<%=menuEntry.getValue() %>원
                    		</div>
                    	<%} %>
                    </div>
                </div>
            </div>
        </div>
        <div id="map">
            지도들어갈곳
        </div>
    </div>

		
    <div id="replyDiv">
    	
    </div>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    
	<div id="modal">
		<div class="modal_content">
		    <div class="m_head">
                <div class="close_btn" id="close_btn">x</div>
            </div>
			<form action="<%=contextPath %>/evaluate.cf" method="post" onsubmit="return checkRating()">
				<div>
					<div class="category">맛</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
				        <label for="5-stars" class="star pr-4">★</label>
				        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
				        <label for="4-stars" class="star">★</label>
				        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
				        <label for="3-stars" class="star">★</label>
				        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
				        <label for="2-stars" class="star">★</label>
				        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
				        <label for="1-star" class="star">★</label>
				    </div>
				</div>
				
			    <div>
					<div class="category">가격</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars2" name="rating2" value="5" v-model="ratings"/>
				        <label for="5-stars2" class="star pr-4">★</label>
				        <input type="radio" id="4-stars2" name="rating2" value="4" v-model="ratings"/>
				        <label for="4-stars2" class="star">★</label>
				        <input type="radio" id="3-stars2" name="rating2" value="3" v-model="ratings"/>
				        <label for="3-stars2" class="star">★</label>
				        <input type="radio" id="2-stars2" name="rating2" value="2" v-model="ratings"/>
				        <label for="2-stars2" class="star">★</label>
				        <input type="radio" id="1-star2" name="rating2" value="1" v-model="ratings" />
				        <label for="1-star2" class="star">★</label>
				    </div>
				</div>
	
	            <div>
					<div class="category">분위기</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars3" name="rating3" value="5" v-model="ratings"/>
				        <label for="5-stars3" class="star pr-4">★</label>
				        <input type="radio" id="4-stars3" name="rating3" value="4" v-model="ratings"/>
				        <label for="4-stars3" class="star">★</label>
				        <input type="radio" id="3-stars3" name="rating3" value="3" v-model="ratings"/>
				        <label for="3-stars3" class="star">★</label>
				        <input type="radio" id="2-stars3" name="rating3" value="2" v-model="ratings"/>
				        <label for="2-stars3" class="star">★</label>
				        <input type="radio" id="1-star3" name="rating3" value="1" v-model="ratings" />
				        <label for="1-star3" class="star">★</label>
				    </div>
				</div>
	
	            <div>
					<div class="category">접근성</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars4" name="rating4" value="5" v-model="ratings"/>
				        <label for="5-stars4" class="star pr-4">★</label>
				        <input type="radio" id="4-stars4" name="rating4" value="4" v-model="ratings"/>
				        <label for="4-stars4" class="star">★</label>
				        <input type="radio" id="3-stars4" name="rating4" value="3" v-model="ratings"/>
				        <label for="3-stars4" class="star">★</label>
				        <input type="radio" id="2-stars4" name="rating4" value="2" v-model="ratings"/>
				        <label for="2-stars4" class="star">★</label>
				        <input type="radio" id="1-star4" name="rating4" value="1" v-model="ratings" />
				        <label for="1-star4" class="star">★</label>
				    </div>
				</div>
				<input type="hidden", name="cafeNo", value="<%=cafe.getCafeNo() %>">
				<input type="hidden", name="add", value="<%=add %>">
				<button type="submit" class="btn btn-success">확인</button>
                <button type="reset" class="btn btn-danger">초기화</button>
			</form>
			
	  	</div>
	</div>
	
	<form action="<%=contextPath %>/insert.cfre" method="post" onsubmit="return checkContent()">
		<div id="modal2">
			<div class="modal_content">
			    <div class="m_head">
	                <div class="close_btn" id="close_btn2">x</div>
	                <div>
	                	<textarea name="reviewText" rows="20" cols="40" id="reviewText" required></textarea>
	                </div>
	                <input type="hidden", name="cafeNo", value="<%=cafe.getCafeNo() %>">
					<input type="hidden", name="add", value="<%=add %>">
	                <button type="submit" class="btn btn-success">확인</button>
                	<button type="reset" class="btn btn-danger">초기화</button>
	            </div>
			</div>
		</div>	
	</form>

	
    <script>
    	var msg = "<%=alertMsg%>";
    	
    	if(msg != "null"){
    		alert(msg);
    		
    		<%session.removeAttribute("alertMsg");%>
    	}
    
    	$("#scoreDiv").click(function(){
    		if(<%=m%> == null){
    			alert("로그인 후 사용가능한 기능입니다.");
    		}else{
        		$("#modal").fadeIn();
    		}
    	});
    	
    	$("#close_btn").click(function(){
    		$("#modal").fadeOut();
    	});
    	
    	$("#reviewDiv").click(function(){
    		if(<%=m%> == null){
    			alert("로그인 후 사용가능한 기능입니다.");
    		}else{
        		$("#modal2").fadeIn();
    		}
    	});
    	
    	$("#close_btn2").click(function(){
    		$("#modal2").fadeOut();
    	});
    
    	function selectReplyList(){
    		$.ajax({
    			url:"list.re",
    			data:{
    				cafeNo : <%=cafe.getCafeNo()%>
    			},
    			type : "get",
    			success : function(list){
    				var str = "<hr>" + "<p>리뷰 ("+<%=cafe.getReplyCount() %>+")</p>";
    				
    				for(var i=0; i<list.length; i++){
    					str +=
    						 "<div class='dd'>"
    						+"<div class='userInfo'>"
    						+list[i].cafeReplyWriter
    						+"</div>"
    						+"<div>"+list[i].createDate+"</div>"
    						+"<div class='report'>" + "신고" + "</div>"
    						+"<div class='replyContent'>" + list[i].cafeReplyContent + "</div>"
    						+"</div>"
    						+"<hr>"
    				}
    				$("#replyDiv").html(str);
    			}
    		})
    	}
    
		$(function(){
			selectReplyList();
		})
		
		function checkRating(){	//0점을 준 별점이 있는지 체크. 있으면 false 리턴
			var arr = [];
			arr[0] = $(".star-rating input[name=rating]:checked").val();
			arr[1] = $(".star-rating input[name=rating2]:checked").val();
			arr[2] = $(".star-rating input[name=rating3]:checked").val();
			arr[3] = $(".star-rating input[name=rating4]:checked").val();
			
			for(var i=0; i<4; i++){
				if(arr[i] == null){
					alert("0점을 줄 수는 없습니다");
					return false;
				}
			}
			
			return true;
		}
		


    </script>
</body>
</html>