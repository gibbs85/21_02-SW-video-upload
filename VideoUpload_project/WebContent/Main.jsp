<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����â</title>
<style>
#container{
text-align:center;
}
</style>
</head>
<body>
<div id="container">
<h1>Main</h1>
<% // ����Ȯ�� -> �α����� �Ǿ����� ���� �� 
	if(session.getAttribute("id")==null){%>
	<div style="position: absolute; right: 20px; bottom: 600px;" >
		<a href="Login.jsp">
		�α����� ���ּ���
		</a>
	</div>
	
	<!-- ����Ȯ�� -> �α����� �Ǿ������� -->
	<% } else { %>
	
	<div style="position: absolute; right: 20px; bottom: 600px;" >
		<%=(String)session.getAttribute("id") %>
		<%
			//Ʃ��(1)
			if((Integer)session.getAttribute("user_type") == 1){%>
			<span>
				Ʃ�ʹ��� �α��� ���Դϴ�!
			</span>
			<a href="LogOut.jsp">�α׾ƿ�</a>
			
			<% } 
				//ƩƼ(2)
				else if((Integer)session.getAttribute("user_type") == 2){%>
				<span>
				ƩƼ���� �α��� ���Դϴ�!
				</span>
				<a href="LogOut.jsp">�α׾ƿ�</a>
			<%  } 
				//������(0)
				else { %>
				<span>
				�����ڴ��� �α��� ���Դϴ�!
				</span>
				<a href="LogOut.jsp">�α׾ƿ�</a>
		<% 		} 
			}%>
	</div>
	</div>
</body>
</html>