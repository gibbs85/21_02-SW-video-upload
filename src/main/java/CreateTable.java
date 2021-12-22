import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * 관련 비기능 요구사항
 * 영상제목(게시물 제목) 20글자 이내
 * 영상설명 100글자 이내
 * 튜티는 영상추천/비추천 이벤트를 영상 한 개당 하나씩만
 */

/*
 * ----------수정 사항----------
 * 2021/12/16 박동옥
 * 		post_title varchar(128) -> varchar(20)
 * 		post_content varchar(512) -> varchar(100)
 * 		statement_suggestion 은 삭제 예정
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
					+"post_title varchar(20) NOT NULL,"//
					+"post_content varchar(100) NOT NULL,"
					+"post_date varchar(8) NOT NULL,"
					+"writer_id varchar(20) NOT NULL,"
					+"foreign key(writer_id) references user(id));";
			
			String create_table_statement_comment =
					"CREATE TABLE IF NOT EXISTS comment("
					+"comment_id int(10) NOT NULL AUTO_INCREMENT primary key,"
					+"post_id varchar(10) NOT NULL,"
					+"foreign key(post_id) references post(post_id),"
					+"comment_content varchar(128) NOT NULL,"
					+"comment_writer_id varchar(20) NOT NULL,"
					+"foreign key(comment_writer_id) references user(id));";
			
			String create_table_statement_upvote =
					"CREATE TABLE IF NOT EXISTS upvote("
					+"upvoter_id varchar(20) NOT NULL,"
					+"upvoted_post_id varchar(10) NOT NULL,"
					+"primary key (upvoter_id, upvoted_post_id),"
					+"foreign key(upvoter_id) references user(id),"
					+"foreign key(upvoted_post_id) references post(post_id),"
					+"upvote int NOT NULL);"; // 1 == 추천, -1 == 비추천, 0은 table에서 삭제
					
					
					
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
