<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 참가신청... 디테일..</title>

</head>
<body>
	<div>
		${targetBoard.id }
		${targetBoard.time }
		<c:choose>
			<c:when test="${sessionScope.logonUser.id eq targetBoard.writer }">				
				<form action="">
					<input type="hidden" name="countryNm" value="${countryNm }">
					<a href="/deleteBoard?bradId=${targetBoard.id }">삭제</a>
				</form>
			</c:when>
			<c:otherwise>
				<p>신청</p>
			</c:otherwise>
		</c:choose>
		
	</div>
</body>
</html>