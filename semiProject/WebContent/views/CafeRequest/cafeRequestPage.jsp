<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#outer2{
	    width: 1200px;
	    margin: auto;
	    min-height:100%;
        position :relative;
	    
	}
	#requestbox{
	    
	    width: 50%;
	    margin: auto;
	    margin-top: 50px;
	    box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
	    border: 1px solid black; 
	}
	
	#requestbox>table{
	    font-weight: bold;
	}
	
	#requestbox>div>h1{
	    text-align: center;
	}
	td>input,textarea{
	    border: 1px solid black;
	    border-radius: 3px;
	    line-height: 35px;
	    font-size: 12px;
	    padding-left: 10px;
	    padding-right: 10px;
	    width: 100%;
	}
	#map{
		border-radius: 3px;
	    padding-left: 10px;
	    padding-right: 10px;
	    width: 100%;
	}
	table th {
    text-align: center;
	}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c420b0d0354a87e72cc4af213423763f&libraries=services"></script>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<%if(loginUser!=null){ %>
	<div id="outer2">
            <div id="requestbox">
                <div><h1>공부하기 좋은 카페 추천</h1></div>
                <div id="request">
                    <form action="<%=contextPath %>/insertRequest.co" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="userNo" value="1">
                        <table width="100%" id="request">
                            <tr>
                                <th class="namee">카페명:</th>
                                <td><input id="cafename" name="cafename" type="text" required style="width:82%"><button type="button" onclick="find();" style="height: 39px;">검색</button></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><label id="input"></label></td>
                            </tr>
                            <tr>
                                <th>주소:</th>
                                <td colspan=""><input id="address" name="address" type="address" style="width:90%" required></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><div id="map" style="width:90%;height:250px;"></div></td>
                            </tr>
                            <tr>
                                <th>영업시간:</th>
                                <td><input id="operationTime" name="operationTime" type="text" style="width:90%" required></td>
                            </tr>
                            <tr>
                                <th>추천 이유:</th>
                                <td><textarea  name="content" id="content" cols="30" rows="3" style="resize: none; height:250px; width:90%" required></textarea></td>
                            </tr>
                            <tr>
                                <th>첨부파일:</th>
                                <td></thd><input type="file" name="upfile" style="width:90%"></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                <button type="submit" id="btn_request" disabled>신청하기</button>
                                <button type="button">취소</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br>
                </div> 
                
            </div>
        </div>
        <%}else{ %>
        <script>
	        var msg = "<%=msg%>";
	    	alert(msg);
        </script>
        <%} %>    
            <script>
                var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                
                var mapContainer = document.getElementById('map'), 
                    mapOption = {
                        center: new kakao.maps.LatLng(37.566826, 126.9786567),
                    };  
                
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                
                function find(){
                	var ps = new kakao.maps.services.Places(); 
                	var address = document.getElementById("cafename").value;
                	ps.keywordSearch(address, placesSearchCB); 
                
                	function placesSearchCB (data, status, pagination) {
                    	if (status === kakao.maps.services.Status.OK) {
                
                       		var bounds = new kakao.maps.LatLngBounds();
                
                        	for (var i=0; i<data.length; i++) {
                            console.log(data[i]);
                        	displayMarker(data[i]);    
                            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                        	}       
                
                        	map.setBounds(bounds);
                    	} 
                	};
                
                	function displayMarker(place) {
                    
                    	var marker = new kakao.maps.Marker({
                        	map: map,
                        	position: new kakao.maps.LatLng(place.y, place.x) 
                    	});
                
                    	kakao.maps.event.addListener(marker, 'click', function() {
                        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                        infowindow.open(map, marker);
                        
                        document.getElementById("address").value = place.address_name;
                        console.log(place.phone);
                        $.ajax({
		                	url:"AddressCheck.bo",
		                	data:{
		                		cafeaddress: $("#address").val()
		                	},
		                	type: "get",
		                	success: function(result){
		                		console.log("통신 성공했습니다.");
		                		/* console.log(result); */
		                	if(result=="NNNNN"){
		                		$("#input").text("이미 등록이 된 카페입니다.");
		                		$("#input").css("color","red");
		                	}else if(result=="NNNNY"){
		                		$("#input").text("등록이 가능한 카페입니다.");
		                		$("#input").css("color","blue");
		                		$("#btn_request").removeAttr("disabled");
		                	};
		                	
		                	
		                	},
		                	error: function(){
		                		console.log("통신 실패했습니다.");
		                	}
	                	
	                	});
                    });
                };
                };
                </script>
                <br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
	</body>
</html>