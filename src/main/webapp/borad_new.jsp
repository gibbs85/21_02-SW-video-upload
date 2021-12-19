<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<!-------------------------------------------------------네비게이션------------------------------------------------------->

<!--  css필요함. head에 <link rel="stylesheet" href="dongok.css"> -->
	<div id="div_nav_container">
		<div id="div_nav_button">
		
	<!-- 로그인되지 않았을 때 -->
	<% 	if(session.getAttribute("id") == null) { %>
			<button type="button" class="nav" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav" style="float: right;"  onclick="location.href='UserJoin.jsp' ">회원가입</button>
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
			<button type="button" class="nav" style="float: right;" onClick = "location.href='borad.jsp'">글쓰기</button>
			<button type="button" class="nav" style="float: right;"   onclick="location.href='LogOut.jsp' ">로그아웃</button>
			
	<!-- 유저타입 == 2. 튜티 -->
	<% } else if((Integer)session.getAttribute("user_type") == 2){%>
			<button type="button" class="nav" style="float: left;" onclick="location.href='Main.jsp' ">홈 아이콘</button>
			<button type="button" class="nav" style="float: right; width:100px;" onclick="location.href='Referred.jsp' ">추천영상조회</button>
			<button type="button" class="nav" style="float: right;"   onclick="location.href='LogOut.jsp' ">로그아웃</button>
	<% } 
		String user_id = (String) session.getAttribute("id"); 
	%>
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
	<br>
	<br>
	<br>
    	<form action="filecheck.jsp" method="post" enctype="Multipart/form-data">
        	올린 사람 : <%=user_id %><br/>
        	제목 : <input type="text" name="subject" /><br/>
        	<!--
	            파일 업로드는 input type="file"로 지정한다.
    	     -->
        	파일명1 : <input type="file" name="fileName1" /><br/>
        	<input type="submit" value="전송" />  
        	<input type="reset" value="취소" />
    </form>
	<div>
	
	</div>

</body>
</html>
