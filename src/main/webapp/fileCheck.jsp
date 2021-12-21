<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 체크</title>
</head>
<body>
<%
        // post방식에 대한 한글 인코딩 방식 지정 get방식은 서버의 server.xml에서 Connector태그에 URIEncoding="UTF-8" 추가
        request.setCharacterEncoding("UTF-8");
         
        // input type="name" 의 value값을 가져옴
        String name = request.getParameter("name");
        // input type="subject" 의 value값을 가져옴
        String subject = request.getParameter("subject");
        // 중복방지용으로 만들어져 넘겨진 파일명을 가져옴
        String fileName1 = request.getParameter("fileName1");
        // 본래의 파일명을 가져옴
        String originalName1 = request.getParameter("originalName1");
    %>

<h3>업로드 파일 확인</h3>
올린 사람 : <%=name %><br/>
제목 : <%=subject %><br/>

파일 다운로드 : <a id="downA" href="#"><%=originalName1 %></a>
<script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault();// a 태그의 기본 동작을 막음
            event.stopPropagation();// 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName1%>");
            // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
            window.location.href ="fileDown1.jsp?file_name="+fName;
        });
    </script>


</body>
</html>