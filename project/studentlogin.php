<?php
echo'<html>
<body>
<style>
input[type=text], select {
    width: 30%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=Password], select {
    width: 30%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=Number], select {
    width: 30%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 10%;
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
div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 200px;
}
</style>
<form action="returnresources.php" method="post" >
<input type="text" name="studentname" placeholder="Name">
<br>
<input type="Number" name="rollnumber" placeholder="rollnumber">
<br>';
echo '<select name="nameofresource">';
$dbname = 'project';
if (!mysql_connect('localhost', 'root', 'Teja!1995')) {
    echo 'Could not connect to mysql';
    exit;
}
$sql = "SHOW TABLES FROM $dbname";
$result = mysql_query($sql);
if (!$result) {
    echo "DB Error, could not list tables\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}
while ($row = mysql_fetch_row($result)) {
	if($row[0] !== "login" && $row[0] !=="claimers"){
		echo $row[0];
		echo '<option value='.$row[0].'>'.$row[0].'</option>';
	}
}
mysql_free_result($result);
echo "</select>";
echo "<br>";
echo '<input type="Number" name="id" placeholder="Id of Return (Not required when you Claim) :">
<br>
<input type="Number" name="idresource" placeholder="Id of Resource :">
<br>
<input type="Number" name="num" placeholder="Number of Resources :">
<br>
<br>
<input type="submit" name="return" value="Return" />
<input type="submit" name="claim" value="Claim" />
</form>
</body>
</html>';
?>
