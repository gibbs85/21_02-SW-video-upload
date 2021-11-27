package dongok;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Query {
	
	private String jdbcDriver;
	private String dbUser;
	private String dbPass;
	
	private Connection conn;
	private Statement stmt;
	
	public Query(){
		this.jdbcDriver = "jdbc:mariadb://localhost:3306/dbswvideo";
		this.dbUser = "root";
		this.dbPass = "2015211131";
		
		this.conn = null;
		this.stmt = null;
	}
	
	public ResultSet search_all(Post post) {
		try {
			this.conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			this.stmt = conn.createStatement();
			String statement =
					"SELECT *"
					+" FROM post;";
			ResultSet result = stmt.executeQuery(statement);
			
			return result;
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
		ResultSet result = null;
		return result;
	}
	
	public void insert_value(Post post) {
		try {
			this.conn = DriverManager.getConnection(this.jdbcDriver, this.dbUser, this.dbPass);
			this.stmt = conn.createStatement();
			String statement = "insert into post(post_id, dir_video, post_title, post_content, post_date, writer_id) values("
					+ "'" + post.post_id + "', '" + post.dir_video + "', '"+post.post_title+ "', '"+post.post_content+"', '"+post.post_date+"', '"+post.writer_id+"'"
					+ ");";
			stmt.executeUpdate(statement);
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
	
	public void insert_value(User user) {
		try {
			this.conn = DriverManager.getConnection(this.jdbcDriver, this.dbUser, this.dbPass);
			this.stmt = conn.createStatement();
			String statement = "insert into user(id, password, name, email, user_type, message) values("
					+ "'" +user.id+ "', '" +user.password+ "', '"+user.name+ "', '"+user.email+"', "+user.user_type+", '"+user.message+"'"
					+ ");";
			System.out.println(statement);
			stmt.executeUpdate(statement);
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
	
	public boolean check_dup(User user) {
		try {
		this.conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		this.stmt = conn.createStatement();
		String statement = 
				"SELECT id"
				+" FROM user"
				+" WHERE id = '" + user.id + "'";
		ResultSet result = stmt.executeQuery(statement);
		
		if (result.next())
			return true;
		else
			return false;
		
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
		return true;
	}
	
	public boolean check_dup(Post post) {
		try {
		this.conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		this.stmt = conn.createStatement();
		String statement = 
				"SELECT post_id"
				+" FROM post"
				+" WHERE post_id = '" + post.post_id + "'";
		ResultSet result = stmt.executeQuery(statement);
		
		if (result.next())
			return true;
		else
			return false;
		
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
		return true;
	}

}
