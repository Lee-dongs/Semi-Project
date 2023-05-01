<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing: border-box;
        margin:auto;
    }
    #footer{
        height: 200px;
        width: 100%;
        background: #5c5b58;
        color: white;
       	position : absolute;
       	height : 13rem;
    }
    #footer>div{
        width: 100%;
    }
    #footer_1{
        height: 20%;
        padding-top: 5px;
        text-align: center;
    }
    #footer_2{
        height: 80%;
    }
    #footer_2>p{
        width: 100%;
        box-sizing: border-box;
        margin: 0;
    }
    #p1{
        height: 20%;
        padding-left: 20px;
    }
    #p2{
        height: 80%;
        width: 100%;
        text-align: left;
    }
    #footer_1 a{
        text-decoration: none;
        color: white;
        margin: 20px;
    }
    #footer_2 a{
        text-decoration: none;
        color: white;
        margin: 20px
    }
    #footer_2 #p1{
        padding-top: 5px;
    }
    #footer_2 #p2{
       padding-left: 20px;
       padding-top: 20px;
       line-height : 1.5
    }
</style>
<footer>
    <div id="footer">
        <div id="footer_1">
            <a href="">이용약관</a> |
            <a href="">공지사항</a> |
            <a href="">개인정보취급방침</a> |
            <a href="">문의</a> |
            <a href="">요청사항</a>
        </div>
        <div id="footer_2">
            <p id="p1">
                추천지역 :
                <a href="">영등포구</a> |
                <a href="">마포구</a> |
                <a href="">동작구</a> | 
                <a href="">용산구</a> |
                <a href="">양천구</a> |
                <a href="">중구</a>
            </p>
            <p id="p2">
                (주)Semi5조<br>
                서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F <br>
                조장 : 이한얼 <br>
                고객센터 : 02-0000-0000 <br>
            </p>
        </div>
    </div>
</footer>
</html>