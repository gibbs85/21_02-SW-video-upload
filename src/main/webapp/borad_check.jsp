<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		String post_id 
		String dir_video = request.getparameter("fileName");
		String post_title = request.getparameter("subject");
		String post_content 
		String post_date
		String writer_id = request.getParameter("id");
		String dbName = "dbswvideo";
		String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
		String dbUser = "root";
		String dbPass = "0125";
		
		Connection conn = null;
		Statement stmt = null;
		
		String insert_value_single = "INSERT INTO post(post_id, dir_video, post_title, post_content, post_date, writer_id) VALUES (?,?,?,?,?,?);";
		String driver = "org.mariadb.jdbc.Driver";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.preepareStatement(insert_value_single);
		
		stmt.setString(1, post_id);
		stmt.setString(2, dir_video);
		stmt.setString(3, post_title);
		stmt.setString(4, post_content);
		stmt.setString(5, post_date);
		stmt.setString(6, writer_id);
	} catch (NumberFormatException e) {%>
	<p>error</p> <%}%>
</body>
</html>