<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map.Entry, java.util.Iterator, com.kh.mainPage.model.vo.Cafe"%>
    <%
    	Iterator<Entry<String, Integer>> menu = (Iterator<Entry<String, Integer>>)request.getAttribute("menu");
    	Cafe cafe = (Cafe)request.getAttribute("cafe");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
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
            width: 80%;
            height: 100%;
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

        #scoreIcon{
            width: 100%;
            height: 80%;
            position: relative;
        }

        #scoreIcon>img{
            width: 80%;
            height: 100%;
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
            margin-top: 70px;
            font-size: 25px;
        }

        /* ===================상단 제목 별점================ */

        #detail_title{
           margin-right: 10px;
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
            width: 200px;
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

        

    </style>
</head>
<body>
    <div id="detailHead">
        <div><img src="resources/images/일하기싫은농담곰.jpg"></div>
        <div><img src="resources/images/일하기싫은농담곰.jpg"></div>
        <div><img src="resources/images/일하기싫은농담곰.jpg"></div>
        <div><img src="resources/images/일하기싫은농담곰.jpg"></div>
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
                        <div>
                            <div id="reviewIcon">
                                <img src="resources/images/리뷰아이콘.png" alt="">
                            </div>
                            <div id="reviewIconText">
                                	리뷰쓰기
                            </div>
                        </div>
                        <div>
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

    <div id="hrDiv">
        <hr>
    </div>
    <br><br><br>

    
    <br><br><br><br><br><br><br><br><br><br>
</body>
</html>