<%@page import="home.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*"%>

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
String[] b = request.getParameterValues("order");
String[] a = request.getParameterValues("quantity");
String delivery = request.getParameter("address");
String area = request.getParameter("area");
String city = request.getParameter("city");
int ph_num = Integer.parseInt(request.getParameter("ph_num"));

delivery = delivery.concat(" , "+area);
delivery = delivery.concat(" , "+city);

int total_cost = 0;
String tot_order = "";

out.print("<br><br><br><br><br>");
out.print("<center>");
out.print("<h1 style=\"background-color:rgb(60, 179, 60);\">Bill for your Order</h1>");
out.print("<table>");
out.print("<tr>");
out.print("<th>");
out.print("items");
out.print("</th>");
out.print("<th>");
out.print("quantity");
out.print("</th>");
out.print("<th>");
out.print("cost");
out.print("</th>");
out.print("<th>");
out.print("sub totals");
out.print("</th>");
out.print("</tr>");

for(int i=0;i<b.length;i++){
	String[] as = b[i].split("/");
	String x = as[as.length - 1];
	String y = as[as.length - 2];
	int num=0;
	if(a[i] != null){
		num = Integer.parseInt(a[i]);
	}
	total_cost = total_cost + Integer.parseInt(x)*num;
	if(i < b.length-1){
		tot_order = tot_order.concat(y+" : "+num+" , ");
	}
	else {
		tot_order = tot_order.concat(y+" : "+num);
	}
	
	out.print("<tr><td>"+y+"</td><td>"+num+"</td><td>"+x+"</td><td>"+Integer.parseInt(x)*num+"</td></tr>");
}

Home.add_into_orders(ph_num, id, delivery, total_cost, tot_order, user);

out.print("<tr>");
out.print("<td>");
out.print("</td>");
out.print("<td>");
out.print("</td>");
out.print("<td>");
out.print("TOTAL");
out.print("</td>");
out.print("<td>");
out.print(total_cost);
out.print("</td>");
out.print("</tr>");
out.print("</table>");
out.print("</center>");

out.print("<a href=index.html>Go to login page </a>");

//out.print(Integer.valueOf(cost));


%>
</body>
</html>