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
			<img src="/resource/image/step1.png" /><img src="/resource/image/step2.png" />
			<img src="/resource/image/3단계.png" /><img src="/resource/image/step4.png" />
		</div>
		<div>
			<button>1단계</button>
			<button>2단계</button>
			<button>3단계</button>
			<button>4단계</button>
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