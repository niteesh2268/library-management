<%@page import="home.Home"%>
<%@page import="home.RestaurantDetails"%>
<%@page import = "java.util.ArrayList" %>
<%@page  import  = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=button]:hover {
    background-color: #45a049;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}	
  
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<% 

	RestaurantDetails Object = new RestaurantDetails();
	
	String id = request.getParameter("id");
	
	String user = request.getParameter("user");
	
	String locality = Home.getlocality(id);
	String USERID = Home.getUSERID(id);
		
	Object = Home.getAllDetails(id);
	
	String name = Object.getRestaurantName();
	String location = Object.getLocation();
	String menuLink = Object.getMenu();
	String cost = Object.getCost();
	String rating = Object.getRating();
	String phone = Object.getPhone();
	
	String address ="https://maps.google.com/maps?q="+name+","+location+"&ie=UTF8&t=&z=17&iwloc=B&output=embed";
	address = "\"" + address+ "\"";
	
	
	out.print("<h2 align=\"center\"><i>"+name+"</i></h2><br><br>");
	
	out.print("<div align=\"center\">");
	out.print("<iframe width=\"1500\" height=\"300\"");
	out.print("src="+address+" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" >");
	out.print("</iframe>");
	out.print("</div> <br><br>");
	
	out.print("<div height=\"750\" width=\"1200\">");
	
		
	
	out.print("<div height=\"750\" width=\"500\" style=\"float:left; \" >");
	
 	out.print("<table align=\"right\">");
	out.print("<tr><td><font color=\"grey\" size=\"4\">Phone Number</font></td></tr>");
	out.print("<tr><td>"+phone+"</td></tr><tr></tr><tr></tr>");
	
	out.print("<tr><td><font color=\"grey\" size=\"4\">Location</font></td></tr>");
	out.print("<tr><td>"+location+"</td></tr><tr></tr><tr></tr>");
	
	out.print("<tr><td><font color=\"grey\" size=\"4\">Cost per Person</font></td></tr>");
	out.print("<tr><td>"+cost+"</td></tr><tr></tr><tr></tr>");
	
	out.print("<tr><td><font color=\"grey\" size=\"4\">Rating</font></td></tr>");
	out.print("<tr><td>"+rating+"</td></tr><tr></tr><tr></tr>");
	
	out.print("<tr><td><font color=\"grey\" size=\"4\">Added By</font></td></tr>");
	out.print("<tr><td>"+USERID+"</td></tr><tr></tr><tr></tr>");
	
	
	out.print("</table><br><br><br><br>"); 
	
	out.print("</table><br><br><br><br><br><br><br><br>"); 
	out.print("<center><h3>Submit your review and rating</h3></center>");
	
	out.print("<div align=\"center\">");
	out.print("<form action=\"Reviews\" id=\"usrform\" method=\"post\">");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"1\" checked> 1 <br>");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"2\" > 2 <br>");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"3\" > 3 <br>");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"4\" > 4 <br>");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"5\" > 5 <br>");
	out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
	out.print("<input type=\"hidden\" name=\"restaurantID\" value="+id+">");

	out.print("</form>");	
	
	out.print("<textarea rows=\"4\" cols=\"40\" name=\"review\" form=\"usrform\"></textarea><br>");
	
	out.print("<input type=\"submit\" form=\"usrform\" value=\"Submit\"></button>");
	
	out.print("</div>");
	
	out.print("</div>");

	
	out.print("<div width=\"700\" height=\"750\" style=\"float:right; \" >");
	
	out.print("</div>");

	out.print("<br><br><br><br><h3 align= \"center\">Order from our Menu</h3><br>");
	
	out.print("<center>");
	out.print("<form action=\"order.jsp\" method=\"post\">");
	out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
	out.print("<input type=\"hidden\" name=\"id\" value="+id+">");	
	out.print("</select> <input type=\"submit\" value=\"Order\" />");
	out.print("</form>");
	out.print("</center>");
	out.print("</body>");
	out.print("</html>");
	%>
	</body>
</html>