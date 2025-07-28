<?php
$conn=mysqli_connect('localhost','root','','freelance') or die("connection failed:".mysqli_connect_error() );
error_reporting();
$ac=$_POST["action"];

 if("update"==$ac){
    $EmId=$_POST["EmployeeId"];
    $ID=$_POST["Id"];

        $r=mysqli_query($conn,"UPDATE `job` SET `EmployeeID` = '$EmId' WHERE `job`.`WrokId` = '$ID';");
       if($r){
        echo"success";
       }
       else{
          echo"no";
       }
    }

?>