<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cafeRequest.model.vo.CafeRequest,com.kh.cafeRequest.model.vo.CafeRequestAttachment,com.kh.common.NaverCafeInfo.CafeInfo,com.kh.common.NaverCafeMenu.CafeMenu ,java.util.ArrayList"%>
<%
	ArrayList<CafeRequest> cList = (ArrayList)request.getAttribute("cList");
	ArrayList<CafeRequestAttachment> aList = (ArrayList)request.getAttribute("aList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer2{
    width: 1200px;
    height: 800px;
    margin: auto;
    
}
#title{
    line-height: 40%;
}
#requestAccept{
    width:95%;
    height: 700px;
    margin-top: 50px;
    margin-left: 2.5%;
    box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
    border: 1px solid black; 
    position: relative;
    box-sizing: border-box;
}
#box1,#box2,#box3{
    position: absolute;
    height: 600px;
    top: 50px;
    border: 1px solid black;
}
#box1{
    width: 35%;
}
#box2{
    width: 35%;
    left: 35%
}
#box3{
    width: 30%;
    left: 70%;
}
#box1>#list{
    height: 5%;
    text-align: center;
    line-height: 30px;
}
#box1>#list-content{
    position: relative;
    height: 85%;
    width: 90%;
    left: 5%;
    border: 1px solid black;
    overflow: auto;
}
.a{
    text-align: center;
    border: 1px solid black;
    cursor: pointer;
    overflow: hidden;
}

.b{
    border: 1px solid black;
    text-align: center;
    display: none; 
    cursor: pointer;
}
.b tr:nth-child(odd) td{
   background:lemonchiffon;
}
.b tr:nth-child(even) td{
    background:whitesmoke;
}
#box2>#list{
    height: 5%;
    text-align: center;
    line-height: 30px;
}
#request-content{
	border: 1px solid black;
    height: 65%;
    overflow: auto;
}
#search{
    height:30%;
}
.c{
    width: 100%;
}

