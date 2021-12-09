import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateTable {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		//
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/dbswvideo";
			String dbUser = "root";
			String dbPass = "2015211131";

			// 	DB Connection 생성
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			// 	Statement 생성
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
					+"post_id varchar(10) NOT NULL primary key,"
					+"dir_video varchar(200) NOT NULL,"
					+"post_title varchar(128) NOT NULL,"
					+"post_content varchar(512) NOT NULL,"
					+"post_date varchar(8) NOT NULL,"
					+"writer_id varchar(20) NOT NULL,"
					+"foreign key(writer_id) references user(id));";
			
			String create_table_statement_comment =
					"CREATE TABLE IF NOT EXISTS comment("
					+"comment_id varchar(10) NOT NULL primary key,"
					+"post_id varchar(10) NOT NULL,"
					+"foreign key(post_id) references post(post_id),"
					+"comment_content varchar(128) NOT NULL,"
					+"comment_writer_id varchar(20) NOT NULL,"
					+"foreign key(comment_writer_id) references user(id));";
			
			String create_table_statement_suggestion =
					"CREATE TABLE IF NOT EXISTS suggestion("
					+"tutor_id varchar(20) NOT NULL,"
					+"tutie_id varchar(10) NOT NULL,"
					+"post_id varchar(10) NOT NULL,"
					+"primary key (tutie_id, post_id),"
					+"foreign key(tutor_id) references user(id),"
					+"foreign key(tutie_id) references user(id),"
					+"foreign key(post_id) references post(post_id));";
					
					
					
			stmt.executeUpdate(create_table_statement_user);
			stmt.executeUpdate(create_table_statement_post);
			stmt.executeUpdate(create_table_statement_comment);
			stmt.executeUpdate(create_table_statement_upvote);
			stmt.executeUpdate(create_table_statement_suggestion);
			
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
