<?php

$conn=mysqli_connect('localhost','root','','freelance') or die("connection failed:".mysqli_connect_error() );

    $db_data = array();
    $result=mysqli_query($conn,"SELECT * FROM notifications ORDER BY nid DESC");
    if($result->num_rows>0){
            while($row = $result->fetch_assoc()){
                        $db_data[]=$row;
    }
  
    $dar = json_encode($db_data);
    echo $dar;
}
else{
    echo'error';
}
$conn->close();
return;

?>