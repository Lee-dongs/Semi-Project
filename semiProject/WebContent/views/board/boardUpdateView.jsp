<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Location"%>
<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Board b = (Board)request.getAttribute("b");
    
    	Attachment at = (Attachment)request.getAttribute("at");
    	
    	ArrayList<Location> list = (ArrayList)request.getAttribute("list");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
<script src="https://cdn.tiny.cloud/1/omjcnn5e647lx0jwm8neb7k3o37nkkx0hrgiaxjo1oc1bnvd/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector:'textarea[name=content]',
		width: 800,
	    height: 300,
		plugins: [
			'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
			'searchreplace', 'wordcount', 'visualblocks', 'visualchars', 'code', 'fullscreen', 'insertdatetime',
			'media', 'table', 'emoticons', 'template', 'help','template'
		],
		toolbar: 'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | print preview media | forecolor backcolor emoticons'
	});
</script>

<style>
    .wrap{
        width: 800px;
        height: 800px;
        margin: auto;
        min-height:100%;
        position :relative;
    }
 
    hr{
        background-color: black;
        width: 100%;
        height: 2px;
    }
    .board-info{
        margin: 0;
        padding: 0;
    }
    .board-info>li{
        list-style-type: none;
        display: inline-block;
        width: 23%;
        text-align: left;
    }
    #con-area{
        width: 100%;
        height: 300px;
        box-sizing: border-box;
    }
    #reply-area{
        width: 100%;
        height: 30%;
    	
    }
    #reply-input{
        width: 100%;
        height: 100px;
        box-sizing: border-box;
        
    }
    #btn-reply{
        background-color: rgb(243, 197, 112);
        border: 0;
        width: 80%;
        height: 80px;
        float: left;
    }
    #byte{
        margin-left: 360px;
    }
    #btn-area{
        height: 10%;
    }
    #btn-area > button{
        float: right;
        height: 40px;
        width: 80px;
        margin-left: 10px;
    }
    #btn{
        background-color: rgb(243, 197, 112);
        border: 0;
    }
    #btn-area2{
        height: 10%;
        text-align: center;
    } 
    #btn-area2>button{
        margin-left: 10px;
    }
    
    #content-area{
        width: 100%;
        height: 280px;
    }
</style>
<body>
	<%@ include file ="../common/menubar.jsp" %>
    <div class="wrap">
        <form action="update.bo" method ="post" id="updateForm" enctype ="multipart/form-data">
            <input type = "hidden" name ="bno" value="<%=b.getBoardNo() %>">
            <script>
            	$(function(){
            		$(function(){
    					$("#updateform option").each(function(){
    						if($(this).text()=="<%=b.getLocationCode()%>"){
    							$(this).attr("selected", true);
    						}
    					});
    				});
            </script>    
                <br>
                <h2 align="center">게시글 작성</h2>
            <br>
            <h4><input type="text" id="title-area" name ="title" value="<%=b.getTitle() %>" required></h4>
            <ul class="board-info">
            	<li>위치 &nbsp;&nbsp;&nbsp;<select name = "location">
            	<%for(Location l : list){ %>
            		<option value="<%=l.getLocationCode()%>"><%=l.getLocationName() %></option>
            	<%} %>
            		</select>
            	</li>
                <li>글번호 <%=b.getBoardNo() %></li>
                <li>작성자 <%=b.getBoardWriter() %></li>
                <li>등록일 <%=b.getCreateDate()%></li>
            </ul>
            <hr>
            <div id="con-area">
                 <textarea name="content" id="content-area" cols="30" rows="50" placeholder="내용을 입력하세요" style="resize: none"><%=b.getContent() %></textarea>
            </div>
            <hr>
            <div id="file-area">
                                   첨부파일
                <%if(at!=null){ %>
                <a href="<%=contextPath + at.getFilePath()%>/<%=at.getChangeName()%>" ><%=at.getOriginName() %></a>
                <br><br>
                <input type="hidden" name="fileNo" value="<%=at.getFileNo() %>">
                <input type="hidden" name="changeName" value="<%=at.getChangeName()%>">
                <%} %>
                <br><br>
                <input type="file" name="reUp">
            </div>
            <hr>
            <div id="btn-area">
                <button type="button" id="btn" onclick ="enrollform();">글쓰기</button>
                <button type="button" id="btn" onclick ="listBoard();">목록</button>
            </div>
            <br><br><br><br><br>
            <hr><br>   
            <div id="btn-area2">
                <button type="submit" id="btn">수정</button>
                <button type="button" id="btn" onclick="history.back();">뒤로가기</button>
            </div>
		  </form>
     </div>
	<script>
		function enrollform(){
			location.href ="<%=contextPath%>/insert.bo"
		};
		function listBoard(){
			location.href ="<%=contextPath%>/list.bo?currentPage=1&sort=1"	
		}
	</script>
	<br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>