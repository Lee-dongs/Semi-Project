<%@page import="com.kh.board.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	ArrayList<Location> list = (ArrayList)request.getAttribute("list");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
 -->
<title>글작성 페이지</title>
</head>
<style>
    div{
       
    }
    #enroll-area{
        width: 700px;
        height: 800px;
        border-top: 1px solid;
        border-collapse: collapse;
        margin: auto;
    }
    #enroll-area>tr,th,td{
        border-bottom: 1px solid #444444;
        padding: 5px;
    }
    #enroll-area>thead{
        text-align: center;
    }
    #content-area{
        width: 100%;
        height : 600px;
        box-sizing: border-box;
    }
    #btn{
        text-align: center;
    }
    #title-area{
        width: 100%;
        box-sizing: border-box;
    }
    #file-area{
        width: 100%;
    }
    
    
</style>
<body>
	<!--  <%@ include file ="../common/menubar.jsp" %>-->
    <div class="wrap">
        <h2 align="center">게시글 작성</h2>
        <form action="insert.bo" method ="post" enctype="multipart/form-date">
        <input type ="hidden" name="userNo" value="">
        <table id="enroll-area">
            <thead>
                <tr>
                    <th>위치</th>
                    <td width="50px">
                        <select name="location">
                        <%for(Location l : list){ %>
                            <option value="<%=l.getLocationCode()%>"><%=l.getLocationName()%></option>
                        <%} %>
                        </select>
                    </td>
                    <th>제목</th>
                    <td><input type="text" id="title-area"></td>
                    </tr>
                    <tr>
                        <td colspan="4">글씨 editor 추가예정</td>
                    </tr>
            </thead>
            <tbody>
                <tr>
                	<th>내용</th>
                    <td colspan="3">
                        <textarea name="content" id="content-area" cols="30" rows="50" placeholder="내용을 입력하세요" style="resize: none" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="file" name="upfile" id="file-area">
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" id="btn">
                        <button type="submit">작성완료</button>
                        <button type="reset" onclick ="history.back()">취소</button>
                    </td>
                </tr>
            </tfoot>
        
        </table>
        </form>
    </div>
    <!-- 
    <script>
        $(document).ready(function(){
            $("#content-area").summernote({
                height : 300,
                minHeight : null,
                maxHeight : 700,
                focus : true,
                lang : "ko-KR",
                placeholder :"내용을 입력하세요" 
            
            });
        });

    </script>
     -->
</body>
</html>
