<?php
  $edit_pwd = $_POST[ 'edit_pwd' ];
  $conn = mysqli_connect( 'localhost', 'root', '111111', 'opentutorials' );
  $sql_edit = "SELECT * FROM member WHERE pwd = $edit_pwd;";
  $result = mysqli_query( $conn, $sql_edit );
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
    <h1>Edit User</h1>
    <form action="User_update.php" method="POST">
      <input type="hidden" name="id" value="<?php echo $row[ 'id' ]; ?>">
      <p>ID <?php echo $row[ 'id' ]; ?></p>
      <p>Password <input type="text"size="20" maxlength="20" name="pwd" value="<?php echo $row[ 'pwd' ]; ?>" required></p>
      <p>Name <input type="text" size="10" maxlength="10" name="name" value="<?php echo $row[ 'name' ]; ?>" required></p>
      <p>Email <input type="text" size="30" maxlength="30" name="email" value="<?php echo $row[ 'email' ]; ?>" required></p>
      <p>Memo <input type="text" size="60" maxlength="60" name="memo" value="<?php echo $row[ 'memo' ]; ?>" required></p>

      <button>Edit</button>
      <input type="button" value="뒤로가기" onclick="javascripｔ:history.go(-1)">
    </form>
  </body>
</html>
