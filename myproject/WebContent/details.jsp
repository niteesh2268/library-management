<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page  import  = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

String id = request.getParameter("id");
String user = request.getParameter("user");

String[] orders = request.getParameterValues("order");

for(int i=0;i<orders.length;i++){
	out.print(orders[i]);
}

/*
out.print("<form action=\"summary.jsp\" method=\"post\">");
out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
out.print("<input type=\"hidden\" name=\"id\" value="+id+">");

for(int i=0;i<orders.length;i++)*/

%>

</body>
</html>