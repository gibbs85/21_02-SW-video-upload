<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인창</title>
<style>
#container{
text-align:center;
}
</style>
</head>
<body>
<div id="container">
<h1>Main</h1>
<% // 세션확인 -> 로그인이 되어있지 않을 때 
	if(session.getAttribute("id")==null){%>
	<div style="position: absolute; right: 20px; bottom: 600px;" >
		<a href="Login.jsp">
		로그인을 해주세요
		</a>
	</div>
	
	<!-- 세션확인 -> 로그인이 되어있을때 -->
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
				<span>
				튜티님이 로그인 중입니다!
				</span>
				<a href="LogOut.jsp">로그아웃</a>
			<%  } 
				//관리자(0)
				else { %>
				<span>
				관리자님이 로그인 중입니다!
				</span>
				<a href="LogOut.jsp">로그아웃</a>
		<% 		} 
			}%>
	</div>
	</div>
</body>
</html>