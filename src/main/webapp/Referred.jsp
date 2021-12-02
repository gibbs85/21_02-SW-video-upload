<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dongok.Query" %>
<%@ page import="dongok.Post" %>
<%@ page import="dongok.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="dongok.css">
<title>추천 영상 조회</title>
</head>
<body>
<!-------------------------------------------------------네비게이션------------------------------------------------------->

<!--  css필요함. head에 <link rel="stylesheet" href="dongok.css"> -->
	<div id="div_nav_container">
		<div id="div_nav_button">
		
	<!-- 로그인되지 않았을 때 -->
	<% if(session.getAttribute("id") == null) { %>
			<button type="button" class="nav" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav" style="float: right;" onclick="location.href='UserJoin.jsp' ">회원가입</button>
			<button type="button" class="nav" style="float: right;" onclick="location.href='Login.jsp' ">로그인</button>
			
	<!-- 유저타입 == 0. admin -->
	<%	} else if((Integer)session.getAttribute("user_type") == 0) {%>
			<button type="button" class="nav" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav" style="float: right;" >회원관리</button>
			<button type="button" class="nav" style="float: right;"  onclick="location.href='LogOut.jsp' ">로그아웃</button>
			
	<!-- 유저타입 == 1. 튜터 -->
	<% } else if((Integer)session.getAttribute("user_type") == 1){ %>
			<button type="button" class="nav" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav" style="float: right;" onclick="location.href='TutorUploaded.jsp' ">영상관리</button>
			<button type="button" class="nav" style="float: right;"   onclick="location.href='LogOut.jsp' ">로그아웃</button>
			
	<!-- 유저타입 == 2. 튜티 -->
	<% } else if((Integer)session.getAttribute("user_type") == 2){%>
			<button type="button" class="nav" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav" style="float: right; width:100px;" onclick="location.href='Referred.jsp' ">추천영상조회</button>
			<button type="button" class="nav" style="float: right;"   onclick="location.href='LogOut.jsp' ">로그아웃</button>
	<% } %>
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
	
<!-------------------------------------------------------추천 영상 목록------------------------------------------------------->
	<%
		//session에서 튜티 정보 받아오기
		String tutie_id = (String)session.getAttribute("id");
		Query sql = new Query();
		ResultSet user = sql.search_user_byID(tutie_id);
		user.next();
		String user_id = user.getNString("id");
		String name = user.getNString("name");
		String email = user.getNString("email");
		String message = user.getNString("message");
		User tutie = new User(user_id, "NONE", name, email, 1, message);
		
		//튜티에게 추천된 suggestion DB 받아오기
		ResultSet suggestion = sql.search_suggested(tutie);
		
	%>	
	<div id="div_post_list">
		<table class="post_list">
			<caption id="caption_title">추천 받은 게시물</caption>
			<tr>
				<th scope="col" width="10%">게시물ID</th>
				<th scope="col" width="60%">제목</th>
				<th scope="col" width="15%">작성자</th>
				<th scope="col" width="15%">작성일</th>
			</tr>
			<%
				while (suggestion.next()){
					Post post = sql.search_post_byID(suggestion.getNString("post_id"));
					
					String id = post.post_id;
					String title = post.post_title;
					String date = post.post_date;
					String writer = post.writer_id;
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