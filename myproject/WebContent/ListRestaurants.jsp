<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.Home"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String res = request.getParameter("rest");
Home.del_res(res);
out.print("<h1>Restaurant has been deleted</h1>");
out.print("<br>");
out.print("<a href=index.html>Go to login page </a>");
%>
</body>
</html>