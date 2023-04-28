<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
    <style>
        .admin-wrap{
            border: 1px solid black;
            width: 1000px;
            height: 600px;
            margin: auto;
            min-height:100%;
        	position :relative;
        }
        .admin-wrap *{
            box-sizing: border-box;
            
        }
        #admin-table{
            width: 100%;
            height: 100%;
            margin: auto;
            text-align: center;
        }
        /*관리자명함 스타일*/
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 80%;
            margin: auto;
            background-color: rgb(237, 248, 248);
            }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }

        .container {
            padding: 2px 16px;
        }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>

                <div class="admin-wrap">
                    <table id="admin-table">
           
                      <tr>
                         <td rowspan="2" width="30%">
                            <div class="card">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcZmpczK4t42nwpaOJUDQpSyZn4HSO43SMFQ&usqp=CAU" alt="Avatar" style="width:100%">
                            <div class="container">
                                <h4><b>관리자</b></h4> 
                                <p>EMAIL : yujin</p> 
                            </div>
                            </div>
                         </td>
                    <td width="35%" height="50%"><button type="button" class="btn btn-outline-warning btn-lg" onclick="memberManagePage();">회원관리 바로가기</button></td>
                    <td width="35%"><button type="button" class="btn btn-outline-warning btn-lg" onclick="cafeRequestPage();">카페등록요청 바로가기</button></td>
                </tr>
                <tr>
                    <td><button type="button" class="btn btn-outline-warning btn-lg" onclick="reportPage();">신고정보 바로가기</button></td>
                    <td><button type="button" class="btn btn-outline-warning btn-lg" onclick="questionPage();">문의글 바로가기</button></td>
                </tr>
            
        </table>


    </div>

    <script>
        function memberManagePage(){
            location.href="<%=contextPath%>/memberManagement.ma?currentPage=1";
        };
        function cafeRequestPage(){
            location.href="<%=contextPath%>/cafeRequest.co";
        };
        function reportPage(){
            location.href="<%=contextPath%>/reportManagement.ma?currentPage=1";
        };
        function questionPage(){
            location.href="<%=contextPath%>/list.fo?currentPage=1";
        };

    </script>
    <br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>