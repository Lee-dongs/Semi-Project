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
<title>글작성 페이지</title>
</head>
<style>
	.wrap>h2{
		margin:auto;
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
	<%@ include file ="../common/menubar.jsp" %>
    <div class="wrap">
        <h2>게시글 작성</h2>
        <br>
        <form action="insert.bo" method ="post" enctype="multipart/form-data">
        <input type ="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
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
                    <td><input type="text" id="title-area" name ="title"></td>
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
</body>
</html>
