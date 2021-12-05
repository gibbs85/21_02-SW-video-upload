<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <?php
      $conn= mysqli_connect('localhost', 'root', '111111', 'opentutorials');
      $sql= "SELECT * FROM member";
      $result= mysqli_query($conn,$sql);
    ?>
  </head>
  <body>
    <?php
    echo "<table>";
      while($board = mysqli_fetch_array($result)){
        echo "<tr>"."<td>ID</td>"."<td>". $board['id']."</td>"."</tr>";
        echo "<tr>"."<td>name</td>"."<td>". $board['name']."</td>"."</tr>";
        echo "<tr>"."<td>email</td>"."<td>". $board['email']."</td>"."</tr>";
        echo "<tr>"."<td>memo</td>"."<td>". $board['memo']."</td>"."</tr>";
      }
      echo "</table>";
     ?>
  </body>
</html>
