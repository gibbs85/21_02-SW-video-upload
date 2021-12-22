<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dongok.Query" %>
<%@ page import="dongok.Post" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="dongok.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
		다른 페이지의 기능 확인을 위한 임시 페이지입니다.
		영상 상세 보기	 
 -->

<!-- submit 받은 post id로 post를 서치하고 정보를 출력합니다. -->
<!-------------------------------------------------------네비게이션------------------------------------------------------->

<!--  css필요함. head에 <link rel="stylesheet" href="dongok.css"> -->
	<div id="div_nav_container">
		<div id="div_nav_button">
		
	<!-- 로그인되지 않았을 때 -->
	<% if(session.getAttribute("id") == null) { %>
			<button type="button" class="nav_none_buttonlike" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav_none_buttonlike" style="float: right;"  onclick="location.href='UserJoin.jsp' ">회원가입</button>
			<button type="button" class="nav_none_buttonlike" style="float: right;" onclick="location.href='Login.jsp' ">로그인</button>
			
	<% } else{//로그인 되어있다면 session에서 받은 id로 User 서치
		Query sql = new Query();
		ResultSet user = sql.search_user_byID((String)session.getAttribute("id"));
		user.next();
		String user_name = user.getNString("name");//이름만 받아옴
	
	%>
	<!-- 유저타입 == 0. admin -->
		<%	if((Integer)session.getAttribute("user_type") == 0) {%>
			<button type="button" class="nav_none_buttonlike" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav_none_buttonlike" style="float: right;" >회원관리</button>
			<button type="button" class="nav_none_buttonlike" style="float: right;"  onclick="location.href='LogOut.jsp' ">로그아웃</button>
			
	<!-- 유저타입 == 1. 튜터 -->
		<% } else if((Integer)session.getAttribute("user_type") == 1){ %>
			<button type="button" class="nav_none_buttonlike" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<form action = "TutorUploaded.jsp" accept-charset="utf-8" method="get">
				<input type="hidden" name="tutor_id" value = <%=session.getAttribute("id") %>>
				<button type="submit" class="nav_none_buttonlike" style="float: right;">영상관리</button>
			</form>
			<button type="button" class="nav_none_buttonlike" style="float: right;" onClick = "location.href='borad.jsp'">글쓰기</button>
			<button type="button" class="nav_none_buttonlike" style="float: right;"   onclick="location.href='LogOut.jsp' ">로그아웃</button>
			
	<!-- 유저타입 == 2. 튜티 -->
		<% } else if((Integer)session.getAttribute("user_type") == 2){%>
			<button type="button" class="nav_none_buttonlike" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav_none_buttonlike" style="float: right; width:100px;" onclick="location.href='LikedPosts.jsp' ">추천영상조회</button>
			<button type="button" class="nav_none_buttonlike" style="float: right;"   onclick="location.href='LogOut.jsp' ">로그아웃</button>
		<% } %>
			<form action = "TEMP_Profile.jsp" accept-charset="utf-8" method="get">
				<input type="hidden" name="user_id" value = <%=session.getAttribute("id") %>>
	        	<button type="submit" class="nav_none_buttonlike" style="float: right;"><b><%=user_name%></b> 님, 환영합니다. </button>
	        </form>
	<%} %>
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
	
<!-------------------------------------------------------게시물------------------------------------------------------->
<%
 Query sql = new Query();
 Post post = sql.search_post_byID(request.getParameter("post_id"));
 %>

	<div id="div_post_list">
		<h>제목: <%=post.post_title%></h><br>
		<h>영상경로: <%=post.dir_video%></h><br>
		<h>설명: <%=post.post_content%></h><br>
		<h>작성일: <%=post.post_date%></h><br>
		<h>작성자: <%=post.writer_id %></h><br> <br> <br> <br>
	</div>
	
<!------------------------------------------------------댓글------------------------------------------------------->
<div>
	<form action="post_check.jsp" method="post" enctype="Multipart/form-data">
		<p> 댓글 </p>
        <textarea id="comment" name="comment"></textarea>
        <input type="submit" value="전송" /> 
</div>
</body>
</html>