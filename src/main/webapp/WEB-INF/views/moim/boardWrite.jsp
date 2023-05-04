<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
<style>

	body {
		font-family: 'Helvetica Neue', sans-serif;
		font-size: 20px;
	}
	
	form {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 100px;
		background-color: #f0f0f0;
		
	}
	
	label {
		font-weight:bold;
	}
	
	input, select {
		border-radius: 5px;
		border: none;
		padding: 8px 12px;
		margin: 5px;
		background-color: #ffffff;
		box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
	}
	
	input[type="date"], input[type="time"] {
		width: auto;
	}
	
	button {
		padding: 8px 12px;
		background-color: #007bff;
		color: #ffffff;
		border: none;
		border-radius: 5px;
		
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
. box {

}

	}
</style>
</head>
<body>



	<div align="center">
	
	
		<form action="/board/write-task" class="moim-form"
			autocomplete="off">
			<div class="block">
				<span>모임 이름</span>
				
				<div class="block">
					<input type="text" name="title" />
				</div>
			<div class="block">
				<label>모임의 <span>장소, 참가 인원 수</span>
				</label>
				<div class="block-row" style="justify-content: center">
				

					</div>
					<div class="block-row" style="flex: 1">
						<select name="continent" style="flex: 1; text-align: center">
							<c:forTokens items="아시아, 유럽, 아메리카, 아프리카, 중동" delims="," var="one">
								<option value="${one }">${one }</option>
							</c:forTokens>
						</select>
					</div>
					<div class="block-row" style="flex: 1">
						<select name="totalUsers" style="flex: 1; text-align: center">
							<c:forEach var="cnt" begin="2" end="7">
								<option value="${cnt }">${cnt }명</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="block">
				<label>만나고자하는 <span>날짜</span> </label>
		
				<div class="block-row" style="flex: 1">
					<div class="block" style="flex: 2">
						<fmt:formatDate value="" pattern="yyyy-MM-dd" var="defaultDate"/>
						<input type="date" style="text-align: center" name="date" value="${defaultDate }"/>
					</div>
					<div class="block" style="flex: 1">
						<input type="time"  style="text-align: center" name="time" />
					</div>
					
					
				</div>
			</div>
			<div class="block" >
				<label>내용</label>
				<input type ="text" name="body"/>
				</div>
			<div class="block">
				<div align ="right">
					<button type="submit" >등록</button>
				
				</div>
			</div>
		</form>
	</div>
		
	
</body>
</html>