<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String path = request.getRealPath("videofile");
	out.println("절대 경로 : "+path+"<br/r>");
	
	int size = 1024*1024*10;
	String fileName = "";
	String originalFileName ="";
	
	try{
		
		MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		fileName = multi.getFilesystemName(str);
		
		originalFileName = multi.getOriginalFileName(str);
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Upload Result</title>
</head>
<body>
<h1>File Upload Result</h1>
<hr>
<h2><span>file upload success!!</span></h2>
</body>
</html>