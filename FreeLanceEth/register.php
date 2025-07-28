<?php 
$conn=mysqli_connect('localhost','root','','freelance') or die("connection failed:".mysqli_connect_error() );
$account = $_POST["account"];
if(isset($_POST["account"])){
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
}
if("employee"==$account){
 $query = "INSERT INTO `employee` (`FirstName`, `LastName`, `Age`, `PhoneNumber`, `Email`, `Profession`, `Address`, `ProfileImage`, `Certificate`, `Date`, `Service Amount`, `Password`, `Detail`, `Id`, `rate`, `type`) 
 VALUES ('name', 'name', '$', 'ph', 'email', 'pro', 'address', 'pimage', 'cimage', 'date', '3', 'password', 'dis', NULL, '1', '1');";
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
 if("employer"==$account){
    $query = "INSERT INTO `employer` (`FirstName`, `LastName`, `Id`, `Discription`, `Address`, `Phonenumber`, `Email`, `Password`, `ProfileImage`, `Profession`, `type`)
     VALUES ('$fname', '$lname', NULL, '$dis', '$address', '$ph', '$email', '$password', '$pimage', '$pro', '2');";
    file_put_contents($path,base64_decode($data));
    $exe = mysqli_query($conn, $query);
   }

   $arr = [];
  
 if ($exe) {
    echo'true';
    $arr['success'] = 'true'; 
 } else {
    echo'false';
    $arr['success'] = 'false';
 }
 $dar = json_encode($arr);
 echo $dar;
   


?>