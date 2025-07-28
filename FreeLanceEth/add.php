<?php
$conn=mysqli_connect('localhost','root','','freelance') or die("connection failed:".mysqli_connect_error() );
error_reporting();
$ac=$_POST["action"];
if("addpost"==$ac){
    $payment=$_POST["Payment"];
    $id=$_POST["id"];
$Service=$payment/1000;
$Address=$_POST["Address"];
$dis=$_POST["Discription"];
$Pro=$_POST["pro"];
$empname=$_POST["empname"];
$date=$_POST["date"];
$type=$_POST["type"];
$image=$_POST["image"];
$title=$_POST["title"];
    $r=mysqli_query($conn,"INSERT INTO `job` (`EmployerID`, `EmployeeID`, `WrokId`, `Service Amount`, `Address`, `Payment`, `WorkName`, `Discritption`, `Date`, `EmployerName`, `Type`, `Profession`, `image`) VALUES
     ('$id', '', NULL, '$Service', '$Address', '$payment', '$title', '$dis', '$date', '$empname', '$type', '$Pro', '$image');");
   if($r){
    echo"success";
   }
   else{
      echo"no";
   }
}

?>