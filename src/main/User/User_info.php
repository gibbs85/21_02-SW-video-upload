<?php
  $info_pwd = $_POST[ 'info_pwd' ];
  $conn = mysqli_connect( 'localhost', 'root', '111111', 'opentutorials' );
  $sql_info = "SELECT * FROM member WHERE pwd = $info_pwd;";
  $result = mysqli_query( $conn, $sql_info );
  $row = mysqli_fetch_array( $result );

?>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <style>
      body {
        font-family: Consolas, monospace;
        font-family: 12px;
      }
    </style>
  </head>
  <body>
    <h1>Info User</h1>
      <input type="hidden" name="id" value="<?php echo $row[ 'id' ]; ?>">
      <p>ID <?php echo $row[ 'id' ]; ?></p>
      <p>Password <?php echo $row[ 'pwd' ]; ?></p>
      <p>Name <?php echo $row[ 'name' ]; ?></p>
      <p>Email <?php echo $row[ 'email' ]; ?></p>
      <p>Memo <?php echo $row[ 'memo' ]; ?></p>
    <?php
        $edit = '
         <form action="User_edit.php" method="POST">
           <input type="hidden" name="edit_pwd" value="' . $row[ 'pwd' ] . '">
           <input type="submit" value="Edit">
         </form>
       ';
       $delete = '
         <form action="User.php" method="POST">
           <input type="hidden" name="delete_pwd" value="' . $row[ 'pwd' ] . '">
           <input type="submit" value="Delete">
         </form>
       ';
        echo '<tr><td>' . $edit . '</td><td>' . $delete . '</td></tr>';

    ?>
        <input type="button" value="뒤로가기" onclick="javascripｔ:history.go(-1)">

  </body>
</html>
