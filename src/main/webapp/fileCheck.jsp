<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� üũ</title>
</head>
<body>
<%
        // post��Ŀ� ���� �ѱ� ���ڵ� ��� ���� get����� ������ server.xml���� Connector�±׿� URIEncoding="UTF-8" �߰�
        request.setCharacterEncoding("UTF-8");
         
        // input type="name" �� value���� ������
        String name = request.getParameter("name");
        // input type="subject" �� value���� ������
        String subject = request.getParameter("subject");
        // �ߺ����������� ������� �Ѱ��� ���ϸ��� ������
        String fileName1 = request.getParameter("fileName1");
        // ������ ���ϸ��� ������
        String originalName1 = request.getParameter("originalName1");
    %>

<h3>���ε� ���� Ȯ��</h3>
�ø� ��� : <%=name %><br/>
���� : <%=subject %><br/>

���� �ٿ�ε� : <a id="downA" href="#"><%=originalName1 %></a>
<script type="text/javascript">
        // ���������� �׳� �ٿ�ε� Ŭ���� �����۵������� �ѱ����ϸ��� ���������� ������� ���ڵ� ������ �߻��� �� �ִ�. �ѱ��� ���� �����۵����� ���� �� ����
        // ����, �������ڿ��� �ѱ��� ���� ���� �׻� ���ڵ��� �ؼ� �����ֵ��� ����.
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault();// a �±��� �⺻ ������ ����
            event.stopPropagation();// �̺�Ʈ�� ���ĸ� ����
            // fileName1�� utf-8�� ���ڵ��Ѵ�.
            var fName = encodeURIComponent("<%=fileName1%>");
            // ���ڵ��� �����̸��� �������ڿ��� ���Խ��� �ٿ�ε� �������� �̵�
            window.location.href ="fileDown1.jsp?file_name="+fName;
        });
    </script>


</body>
</html>