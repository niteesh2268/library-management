<%@page import="home.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="home.Home" %>
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
<title>Insert title here</title>
</head>
<body>


<%
	String a1 = request.getParameter("roll");
	String a2 = request.getParameter("pwd");
	int rr = Home.checkPassword( a1, a2);
	System.out.println(a1);
	System.out.println(a2);
	//out.print(rr);
	if(rr==1){
		
		out.print("<h1>Your are logged in as "+a1+"</h1>");
		out.print("<center>");
		out.print("<form action =\"password_change.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+">");
		out.print("</table>");
		out.print("<center>");
		out.print("<br><br>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>New Password</td>");
		out.print("<td>");
		out.print("<input type=\"password\" id=\"pwd\" name=\"pwd\">");
		out.print("</td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Re-Enter New Password</td>");
		out.print("<td>");
		out.print("<input type=\"password\" id=\"pswd\" name=\"pswd\">");
		out.print("</td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<br>");
		out.print("<input type=submit value=\"Change Password\" ></form>");
		out.print("</center>");
	}
	else{
		
		
		out.print("<h1>Wrong username or password </h1>");
		out.print("<a href=index.html>Go to login page </a>");
		
	}

%>

</body>
</html>