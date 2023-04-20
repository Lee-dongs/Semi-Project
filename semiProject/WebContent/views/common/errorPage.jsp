<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String errerMsg = (String)request.getAttribute("errerMsg");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1 align="center"><%=errerMsg %></h1>
	
	<h3 align="center"><a href="<%=request.getContextPath()%>">인덱스로</a></h3>
</body>
</html>