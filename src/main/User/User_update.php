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
    <?php
      $id = $_POST[ 'id' ];
      $pwd = $_POST[ 'pwd' ];
      $name = $_POST[ 'name' ];
      $email = $_POST[ 'email' ];
      $memo = $_POST[ 'memo' ];

      if ( is_null( $id ) ) {
        echo '<h1>Fail!</h1>';
      } else {
        $conn = mysqli_connect( 'localhost', 'root', '111111', 'opentutorials' );
        $sql = "UPDATE member SET pwd = '$pwd', name = '$name', email = '$email', memo = '$memo' WHERE id = $id;";
        mysqli_query( $conn, $sql );
        echo '<h1>Success!</h1>';
      }
    ?>
    <p>
      <a href="User.php">User Lists</a>
     </p>
  </body>
</html>
