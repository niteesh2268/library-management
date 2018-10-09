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
body { margin-top: 5%; margin-right: 10%; margin-left: 10%;
		background-image: url("wall.jpeg");
  	background-size: 100% 100%;
  background-attachment:fixed; }	

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Restaurants</title>
</head>
<body>
<div align="center">
<h2> Add new Restaurant</h2>
<br>

<form method="post" action="AddRestaurant" id="form">
  
		<div align="center">
		<table>
		<tr>
		<td><font size="5px">Id</font>  </td>
		<td><input type='text' name='id'> </td>
		</tr>

		<tr>
		<td><font size="5px">Name</font>  </td>
		<td><input type='text' name='name'> </td>
		</tr>

		<tr>
		<td><font size="5px">Locality</font>  </td>
		<td><input type='text' name='locality'> </td>
		</tr>

		<tr>
		<td><font size="5px">Address</font>  </td>
		<td><input type='text' name='address'> </td>
		</tr>

		<tr>
		<td><font size="5px">Menu Link</font>  </td>
		<td><input type='text' name='menu_link'> </td>
		</tr>

		<tr>
		<td><font size="5px">Phone Number</font>  </td>
		<td><input type='text' name='phone'> </td>
		</tr>

		<tr>
		<td><font size="5px">Cost per Person</font>  </td>
		<td><input type='text' name='cost'> </td>
		</tr>

		<tr></tr><tr></tr><tr></tr><tr></tr>
		<tr></tr><tr></tr><tr></tr><tr></tr>

		<tr>
		<td></td>
		<td> <input type="submit" name="submit" id="submit" value="Submit" /> </td>
		</tr> 
			
			
		</table>	
		<br><br>


        </div>
		
</form>

</div>



</body>
</html>