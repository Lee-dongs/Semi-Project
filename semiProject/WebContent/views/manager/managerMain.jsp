<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 메인</title>
<style>
        .admin-wrap{
            border: 1px solid black;
            width: 1000px;
            height: 600px;
            margin: auto;
        }
        .admin-wrap *{
            box-sizing: border-box;
            
        }
        #admin-table *{
            border: 1px solid red;
        }
        #admin-table{
            width: 100%;
            height: 100%;
            margin: auto;
            text-align: center;
        }
    </style>
</head>

<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="admin-wrap">
        <table id="admin-table">
           
                <tr>
                    <td rowspan="2">관리자정보</td>
                    <td><button type="button" onclick="memberManagePage();">회원관리 바로가기</button></td>
                    <td><button type="button" onclick="cafeRequestPage();">카페등록요청 바로가기</button></td>
                </tr>
                <tr>
                    <td><button type="button" onclick="reportPage();">신고정보 바로가기</button></td>
                    <td><button type="button" onclick="questionPage();">문의글 바로가기</button></td>
                </tr>
            
        </table>


    </div>

    <script>
        function memberManagePage(){
            location.href="<%=contextPath%>/memberManage.ma";
        };
        function cafeRequestPage(){
            location.href="<%=contextPath%>/cafeRequest.co";
        };
        function reportPage(){
            location.href="<%=contextPath%>/report.ma";
        };
        function questionPage(){
            location.href="<%=contextPath%>/list.fo";
        };

    </script>
</body>
</html>