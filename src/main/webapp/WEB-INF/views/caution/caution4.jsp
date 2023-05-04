<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국가별 단계표출</title>
<style>
div {
	padding : 4px 0px;
}
ul {
	list-style: none;
}

.left {
	width: 10%;
	text-align: center;
}

.right {
	width: 90%;
	text-align: left
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
	<div style="width: 700px; margin: auto">
		<div>
		<a href="/caution?alarmLvl=1"><img src="/resource/image/step1.png" width ="350"height ="116"/></a><a href="/caution?alarmLvl=2"><img src="/resource/image/step2.png" width ="350"height ="116"/></a>
			<a href="/caution?alarmLvl=3"><img src="/resource/image/step3.png" width ="350" height ="116"/></a><img src="/resource/image/4단계.png" width ="350"height ="116"/>
		</div>
		
		<div>
			<table style="width: 100%">
				<tr>
					<td class="left">아프리카</td>
					<td class="right">
						<ul>
							<c:forEach items="${africa }" var="one">
								<li><b>${one.countryNm }</b> (${one.remark })</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<td class="left">미주</td>
					<td class="right">
						<ul>
							<c:forEach items="${america }" var="one">
								<li><b>${one.countryNm }</b> (${one.remark })</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<td class="left">아주</td>
					<td class="right">
						<ul>
							<c:forEach items="${asia }" var="one">
								<li><b>${one.countryNm }</b> (${one.remark })</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<td class="left">유럽</td>
					<td class="right">
						<ul>
							<c:forEach items="${euroup }" var="one">
								<li><b>${one.countryNm }</b> (${one.remark })</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<td class="left">중동</td>
					<td class="right">
						<ul>
							<c:forEach items="${middleEast }" var="one">
								<li><b>${one.countryNm }</b> (${one.remark })</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>