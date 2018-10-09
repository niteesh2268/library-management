<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
	<br><br><br>
	
	<%
	List<String> listOfId = new ArrayList<String>();
	List<String> listOfNames = new ArrayList<String>();
	List<String> listOfVotes = new ArrayList<String>();
	List<String> listOfLocations = new ArrayList<String>();
	List<String> listOfRatings = new ArrayList<String>();
	String item;
	String user;
	
	listOfNames = (ArrayList)request.getAttribute("restaurantNameList");
	listOfVotes = (ArrayList)request.getAttribute("restaurantVotesList");
	listOfLocations = (ArrayList)request.getAttribute("restaurantLocationList");
	listOfRatings = (ArrayList)request.getAttribute("restaurantRatingList");
	listOfId = (ArrayList)request.getAttribute("restaurantIdList");

	
	item = (String)request.getAttribute("item");
	user = (String)request.getAttribute("user");

	
	out.print("<table>");
for (int i = 0; i < listOfNames.size(); ++i) {
		
		String id = listOfId.get(i);
		String name = listOfNames.get(i);
		String vote = listOfVotes.get(i);
		String location = listOfLocations.get(i);
		String rating = listOfRatings.get(i);
		
		out.print("<tr><td><font color=\"red\" size=\"5\">"+name+"</font></td><td><font color=\"green\" size=\"3\">"+rating+"</font></td></tr><tr><td><font color=\"grey\" size=\"3\">"+vote+"</font></td></tr><tr><td><font color=\"grey\" size=\"3\">"+location+"</font></td><td></td></tr>  ");
		out.print("<tr><td><form action =\"restaurantDetail.jsp\" method=\"post\" ><input type=\"hidden\" name=\"id\" value="+id+"><input type=\"hidden\" name=\"user\" value="+user+"><input type=submit value=\"Click for Details\" ></form></td></tr> <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");


}
	
out.print("</table>");
				
				
	%>
	
	
	

</div>

</body>
</html>