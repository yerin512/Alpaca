<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>

        <h1>로그인 성공입니다</h1>
        
 
<a href="https://kauth.kakao.com/oauth/logout?client_id=4d6c516eb262829dabdcac45cae9703c&logout_redirect_uri=http://localhost:8090/trip/login"><input type="button" value="로그아웃" onclick="location.href='${contextPath}/logout'"></a>
</body>
</html>
