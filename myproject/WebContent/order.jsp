<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="home.Home"%>
	<%@page import = "java.util.ArrayList" %>
	<%@page  import  = "java.util.List" %>
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
String id = request.getParameter("id");
String user = request.getParameter("user");
List <String> s = Home.getMenu(id);

out.print("<form action=\"summary.jsp\" method=\"post\">");
out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
out.print("<input type=\"hidden\" name=\"id\" value="+id+">");
out.print("<table>");
out.print("<tr><th> Menu Item </th> <th> Cost </th> <th> Quantity </th> <th>selected</th></tr>");
for(int i=0; i<s.size();i++){
	
	out.print("<tr>");
	String[] tokens = s.get(i).split(" ");
	String a = tokens[tokens.length - 2];
	String b = tokens[tokens.length - 6];
	out.print("<td>");
	out.print(b);
	out.print("</td>");
	b = b.concat("/");
	b = b.concat(a);
	out.print("<td>");
	out.print("Rs "+a+"/-");
	out.print("</td>");
	out.print("<td>");
	out.print("<input type=\"number\" min=\"0\" name =\"quantity\" value = \"0\" >");
	out.print("</td>");
	out.print("<td>");
	out.print("<input type=\"checkbox\" name =\"order\" value="+b+">"+"<br>");
	
	out.print("</td>");
	
}
out.print("</table>");
out.print("<center>");
out.print("<br><br>");
out.print("<table>");
out.print("<tr>");
out.print("<td>");
out.print("Delivery Address : ");
out.print("</td>");
out.print("<td>");
out.print("<input type=\"text\" name = \"address\">");
out.print("</td>");
out.print("</tr>");
out.print("<tr>");
out.print("<td>");
out.print("Area : ");
out.print("</td>");
out.print("<td>");
out.print("<input type=\"text\" name = \"area\">");
out.print("</td>");
out.print("</tr>");
out.print("<tr>");
out.print("<td>");
out.print("City : ");
out.print("</td>");
out.print("<td>");
out.print("<input type=\"text\" name = \"city\">");
out.print("</td>");
out.print("</tr>");
out.print("<tr>");
out.print("<td>");
out.print("Phone Number : ");
out.print("</td>");
out.print("<td>");
out.print("<input type=\"text\" name = \"ph_num\">");
out.print("</td>");
out.print("</tr>");
out.print("</table>");
out.print("<br><br>");
out.print("<input type=\"submit\" name =\"Place Order\">");
out.print("</form>");
%>
</body>
</html>