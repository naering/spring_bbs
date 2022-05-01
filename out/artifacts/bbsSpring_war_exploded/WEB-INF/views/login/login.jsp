<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    function fn_btnSignupClick() {
        location.href = "${pageContext.request.contextPath}/login/signupForm";
    }
</script>

<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
    <meta charset="UTF-8">
    <title>로그인</title>
</head>

<body>
<!-- 로그인 Start -->
<%--<form:form class="form-signin" name="form" id="form" role="form" modelAttribute="userVo" method="post" action="${pageContext.request.contextPath}/bbs/getBbsList">--%>
<form:form class="form-signin" name="form" id="form" role="form" modelAttribute="userVo" method="get" action="${pageContext.request.contextPath}/bbs/getBbsList">
    <div><h1>로그인</h1></div>
    <div><label for="memberId">User ID</label>
        <form:input path="memberId" id="memberId" placeholder="User ID" required="" autofocus="" />
    </div>
    <div><label for="memberPwd">User Password</label>
        <form:password path="memberPwd" id="memberPwd" placeholder="User Password" required="" />
    </div>
    <button type="submit">로그인</button>
</form:form>
<button type="button" id="btnSignup" onclick="fn_btnSignupClick()">회원가입</button>
<!-- 로그인 End -->
</body>
</html>


