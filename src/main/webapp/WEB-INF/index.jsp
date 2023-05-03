<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국가경보</title>
</head>
<body>
  <div  style="text-align: center" >
		<c:choose>
			<c:when test="${sessionScope.logon }">
				<div style="margin-right: 30px; padding-top:4px;">
					<b>${logonUser.nick }</b>
					<a href="/user/logout">로그아웃</a>
				</div>
				
			</c:when>
			<c:otherwise>
				<div style="padding: 10px 20px;">
					<a href="/user/login">로그인</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>