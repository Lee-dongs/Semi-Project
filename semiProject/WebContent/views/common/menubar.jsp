<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카공족을 위한 카페추천 사이트</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        body{
            background-image: scr;
        }
        .outer{
            border: 1px solid black;
            width: 1200px;
            height: 800px;
            margin: auto;
        }
        div{
            border: 1px solid black;
            box-sizing: border-box;
        }
        #header,#menubar,#content{
            border: 1px solid black;
            width:100%;
        }
        #header{
            height: 30%;
        }
        #menubar{
            height: 5%;
        }
        #content{
            height: 65%;
        }
        /*       login+header            */
        #header>div{
            height: 100%;
            float: left;
            text-align: center;
        }
        #header_1{
            width: 15%;
        }
        #header_2{
            width: 60%;
        }
        #header_3{
            width: 25%;
        }
        #login_form{
            margin-top: 50px;
        }
        /*        menubar      */
        #navi{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            height: 100%;
        }

        #navi>li{
            display: inline-block;
            width: 15%;
            height: 100%;
            text-align: center;
            vertical-align: top;
        }  
        #navi a{
            transform: scale(1);
            text-decoration: none;
            color: yellowgreen;
            font-size: 15px;
            font-weight: 800;
            width: 100%;
            height: 100%;
            display: block;
            line-height: 40px;
        }
        #navi a:hover{
            color: darkgray;
            font-size: 15px;
        }
        #navi>li>ul{
            list-style-type: none;
            padding: 0px; 
            display: none; 
        }
        #navi>li>ul a{
            font-size: 13px;
        }
    </style>
    <script>
    
    </script>
</head>
<body>
    <div class="outer">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3">
                <div id="login_form">
                    <form action="test.do" id="login_form_input">
                        <div id="login_input">
                            <input type="text" name="userId" placeholder="아이디 입력" required><br>
                            <input type="password" name="userPwd" placeholder="비밀번호 입력" required>
                        </div>
                        <div id="login_btn">
                            <button type="submit">로그인</button>
                        </div>
                    </form>                   
                    <div id="login_form_etc">
                        <a href="">회원가입</a> 
                        <a href="">ID/PWD 찾기</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="menubar">
            <ul id="navi">
                <li><a href="">공지사항</a>
                    <ul>
                        <li><a href="">공지사항</a></li>
                        <li><a href="">FAQ</a></li>
                    </ul>
                </li>
                <li><a href="">자유게시판</a></li>
                <li><a href="<%=contextPath%>/cafeRequset.do">카페등록요청</a></li>
            </ul>
        </div>
</body>
</html>