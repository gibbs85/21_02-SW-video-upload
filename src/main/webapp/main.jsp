<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dongok.Query" %>
<%@ page import="dongok.Post" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="dongok.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-------------------------------------------------------네비게이션------------------------------------------------------->
	<div id="div_nav_container">
		<div id="div_nav_button">
			<button type="button" class="nav" style="float: left;">홈 아이콘</button>
			<button type="button" class="nav" style="float: right;">회원가입</button>
			<button type="button" class="nav" style="float: right;">로그인</button>
		</div>
		<br>
		<br>
		<br>
		<br>
		<div style="clear:both;">
			<form id="form_searchbox">
				<input type="text" id="textfield_search_main" placeholder="검색어를 입력하세요." style="float: center;">
				<input type="submit" id="button_search" name="button_search" value="검색" style="float: center;">
			</form>
		</div>
	</div>

<!-------------------------------------------------------게시물 목록------------------------------------------------------->
	<br>
	<br>
	<br>
	<br>
	<div id="div_post_list">
		<table class="post_list">
			<caption id="caption_title">전체글보기</caption>
			<tr>
				<th scope="col" width="10%">게시물ID</th>
				<th scope="col" width="60%">제목</th>
				<th scope="col" width="15%">작성자</th>
				<th scope="col" width="15%">작성일</th>
			</tr>
			<%
			Post post = new Post("NONE", "NONE", "NONE", "NONE", "NONE", "NONE");//임시 객체
			Query sql = new Query();
			ResultSet search = sql.search_all(post);//post 전체 resultset
			%>
			<%
				while (search.next()){
					String id = search.getNString("post_id");
					String title = search.getNString("post_title");
					String date = search.getNString("post_date");
					String writer = search.getNString("writer_id");
			%>
			<tr>
				<td align="center"> <%=id %></td>
				<td> <%=title %></td>
				<td align="center"> <%=writer %></td>
				<td align="center"> <%=date %></td>
				<%
					}
				%>
			</tr>
		</table>
	</div>
</body>
</html>