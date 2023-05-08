<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국가경보</title>
<style>
* {
	font-family: 'GmarketSansMedium';
	padding: 5px;
}

body {
	background-image: url('/resource/image/worldmap3.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-position: top;
	background-size: cover;
}
</style>
<link rel="stylesheet" href="/resource/style.css">
</head>
<body>
	<div style="text-align: center">
		<div style="text-align: center">제목영역입니다</div>

		<c:choose>
			<c:when test="${sessionScope.logon }">
				<div style="margin-right: 30px; padding-top: 4px;">
					<b>${logonUser.nick }</b> <a href="/user/logout">로그아웃</a>
				</div>

			</c:when>
			<c:otherwise>
				<div align="right" style="">
					<a href="/user/login">로그인</a> <a href="/user/join">회원가입</a>
				</div>
			</c:otherwise>
		</c:choose>
		<div style="justify-content: center;">
			<div style="padding: 100px; text-align: center; margin-left: 55px">
				<%--
				<img src="/resource/image/worldmap.png" style="opacity: 0.5; justify-content: content;">
				--%>
				<form action="/search">
					<%--
				<input type="text" name="countryNm" style="width: 350px; height: 45px;"> <button type="submit">돋보기</button>	
				--%>
					<input type="text" name="countryNm" class="searchBox"
						style="width: 350px; height: 45px;" id="q" list="qlist"
						autocomplete="off">
					<datalist id="qlist">

					</datalist>
					<button type="submit">돋보기</button>
				</form>
			</div>
			<%--
			<p><a href="/caution?alarmLvl=1"><img src="/resource/image/step1.png"/></a></p>
			<p><a href="/caution?alarmLvl=2"><img src="/resource/image/step2.png"/></a></p>
			<p><a href="/caution?alarmLvl=3"><img src="/resource/image/step3.png"/></a></p>
			<p><a href="/caution?alarmLvl=4"><img src="/resource/image/step4.png"/></a></p>
		 --%>
		</div>
	</div>
	<script>
		document.querySelector("#q").onkeyup = function(evt) {
			const val = evt.target.value;
			if (val.length == 0) {
				return;
			}
			const xhr = new XMLHttpRequest();
			xhr.open("get", "/index/ajax?word=" + val, true); // 비동기 처리
			xhr.send();

			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4) {
					const txt = xhr.responseText;
					console.log(typeof txt, txt);
					const obj = JSON.parse(txt);
					const cvt = obj.map(function(e) {
						return "<option>" + e + "</option>";
					});
					document.querySelector("#qlist").innerHTML = cvt.join("");
				}
			}
		}
	</script>
</body>
</html>