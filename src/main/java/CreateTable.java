import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * 愿��젴 鍮꾧린�뒫 �슂援ъ궗�빆
 * �쁺�긽�젣紐�(寃뚯떆臾� �젣紐�) 20湲��옄 �씠�궡
 * �쁺�긽�꽕紐� 100湲��옄 �씠�궡
 * �뒠�떚�뒗 �쁺�긽異붿쿇/鍮꾩텛泥� �씠踰ㅽ듃瑜� �쁺�긽 �븳 媛쒕떦 �븯�굹�뵫留�
 */

/*
 * ----------�닔�젙 �궗�빆----------
 * 2021/12/16 諛뺣룞�삦
 * 		post_title varchar(128) -> varchar(20)
 * 		post_content varchar(512) -> varchar(100)
 * 		statement_suggestion �� �궘�젣 �삁�젙
 */

public class CreateTable {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		//
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/dbswvideo";
			String dbUser = "root";
			String dbPass = "2015211131";

			// 	DB Connection �깮�꽦
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			// 	Statement �깮�꽦
				stmt = conn.createStatement();

				System.out.println("this far");
			String create_table_statement_user =
					"CREATE TABLE IF NOT EXISTS user("
					+"id varchar(20) NOT NULL primary key,"
					+"password varchar(20) NOT NULL,"
					+"name varchar(10) NOT NULL,"
					+"email varchar(50) NOT NULL,"
					+"user_type int NOT NULL,"// 0 = admin, 1 = tutor, 2 = tutie
					+"message varchar(128));";
			
			String create_table_statement_post =
					"CREATE TABLE IF NOT EXISTS post("
					+"post_id int AUTO_INCREMENT,"
					+" primary key(post_id), "
					+"dir_video varchar(200) NOT NULL,"
					+"post_title varchar(20) NOT NULL,"//
					+"post_content varchar(100) NOT NULL,"
					+"post_date varchar(8) NOT NULL,"
					+"writer_id varchar(20) NOT NULL,"
					+"foreign key(writer_id) references user(id));";
			
			String create_table_statement_comment =
					"CREATE TABLE IF NOT EXISTS comment("
					+"comment_id int NOT NULL primary key AUTO_INCREMENT,"
					+"post_id int NOT NULL,"
					+"foreign key(post_id) references post(post_id),"
					+"comment_content varchar(128) NOT NULL,"
					+"comment_writer_id varchar(20) NOT NULL,"
					+"foreign key(comment_writer_id) references user(id));";
			
			String create_table_statement_upvote =
					"CREATE TABLE IF NOT EXISTS upvote("
					+"upvoter_id varchar(20) NOT NULL,"
					+"upvoted_post_id NOT NULL,"
					+"primary key (upvoter_id, upvoted_post_id),"
					+"foreign key(upvoter_id) references user(id),"
					+"foreign key(upvoted_post_id) references post(post_id),"
					+"upvote int NOT NULL);"; // 1 == 異붿쿇, -1 == 鍮꾩텛泥�, 0�� table�뿉�꽌 �궘�젣
					
					
					
			stmt.executeUpdate(create_table_statement_user);
			stmt.executeUpdate(create_table_statement_post);
			stmt.executeUpdate(create_table_statement_comment);
			stmt.executeUpdate(create_table_statement_upvote);
			//stmt.executeUpdate(alter_table_statement);
			
			System.out.println("Table_create_Sucess");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
