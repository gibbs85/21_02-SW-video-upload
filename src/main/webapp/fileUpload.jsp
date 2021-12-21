<%@page import="java.io.File"%>
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
out.println("���� ��� : " + uploadPath + "<br/>");

int maxSize =1024 *1024 *10;

String name = "";
String subject = "";

String fileName1 = ""; // �ߺ�ó��
String originalName1 = ""; // �ߺ� ó���� ���� ����
long fileSize = 0;
String fileType = "";

MultipartRequest multi =null;


try{
	// request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
    multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
  	//form���� input name="name" �� �༮ value�� ������
    name = multi.getParameter("name");
    // name="subject" �� �༮ value�� ������
    subject = multi.getParameter("subject");
     
    // ������ ��ü �����̸����� ������
    Enumeration files = multi.getFileNames();
    
    while(files.hasMoreElements()){
    	// form �±׿��� <input type="file" name="���⿡ ������ �̸�" />�� �����´�.
        String file1 = (String)files.nextElement();// ���� input�� ������ �̸��� ������
        // �׿� �ش��ϴ� ���� ���� �̸��� ������
        originalName1 = multi.getOriginalFileName(file1);
        // ���ϸ��� �ߺ��� ��� �ߺ� ��å�� ���� �ڿ� 1,2,3 ó�� �پ� unique�ϰ� ���ϸ��� �����ϴµ�
        // �̶� ������ �̸��� filesystemName�̶� �Ͽ� �� �̸� ������ �����´�.(�ߺ��� ���� ó��)
        fileName1 = multi.getFilesystemName(file1);
        // ���� Ÿ�� ������ ������
        fileType = multi.getContentType(file1);
        // input file name�� �ش��ϴ� ���� ������ ������
        File file = multi.getFile(file1);
        // �� ���� ��ü�� ũ�⸦ �˾Ƴ�
        fileSize = file.length();

    }
    }catch(Exception e){
        e.printStackTrace();
    }

%>

<form action="fileCheck.jsp" method="post" name="fileCheckFormName">
    <input type="hidden" value="<%=name%>" name="name" />
    <input type="hidden" value="<%=subject%>" name="subject" />
    <input type="hidden" value="<%=fileName1%>" name="fileName1" />
    <input type="hidden" value="<%=originalName1%>" name="originalName1" />
</form>
 
<!--
    a�±׷� Ŭ���� ����üũ�ϴ� jsp�������� �̵��ϵ��� ��
    javascript�� �̿��ؼ� onclick�� ���±׸� ��ƿ� submit()�� ȣ���� ���±׸� ����
 -->
<a href="#" onclick="javascript:document.fileCheckFormName.submit()">���ε� ���� Ȯ���ϱ� :<%=fileName1 %></a>


</body>
</html>