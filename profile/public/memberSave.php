<!DOCTYPE html>
<html>
   <meta charset="utf-8">
<?php

$host = 'localhost';
$user = 'root';
$pw = '111111';
$dbName = 'opentutorials';
$mysqli = new mysqli($host, $user, $pw, $dbName);

 $id=$_POST['id'];
 $password=($_POST['pwd']);
 $name=$_POST['name'];
 $email=$_POST['email'];
 $memo=$_POST['memo'];


 $sql = "insert into member (id, pwd, name, email,memo)";
 $sql = $sql. "values('$id','$password','$name','$email', '$memo')";
 if($mysqli->query($sql)){
  echo 'success <p/>';
 }else{
  echo 'fail to insert sql';
 }
mysqli_close($mysqli);


?>
</html>
