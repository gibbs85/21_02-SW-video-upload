<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html><%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String uploadPath = request.getRealPath("/uploadFile");
out.println("절대 경로 : " + uploadPath + "<br/>");

int maxSize =1024 *1024 *10;

String name = "";
String subject = "";

String fileName1 = ""; // 중복처리
String originalName1 = ""; // 중복 처리전 실제 원본
long fileSize = 0;
String fileType = "";

MultipartRequest multi =null;


try{
	// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
    multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
  	//form내의 input name="name" 인 녀석 value를 가져옴
    name = multi.getParameter("name");
    // name="subject" 인 녀석 value를 가져옴
    subject = multi.getParameter("subject");
     
    // 전송한 전체 파일이름들을 가져옴
    Enumeration files = multi.getFileNames();
    
    while(files.hasMoreElements()){
    	// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
        String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
        // 그에 해당하는 실재 파일 이름을 가져옴
        originalName1 = multi.getOriginalFileName(file1);
        // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
        // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
        fileName1 = multi.getFilesystemName(file1);
        // 파일 타입 정보를 가져옴
        fileType = multi.getContentType(file1);
        // input file name에 해당하는 실재 파일을 가져옴
        File file = multi.getFile(file1);
        // 그 파일 객체의 크기를 알아냄
        fileSize = file.length();

    }
    }catch(Exception e){
        e.printStackTrace();
    }

%>

<form action="post_check.jsp" method="post" name="fileCheckFormName">
    <input type="hidden" value="<%=name%>" name="name" />
    <input type="hidden" value="<%=subject%>" name="subject" />
    <input type="hidden" value="<%=fileName1%>" name="fileName1" />
    <input type="hidden" value="<%=originalName1%>" name="originalName1" />
</form>
 
<!--
    a태그로 클릭시 파일체크하는 jsp페이지로 이동하도록 함
    javascript를 이용해서 onclick시 폼태그를 잡아와 submit()을 호출해 폼태그를 전송
 -->
<a href="#" onclick="javascript:document.fileCheckFormName.submit()">업로드 파일 확인하기 :<%=fileName1 %></a>


</body>
</html>