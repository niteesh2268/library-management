<%@page import="home.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="home.Home" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style type="text/css">
		
	* {
    box-sizing: border-box;
}

.w3-button {
	background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}
input[type=password], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
	body { margin-top: 5%; margin-right: 10%; margin-left: 10%;
		background-image: url("1.jpg");
  	background-size: 100% 100%;
  background-attachment:fixed; }	
  h1{

	font-size: 62px; font-weight: 1100; line-height: 72px; margin: 0 0 24px; text-align: center; 
}
 h3{

	 font-size: 25px; font-weight: 900; 

}
 </style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
<font color="white"></font>
<%
	String a1 = request.getParameter("admini");
	String a2 = request.getParameter("adminp");
	
	int rr = Home.checkPasswordadmin( a1, a2);
	
	
	//out.print(rr);
	if(rr==1){
		out.print("<center>");
		out.print("<h1>You are logged in as Admin</h1>");
		out.print("<form action =\"addRestaurant.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Add restaurant\" ></form>");
		out.print("<br><br><br><br>");
		out.print("<form action =\"view_Orders.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"View Orders\" ></form>");
		out.print("<br><br><br><br>");
		out.print("<form action =\"list_for_delete.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Delete Restaurant\" ></form>");
		out.print("</center>");
		out.print("<br><br><br><br>");
		out.print("<form action =\"index.html\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Log Out\" ></form>");
		out.print("</center>");
	}
	else{
		
		
		out.print("<h1>Wrong username or password </h1>");
		out.print("<a href=index.html>Go to login page </a>");
		
	}

%>


</body>
</html>