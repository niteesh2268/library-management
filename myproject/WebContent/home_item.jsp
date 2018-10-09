<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="home.Home"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
		
	body { margin-top: 15%; margin-right: 10%; margin-left: 10%;
		background-image: url("wall2.jpg");
  	background-size: 100% 100%;
  background-attachment:fixed; }	
 background-attachment:fixed; }	
  h2{

	color: #ffffff; font-family: 'Raleway',sans-serif; font-size: 62px; font-weight: 1100; line-height: 72px; margin: 0 0 24px; text-align: center; 
}
 h3{

	color: #ffffff; font-family: 'Raleway',sans-serif; font-size: 40px; font-weight: 900; line-height: 50px; margin: 0 0 24px; text-align: center;

}
body { margin-top: 5%; margin-right: 10%; margin-left: 10%;
		background-image: url("2.jpg");
  	background-size: 100% 100%;
  background-attachment:fixed; }	

input[type=text], select {
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
}


p{
color: #ffffff; font-family: 'Raleway',sans-serif; font-size: 62px; font-weight: 1100; line-height: 72px; margin: 0 0 24px; text-align: center; 
}	
  
 </style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search by item</title>

<script>

var name="";

function selectRestaurant() {
	var x = document.getElementById("myRestaurants").selectedIndex;
	var y = document.getElementById("myRestaurants").options;
	// 	    alert("Index: " + y[x].index + " is " + y[x].text);

	 name = y[x].text;
	//window.alert(name);
}
</script>


</head>
<body>

<% 
String user = request.getParameter("user");


out.println("<p>"+"User: " + user+"</p>");
%>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div height="50px" style="color: red">
		<h3 align="center">Search by your Favourite Item</h3>
	</div>
	<div align="center">
		<h3 align="center">Select your Item</h3>


		<form method="post" action="ListRestaurants_by_item">

		<% out.print("<input type=\"hidden\" name=\"user\" value="+user+">");%>
			
			<select id="myRestaurants" name="item">
			
				<%
					List<String> itemsList = Home.getItems();
						
						  for(int i=0;i<itemsList.size();i++){
							String s = itemsList.get(i);
							out.print("<option  value=\""+s+"\">"+s+"</option>");
						//	System.out.println("<option name=\"rest\" value=\""+s+"\">"+s+"</option>");

						}  
					%>

			</select> <input type="submit" value="Submit" />
		</form>



	</div>
	<br>
	<br>

	<div></div>

	
</body>
</html>