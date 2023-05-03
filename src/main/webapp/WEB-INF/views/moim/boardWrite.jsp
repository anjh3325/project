<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만드는 </title>

</head>
<body>
	<div class="root">
	
		<form action="/moim/boardWrite-task" method="post" class="moim-form"
			autocomplete="off">
			<div class="block">
				<label>만들고자 하는 모임의 <span style="color: orangered;">이름</span>
					
				</label>
				<div class="block">
					<input type="text" name="event" style="flex: 1" />
				</div>
			</div>
			<div class="block">
				<label>만들고자 하는 모임의 <span style="color: orangered;">목적, 최대 참가 인원 수</span>
				</label>
				<div class="block-row" style="justify-content: center">
					<div class="block-row" style="flex: 1">
						<select name="type" style="flex: 1; text-align: center">
						
						</select>
					</div>
					<div class="block-row" style="flex: 1">
						<select name="cate" style="flex: 1; text-align: center">
							<c:forTokens items="아시아, 유럽, 아메리카, 아프리카, 중동" delims="," var="one">
								<option value="${one }">${one }</option>
							</c:forTokens>
						</select>
					</div>
					<div class="block-row" style="flex: 1">
						<select name="maxPerson" style="flex: 1; text-align: center">
							<c:forEach var="cnt" begin="2" end="99">
								<option value="${cnt }">${cnt }명</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="block">
				<label>만나고자하는 <span style="color: orangered;">날짜</span> </label>
		
				<div class="block-row" style="flex: 1">
					<div class="block" style="flex: 2">
						<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var="defaultDate"/>
						<input type="date" style="text-align: center" name="date" value="${defaultDate }"/>
					</div>
					<div class="block" style="flex: 1">
						<input type="time"  style="text-align: center" name="begin" />
					</div>
					
					
				</div>
			</div>
			<div class="block">
				<label>내용</label>
				<div class="block" style="min-height: 120px">
					<textarea style="resize: none; flex: 1" name="description"></textarea>
				</div>
			</div>
			<div class="block">
				<button type="submit">등록</button>
			</div>
		</form>
	</div>
</body>
</html>