#search-title>p{
	margin:0px;
    line-height: 25px;
}
#search-result{
    
    border: 1px solid black;
    height: 80%;
    overflow: auto;
}
#search-result>table{
    width: 100%;
    border-collapse : collapse;
}
#search-result a{
	
    text-decoration: none;
    color:black;
}
#box3>#list{
    height: 5%;
    text-align: center;
    line-height: 30px;
}
#registerform{
	border: 1px solid black;
    height: 90%;
    overflow: auto;
}
#requestsummit{
    height: 5%;
    line-height: 25px;
}
.d{
    width: 100%;
}
.e{
	width:100%;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c420b0d0354a87e72cc4af213423763f&libraries=services"></script>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
        <div class="outer2">
            <div id="requestAccept">
                <div id="title" align="center"><h2>관리자 카페요청 처리 페이지</h2></div>
                <div id="box1">
                    <div id="list">요청목록</div>
                    <table style="width: 90%;" border="1" align="center">
                        <tr>
                            <th style="width: 20%;">작성자</th>
                            <th style="width: 45%;">카페요청내용</th>
                            <th style="width: 35%;">날짜</th>
                        </tr>
                    </table>
                    <div id="list-content">
                    	<%for(int i=0; i<cList.size();i++){ %>
                        <%int number = cList.get(i).getRequestNo(); %>
                        <table style="width: 100%;table-layout: fixed" border="1" class="a">
                            <tr class="req">
                            	<%for(int h=0; h<aList.size();h++) {%>
                            		<%if(number==aList.get(h).getRequestNo()){ %>
                            			<input class="rno<%=number%>" type="hidden" value="<%=aList.get(h).getRequestNo()%>">
                            		<%} %>
                            	<%} %>
		                    	<input id="original" type="hidden" value="<%=number %>">
		                    	<input id="itself" type="hidden" value="<%=number %>">
			                    <input class="no<%=number%>" id="no1" type="hidden" value="<%=number %>">
		                    	<input id="operation1" type="hidden" value="<%=cList.get(i).getOperationTime() %>">
		                    	<input id="address1" type="hidden" value="<%=cList.get(i).getAddress() %>">
                                <td style="width: 20%;" id="userName1"><%=cList.get(i).getRequestWriter() %></td>
                                <td align="center" id="cafename1"><%=cList.get(i).getCafeName() %></td>
                                <td class="dup" id="dup"style="width: 10%;color:red; display:none">중복</td>
                                <td style="width: 35%;" id="date1"><%=cList.get(i).getCreateDate() %></td>
                            </tr>
                        </table>
                        <%String check = cList.get(i).getAddress(); %>
		                <table style="width: 100%;" border="1" class="b">
                        <%for(int j=i+1; j<cList.size();j++){%>
	                        <%if((cList.get(j).getAddress()).equals(check)){ %>
		                            <tr class="req">
		                            	<%for(int h=0; h<aList.size();h++) {%>
                            				<%if(cList.get(j).getRequestNo()==aList.get(h).getRequestNo()){ %>
                            					<input class="rno<%=number%>" type="hidden" value="<%=aList.get(h).getRequestNo()%>">
                            				<%} %>
                            			<%} %>	
		                            	<input id="original" type="hidden" value="<%=number %>">
		                            	<input id="itself" type="hidden" value="<%=cList.get(j).getRequestNo() %>">
			                            <input class="no<%=number%>" id="no1" type="hidden" value="<%=cList.get(j).getRequestNo() %>">
		                    			<input id="content1" type="hidden" value="<%=cList.get(j).getContent() %>">
		                    			<input id="operation1" type="hidden" value="<%=cList.get(j).getOperationTime() %>">
		                    			<input id="address1" type="hidden" value="<%=cList.get(j).getAddress() %>">
		                                <td style="display:none">안녕</td>
		                                <td style="width: 20%;" id="userName1"><%=cList.get(j).getRequestWriter() %></td>
		                                <td style="width: 45%;" align="center" id="cafename1"><%=cList.get(j).getCafeName() %></td>
		                                <td style="width: 35%;" id="date1"><%=cList.get(j).getCreateDate() %></td>
		                            </tr>
	                        	<%i++; %>
	                        <%} %>
                        <%} %>
		                </table>
                        <%} %>
                    </div>
                </div>
                <div id="box2">
                    <div id="list">요청내용</div>
                    <div id="request-content">
                        <div>
                            <form action="manageCafe.co" method="get">
                                <table class="c" border="1">
                                	<input id="no2-3" name="no2-3" type="hidden">
                                	<input id="no2-2" name="no2-2" type="hidden">
                                	<input id="no2-1" name="no2-1" type="hidden">
                                	<input id="no2" name="no2" type="hidden">
                                	<input id="length2" name="length2" type="hidden">
                                	<input id="content2-2" name="content2-2" type="hidden">
                                    <tr>
                                        <th style="width: 20%;">카페명:</th>
                                        <td id="cafename2"></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 20%;">주소:</th>
                                        <td name="address2" id="address2"></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 20%;"></th>
                                        <td><div id="map" style="width:100%;height:250px;"></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 20%;">전화번호:</th>
                                        <td id="phone2"></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 20%;">영업시간:</th>
                                        <td id="time2"></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 20%;" id="reason2">추천이유:</th>
                                        <td><textarea name="content2" id="content2" cols="35" rows="10" style="resize: none;">

                                            </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 20%;" id="at2">첨부파일:</th>
                                        <th id="attach2"></th>
                                    </tr>
                                </table>

                                <table border="2" style="width: 100%;border-collapse : collapse;" class="t">
                                    <tr>
                                        <td id="rectangle" align="center">
                                            ▼
                                        </td>
                                    </tr>
                                </table>
                                <table class="y" style="width: 100%;display:none;">
                                    <tr>
                                        <th>
                                            <textarea name="sorry" id="sorry" cols="35" rows="10" style="resize: none;">
죄송합니다. 

사용자분의 요청을 검토한 결과 '부적합'하여 업로드를 하지 못했습니다.

궁금한 점 있으시면 FAQ로 문의 바랍니다.

우리 사이트에 많은 관심을 가져주셔서 감사합니다.
                                            </textarea>
                                        </th>
                                        <th colspan="2" style="width: 15%;"><button id="requestdelete" type="submit" disabled>삭제</button></th>
                                    </tr>
                                </table>
                            </form>
                        </div>    
                    </div>
                    <div id="search">
                    	<div id="search-title">
                        <p id="search-count">인터넷 검색 결과:</p>
                        </div>
                        <div id="search-result">
                            <table border="1" id="search-blog">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <form action="manageCafe.co" method="post" enctype="multipart/form-data">
                    <div id="box3">
                        <div id="list">카페업로드</div>
                        <div id="registerform">
                            <table class="e" border="1">
                            	<input type="hidden" name="requestnos" id="requestnos">
                            	<input type="hidden" name="atnos" id="atnos">
                                <tr>
                                    <th>
                                        카페명:
                                    </th>
                                    <td colspan="2">
                                        <input type="text" name="cafename3" id="cafename3" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        지역:
                                    </th>
                                    <td colspan="2">
                                        <select name="location3" id="location3" style="width:100%;">
                                            <option value="영등포구">영등포구</option>
                                            <option value="동작구">동작구</option>
                                            <option value="강남구">강남구</option>
                                            <option value="마포구">마포구</option>
                                            <option value="서대문구">서대문구</option>
                                            <option value="종로구">종로구</option>
                                            <option value=""></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="1">
                                        주소:
                                    </th>
                                    <td colspan="2">
                                        <input type="address" name="address3" id="address3" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        영업시간:
                                    </th>
                                    <td colspan="2">
                                        <input type="time" name="time3" id="time3" style="width:47%;"> -
                                        <input type="time" name="time3-1" id="time3-1" style="width:47%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        휴무일:
                                    </th>
                                    <td colspan="2">
                                        <input type="text" name="rest3" id="rest3" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        전화번호:
                                    </th>
                                    <td colspan="2">
                                        <input type="text" name="phone3" id="phone3" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                	<th rowspan="5">
                                		메뉴/가격:
                                	</th>
                                	<td>
                                		<input type="text" name="menu0" id="menu3-0" style="width:100%;">
                                	</td>
                                	<td>
                                		<input type="text" name="price0" id="price3-0" style="width:100%;">
                                	</td>
                                </tr>
                                <tr>
                                	<td>
                                		<input type="text" name="menu1" id="menu3-1" style="width:100%;">
                                	</td>
                                	<td>
                                		<input type="text" name="price1" id="price3-1" style="width:100%;">
                                	</td>
                                </tr>
                                <tr>
                                	<td>
                                		<input type="text" name="menu2" id="menu3-2" style="width:100%;">
                                	</td>
                                	<td>
                                		<input type="text" name="price2" id="price3-2" style="width:100%;">
                                	</td>
                                </tr>
                                <tr>
                                	<td>
                                		<input type="text" name="menu3" id="menu3-3" style="width:100%;">
                                	</td>
                                	<td>
                                		<input type="text" name="price3" id="price3-3" style="width:100%;">
                                	</td>
                                </tr>
                                <tr>
                                	<td>
                                		<input type="text" name="menu4" id="menu3-4" style="width:100%;">
                                	</td>
                                	<td>
                                		<input type="text" name="price4" id="price3-4" style="width:100%;">
                                	</td>
                                </tr>
                                <tr>
                                    <th>
                                        대표이미지:
                                    </th>
                                    <td  colspan="2" style="width:75%;">
                                        <input type="file" name="image3" id="image3" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5">
                                        이미지:
                                    </th>
                                    <td colspan="2" style="width:75%;">
                                        <input type="file" name="image3-0" id="image3-1" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width:75%;">
                                        <input type="file" name="image3-1" id="image3-2"  style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width:75%;">
                                        <input type="file" name="image3-2" id="image3-3" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width:75%;">
                                        <input type="file" name="image3-3" id="image3-4" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width:75%;">
                                        <input type="file" name="image3-4" id="image3-5" style="width:100%;">
                                    </td>
                                </tr>
                                <tr>
                                	<td colspan="4">
                                		<textarea style="resize:none;width:100%;height:120px;" name="content3" id="content3">
안녕하세요.

요청해주신 카페 업로드를 완료하였습니다.

다음에도 많은 이용바랍니다.
                                		</textarea>
                                	</td>
                                </tr>
                            </table>
                        </div>
                        <div id="requestsummit" align="center">
                            <button type="button" id="getrequest">가져오기</button>
                            <button type="submit">업로드</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
        
        
        $(function(){
        	$(document).ready(function(){
        		var a =$(".a");
        		for(var i=0; i<a.length; i++){
        				if($(".a").eq(i).next().text().includes('안녕')){
        					$(".a").eq(i).find("#dup").css({"display":""});
        				}
        		}
            });
			$("#getrequest").click(function(){
				var nos = $("#no2-2").val();
				var ats = $("#no2-3").val();
				var address = $("#address2").text();
                var cafename = $("#cafename2").text();
                var phone = $("#phone2").text();
              	
                $("#requestnos").val(nos);
                $("#atnos").val(ats);
                $("#address3").val(address);
                $("#cafename3").val(cafename);
                var adrry = address.split(" ");
                $("#location3").val(adrry[1]);
                $.ajax({
                	url:"getData.co",
                	data:{
                		cafeaddress: address,
                		cafename: cafename
                	},
                	type: "post",
                	success: function(list){
                		console.log("통신 성공했습니다.");
                		$("#phone3").val("");
                		$("#time3").val("");
                		$("#time3-1").val("");
                		$("#rest3").val("");
                		for(var i=0; i<list[0].length;i++){
                			$("#menu3-"+i).val("");
                			$("#price3-"+i).val("");
                		}
                		$("#phone3").val(list[1].phone);
                		$("#time3").val(list[1].startTime);
                		$("#time3-1").val(list[1].offTime);
                		$("#rest3").val("연중무휴");
                		for(var i=0; i<list[0].length;i++){
                			$("#menu3-"+i).val(list[0][i].menu);
                			$("#price3-"+i).val(list[0][i].price);
                		}
                		
                	},
                	error: function(){
                		console.log("통신 실패했습니다.");
                	}
            	});
			});
            $(".a").click(function(){
                
                var $p = $(this).next(); 
                /* console.log($(this).text()); */
                if($p.css("display")=="none"){ 
                    $(this).siblings(".b").slideUp(); 
                    $p.slideDown(100); 
                }else{
                    $p.slideUp(100); 
                }
            });
			$(".t").click(function(){
                
                var $p = $(this).next(); 
                /* console.log($(this).text()); */
                if($p.css("display")=="none"){ 
                    $("#rectangle").html("▲"); 
                    $p.slideDown(100);
                }else{
                	$("#rectangle").html("▼"); 
                    $p.slideUp(100); 
                }
            });
            $(".req").dblclick(function(){
                /* console.log($(".no1").val()); */
               
                var cafename = $(this).children("#cafename1").text();
                var content = $(this).children("#content1").val();
                var address = $(this).children("#address1").val();
                var operation = $(this).children("#operation1").val();
                var no = $(this).children("#original").val();
                var date = $(this).children("#date1").text();
                var itself = $(this).children("#itself").val();
               	var ah = $(".rno"+no);
               	
               	var arr2 = new Array();
               	for (var i=0; i < ah.length; i++ )  { 
                	arr2[i]=ah[i].value;
                };
                /* console.log(arr2); */
                var ch = $(".no"+no);
                var arr = new Array()
                for (var i=0; i < ch.length; i++ )  { 
                	/* console.log(ch[i].value); */ 
                	arr[i]=ch[i].value;
                };
                console.log($(".rno"+no));
                $("#address2").text(address);
                $("#cafename2").text(cafename);
                $("#content2").text(content);
                $("#time2").text(operation);
                $("#no2").val(arr);
                $("#no2-3").val(arr2);
                $("#no2-1").val(itself);
                $("#no2-2").val(no);
                $("#requestdelete").removeAttr("disabled");
                
                var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                var mapContainer = document.getElementById('map'), 
                    mapOption = {
                        center: new kakao.maps.LatLng(37.566826, 126.9786567),
                    };  
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                find();
                function find(address){
                	var ps = new kakao.maps.services.Places(); 
                	var address = document.getElementById("address2").innerHTML;
                	ps.keywordSearch(address, placesSearchCB);
                	function placesSearchCB (data, status, pagination) {
                    	if (status === kakao.maps.services.Status.OK) {
                       		var bounds = new kakao.maps.LatLngBounds();
                       		for (var i=0; i<data.length; i++) {
                       			if(data[i].category_group_name=='카페'){
                       				displayMarker(data[i]);    
                                	bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                       			}
                            	}       
                        	map.setBounds(bounds);
                    	} 
                	};
                	function displayMarker(place) {
                    	var marker = new kakao.maps.Marker({
                        	map: map,
                        	position: new kakao.maps.LatLng(place.y, place.x) 
                    	});
                        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                        infowindow.open(map, marker);
                        document.getElementById("phone2").innerText = place.phone;
                        document.getElementById("cafename2").innerText = place.place_name;
                	};
                };
              
               $.ajax({
                	url:"getData.co",
                	data:{
                		cafename: $("#cafename2").text(),
                		cafeaddress: address,
                		requestno : itself
                	},
                	type: "get",
                	success: function(list){
                		console.log("통신 성공했습니다.");
                		var str = "";
                		
                		for(var i = 0; i<list[0].length;i++){
                			str+=
                			"<tr>"+
                            	"<th><a href="+list[0][i].link+">"+list[0][i].title+"</a></th>"+
                        	"</tr>"
                		}
                		$("#search-blog").html(str);
                		$("#search-count").html("인터넷 검색 결과: ("+list[0].length+")");
                		
                		
                		if(list[1]!=null){
                			var str2 = "";
                			str2 += "<img src='"+"<%=contextPath%>"+list[1].filePath+"/"+list[1].changeName+"' width='100%;' height='100%;''>";
                			$("#attach2").html(str2);
                		}else{
                			$("#attach2").html("");
                		}
                		
                	},
                	error: function(){
                		console.log("통신 실패했습니다.");
                	}
                });
            });
            
        })
        </script>
</body>
</html>