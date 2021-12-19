<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <style>
      body {
        font-family: Consolas, monospace;
        font-family: 12px;
      }
      table {
        width: 100%;
      }
      th, td {
        padding: 10px;
        border-bottom: 1px solid #dadada;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Info</th>

          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <?php
          $conn = mysqli_connect( 'localhost', 'root', '111111', 'opentutorials' );
          $delete_pwd = $_POST[ 'delete_pwd' ];

          if ( isset( $delete_pwd ) ) {
            $sql_delete = "DELETE FROM member WHERE pwd = '$delete_pwd';";
            mysqli_query( $conn, $sql_delete );
            echo '<p style="color: red;">User is deleted.</p>';
          }

          $sql = "SELECT * FROM member";
          $result = mysqli_query( $conn, $sql );

          while( $row = mysqli_fetch_array( $result ) ) {
            $info = '
             <form action="User_info.php" method="POST">
               <input type="hidden" name="info_pwd" value="' . $row[ 'pwd' ] . '">
               <input type="submit" value="Info">
             </form>
           ';

            $delete = '
              <form action="User.php" method="POST">
                <input type="hidden" name="delete_pwd" value="' . $row[ 'pwd' ] . '">
                <input type="submit" value="Delete">
              </form>
            ';
            echo '<tr><td>' . $row[ 'id' ] . '</td><td>'. $row[ 'name' ] . '</td>
            <td>' . $info . '</td><td>' . $delete . '</td></tr>';
          }
        ?>
      </tbody>
    </table>
  </body>
</html>