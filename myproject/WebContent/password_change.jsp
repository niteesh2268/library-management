<%@page import="home.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="home.Home" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String a1 = request.getParameter("pwd");
	String a2 = request.getParameter("pswd");
	String user = request.getParameter("user");
	if(a1.equals(a2)){
		Home.password(user,a1);
		out.print("<h1>Your password has been updated "+"</h1>");
		out.print("<a href=index.html>Go to login page </a>");
	}

%>
</body>
</html>