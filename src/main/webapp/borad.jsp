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
	<%
		//세션 확인
		if(session.getAttribute("id")==null){%>
		<div style="position: absolute; right: 20px; bottom: 600px;" >
		<a href="Login.jsp">
			로그인을 해주세요	</a>
		</div>
	<% } else { %>
		<div style="position: absolute; right: 20px; bottom: 600px;" >
		<%=(String)session.getAttribute("id") %>
		<%
			//튜터(1)
			if((Integer)session.getAttribute("user_type") == 1){%>
			<span>
				튜터님이 로그인 중입니다!
			</span>
			<a href="LogOut.jsp">로그아웃</a>
			
			<% } 
				//튜티(2)
				else if((Integer)session.getAttribute("user_type") == 2){%>
				<a href="Main.jsp">권한이 없습니다.</a>
				
			<%  } 
				//관리자(0)
				else { %>
				<span>
				관리자님이 로그인 중입니다!
				</span>
				<a href="LogOut.jsp">로그아웃</a>
		<% 		} 
			}
	%>
</body>
</html>