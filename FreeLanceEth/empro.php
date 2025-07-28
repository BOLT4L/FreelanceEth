<?php

$conn=mysqli_connect('localhost','root','','freelance') or die("connection failed:".mysqli_connect_error() );
error_reporting();
$ac=$_POST["action"];

  if("employee"==$ac){
   $fname = $_POST["fname"];
   $lname = $_POST["lname"];
   $address = $_POST["address"];
   $email = $_POST["email"];
   $dis = $_POST["detail"];
   $ph = $_POST["phone"];
   $pro = $_POST["profession"];
   $data=$_POST["data"];
  $datas=$_POST["datas"];
   $pimage=$_POST["name"];
   $cimage=$_POST["cimage"];
   $date=$_POST["date"];
   $age=$_POST["age"];
   $password = $_POST["password"];
   $path="upload/$pimage";
   $paths="upload/$cimage";
   $query = "INSERT INTO `employee` (`FirstName`, `LastName`, `Age`, `PhoneNumber`, `Email`, `Profession`, `Address`, `ProfileImage`, `Certificate`, `Date`, `Password`, `Detail`) 
   VALUES ('$fname', '$lname', '$age', '$ph', '$email', '$pro', '$address', '$pimage', '$cimage', '$date', '$password', '$dis');";
    $exe = mysqli_query($conn, $query);
    if($exe){
      echo"success";
    }
    else{
      echo"no";
    }
   file_put_contents($path,base64_decode($data));
  file_put_contents($paths,base64_decode($datas));
  
  }
   else if("employer"==$ac){
      $fname = $_POST["fname"];
      $lname = $_POST["lname"];
      $address = $_POST["address"];
      $email = $_POST["email"];
      $dis = $_POST["detail"];
      $ph = $_POST["phone"];
      $pro = $_POST["profession"];
      $data=$_POST["data"];
      $datas=$_POST["datas"];
      $pimage=$_POST["name"];
      $cimage=$_POST["cimage"];
      $date=$_POST["date"];
      $age=$_POST["age"];
      $password = $_POST["password"];
      $path="upload/$pimage";
      $paths="upload/$cimage";
      $query = "INSERT INTO `employer` (`FirstName`, `LastName`, `Id`, `Discription`, `Address`, `Phonenumber`, `Email`, `Password`, `ProfileImage`, `Profession`, `type`)
       VALUES ('$fname', '$lname', NULL, '$dis', '$address', '$ph', '$email', '$password', '$pimage', '$pro', '2');";
      file_put_contents($path,base64_decode($data));
      $exe = mysqli_query($conn, $query);
     }
  
else if("addpost"==$ac){
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

 else if("updatepass"==$ac){
    $pass=$_POST["pass"];
    $ID=$_POST["Id"];
    $type=$_POST["type"];
        $r=mysqli_query($conn,"UPDATE `$type` SET `Password` = '$pass' WHERE `$type`.`Id` = '$ID';");
       if($r){
        echo"success";
       }
       else{
          echo"no";
       }
    }
    else if("update"==$ac){
      $EmId=$_POST["EmployeeId"];
      $ID=$_POST["Id"];

          $r=mysqli_query($conn,"UPDATE `job` SET `EmployeeID` = '$EmId' WHERE `job`.`Id` = '$ID';");
         if($r){
          echo"success";
         }
         else{
            echo"no";
         }
      }
      
    else if("DeleteAcc"==$ac){
        $type=$_POST["type"];
        $ID=$_POST["Id"];
        $r=mysqli_query($conn,"DELETE FROM `$type` WHERE `job`.`Id` = '$ID'");
       if($r){
        echo"success";
       }
       else{
          echo"no";
       }
        }
    else if("updatephone"==$ac){
        $ph=$_POST["phone"];
        $ID=$_POST["Id"];
        $type=$_POST["type"];
            $r=mysqli_query($conn,"UPDATE `$type` SET `Phonenumber` = '$ph' WHERE `$type`.`Id` = '$ID';");
           if($r){
            echo"success";
           }
           else{
              echo"no";
           }
        }
else if("approve"==$ac){
$cont=$_POST["Content"];
$SeId=$_POST["SenderId"];
$Rid=$_POST["ReceiverId"];
$type=$_POST["type"];
$SName=$_POST["SenderName"];
$date=$_POST["Date"];
$wID=$_POST["wrokId"];
    $r=mysqli_query($conn,"INSERT INTO `notifications` (`SenderId`, `RecieverId`, `Content`, `type`, `Date`, `nid`, `wrokId`, `SenderName`)VALUES ('$SeId', '$Rid', '$cont', '$type', '$date', NULL, '$wID', '$SName');");
   if($r){
    echo"success";
   }
   else{
      echo"no";
   }
}
else if("delete"==$ac){
    $wID=$_POST["Wid"];
        $r=mysqli_query($conn,"DELETE FROM job WHERE `job`.`WrokId` = '$wID'");
       if($r){
        echo"success";
       }
       else{
          echo"no";
       }
    }
    
else if("read"==$ac){
    $nid=$_POST["nid"];
        $r=mysqli_query($conn,"UPDATE `notifications` SET `status` = '0' WHERE `notifications`.`nid` = '$nid';");
       if($r){
        echo"success";
       }
       else{
          echo"no";
       }
    }
else{
    echo"nso";
}
$conn->close();
return;
?>