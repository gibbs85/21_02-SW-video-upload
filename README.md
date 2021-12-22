# 21_02-SW-video-upload

본인 PC의 서버와 DB설정 참고사항

		.jdbcDriver = "jdbc:mariadb://localhost:3306/dbswvideo";
		.dbUser = "root";
		.dbPass = "2015211131";
    
    와 같은 부분을 자기 환경에 맞게 바꾸면 됨.
    
    src/main/java/dongok/Query.java 라인 19~21
    src/main/java/CreateTable.java 라인 14~16
    src/main/webapp/JoinCheck.jsp 라인 13~15
    src/main/webapp/LoginCheck.jsp 라인 13~15
    src/main/webapp/boradCheck.jsp 라인 13~15
    src/main/webapp/IdCheck.jsp 라인 13~15
    src/main/webapp/post_check.jsp 라인 24~26
    src/main/webapp/SearchInfo.jsp 라인 13~15
    src/main/webapp/VideoTutorFind.jsp 라인 54~56
    
    
    
    
    


Import문 주의
    <%@ page import="dongok.Query" %>
    <%@ page import="dongok.Post" %>
    와 같은 부분들 있음. 실행이 안되거나 페이지가 이상하게 보인다면 살펴볼 것.
