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

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
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

	color: #ffffff; font-family: 'Raleway',sans-serif; font-size: 62px; font-weight: 1100; line-height: 72px; margin: 0 0 24px; text-align: center; 
}
 h2{

	color: #ffffff; font-family: 'Raleway',sans-serif; font-size: 40px; font-weight: 900; line-height: 50px; margin: 0 0 24px; text-align: center;

}
</style>

<style type="text/css">
		
	body { margin-top: 5%; margin-right: 10%; margin-left: 10%;
		background-image: url("3.jpg");
  	background-size: 100% 100%;
  background-attachment:fixed; }
 </style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
</head>
<body>
<font color="white"></font>
<center>


<%
	String a1 = request.getParameter("roll");
	String a2 = request.getParameter("pwd");
	Home.s = a1;
	System.out.print(Home.s);
	int rr = Home.checkPassword( a1, a2);
	
	//out.print(rr);
	if(rr==1){
		
		out.print("<h1>Your are logged in as "+a1+"</h1>");
		out.print("<center>");
		out.print("<form action =\"home.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Search restaurant by location\" ></form>");
		out.print("<br><br><br><br>");
		out.print("<tr><td align=\"center\">");
		out.print("<form action =\"home_item.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Search restaurant by item\" ></form>");
		out.print("<br><br><br><br>");
		out.print("<form action =\"addRestaurant.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Add restaurant\" ></form>");
		out.print("<br><br><br><br>");
		out.print("<form action =\"index.html\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=submit value=\"Log Out\" ></form>");
		out.print("</center>");
	}
	else{
		
		
		out.print("<h1>Wrong username or password </h1>");
		out.print("<a href=index.html>Go to login page </a>");
		
	}

%>
</center>

</body>
</html>
