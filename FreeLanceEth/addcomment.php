<?php
$conn=mysqli_connect('localhost','root','','freelance') or die("connection failed:".mysqli_connect_error() );


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the comment and rate values from the request
$cont=$_POST["comment"];
$SeId=$_POST["SenderId"];
$Rid=$_POST["ReceiverId"];
$SName=$_POST["SenderName"];
$date=$_POST["Date"];
$wID=$_POST["wrokId"];
$rate = $_POST['rate'];

// Prepare and execute the SQL statement to insert the data into the database
$r=mysqli_query($conn,"INSERT INTO `notifications` (`SenderId`, `RecieverId`, `Content`, `type`, `Date`, `nid`, `wrokId`, `SenderName`)VALUES ('$SeId', '$Rid', '$cont', '6', '$date', NULL, '$wID', '$SName');");
if($r){
 echo"success";
}
else{
   echo"no";
}
$conn->close();
?>