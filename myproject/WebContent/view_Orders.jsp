<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="home.Home"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}

</style>
<meta charset="UTF-8">
<title>orders</title>
</head>
<body>
<%
	String temp = Home.get_orders();
	String s = new String("<table>");
	s = s.concat("<tr><th> Order no </th><th> Username </th><th> Restaurant ID </th><th> Delivery Address </th><th> Total Orders </th><th> Phone Number </th><th> Total Cost </th></tr> ");
	s = s.concat(temp);
	s = s.concat("</table>");
	System.out.print(s);
	out.print(s);
	out.print("<br><br>");
	out.print("<a href=index.html>Go to login page </a>");
%>
</body>	
</html>