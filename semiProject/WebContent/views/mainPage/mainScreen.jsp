<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 스크린</title>
<style>
	#content{
            text-align: center;
            width : 1200px;
            margin : auto;
        }
        #content>div:hover{
            color: gray;
            opacity: 80%;
        }
        #content>div{
            margin-top: 50px;
            display: inline-block;
            width: 300px;
            height: 200px;
            box-sizing: border-box;
            margin : 20px;
        }
        #content img{
        	box-sizing : border-box;
        	width : 100%;
        	height : 100%;
        }
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<div id="content">
            <div id="content_1"><img id="photo1" src="resources/images/브로콜리햄스터.jpg" alt=""></div>
            <div id="content_2"><img id="photo2" src="resources/images/브로콜리햄스터.jpg" alt=""></div>
            <div id="content_3"><img id="photo3" src="resources/images/브로콜리햄스터.jpg" alt=""></div>
            <div id="content_4"><img id="photo4" src="resources/images/브로콜리햄스터.jpg" alt=""></div>
            <div id="content_5"><img id="photo5" src="resources/images/브로콜리햄스터.jpg" alt=""></div>
            <div id="content_6"><img id="photo6" src="resources/images/브로콜리햄스터.jpg" alt=""></div>
    </div>
    <br><br><br>
    
       
       <script>
        $(function(){
            $("#content_1>img").click(function(){
                location.href= '<%=contextPath%>/ranking.cf?location=영등포구';
            });
            $("#photo_2").click(function(){
                location.href= '';
            });
            $("#photo_3").click(function(){
                location.href= '';
            });
            $("#photo_4").click(function(){
                location.href= '';
            });
            $("#photo_5").click(function(){
                location.href= '';
            });
            $("#photo_6").click(function(){
                location.href= '';
            });
        })

    </script>
</body>
</html>