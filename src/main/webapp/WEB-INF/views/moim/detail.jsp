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
	<div class="root">
	
				<div style="text-align: left">
					<div>
						<small><b style="color: deeppink">${Board.boardId }</b>
							님이 개설한 모임</small>
					</div>
					<h2 style="margin: 0.2em 0em;">${Board.body }</h2>
					<div style="justify-content: space-between;" class="block-row">
						<div>
							<a href="/moim/search"><span>전체</span></a> <span>&gt;</span> <a
								href="/moim/search?continent=${Board.continent }"><span>${Board.continent }</span></a>
							<span>|</span>
							
							<span>|</span> <small> 
								<fmt:formatDate value="${Board.time }" pattern="HH:mm" /> 
								
							</small>
						</div>
						<div>
							<c:if test="${Board.currentUsers eq Board.totalUsers }">
								<span style="color: red">마감된 모임</span>
							</c:if>
							${Board.currentUsers }/${Board.totalUsers }
						</div>
					</div>
					
				</div>
				<div class="block-row"
					style="justify-content: space-between; font-size: small; gap: 4px;">
					<div class="block-row">
						<div class="block-row" style="gap: 1px;">
							
						</div>
						<c:forEach var="one" items="${attendances }">
							<div class="block-row" style="gap: 1px;">
							
							</div>
						</c:forEach>
					</div>
					<div>
						<c:if test="${sessionScope.logonUser.id ne Board.boardId }">
							<c:choose>
								<c:when test="${Board.currentUsers ge Board.totalUsers }">
									<a class="moim-join-bt">참가신청불가</a>
								</c:when>
								<c:when test="${status eq -1 }">
									<a class="moim-join-bt" href="/user/login">참가 신청을 하기위해서는
										로그인이 필요합니다.</a>
								</c:when>
								<c:when test="${status eq 0 }">
									<a class="moim-join-bt"
										href="/moim/join-task?target=${Board.id }">참가 신청</a>
								</c:when>
								<c:when test="${status eq 1 }">
									<a class="moim-join-bt">승인 대기중</a>
								</c:when>
								<c:otherwise>
									<a class="moim-join-bt">신청 완료</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
				</div>
			</div>
			<%-- 모임에 댓글을 달기 위한 입력 영역 --%>
			<div class="moim-add-reply">
				<form action="/moim/add-reply-task" method="post"
					style="display: flex; align-items: stretch; gap: 4px; justify-content: center;">
					<input type="hidden" name="boardId" value="${Board.boardId }"/>
					<c:choose>
						<c:when test="${empty sessionScope.logonUser }">
							<textarea style="width: 80%; resize: none" disabled
								placeholder="내용을 입력해주세요."></textarea>
							<button type="submit" disabled>등록</button>
						</c:when>
						<c:otherwise>
							<textarea style="width: 80%; resize: none"
								placeholder="내용을 입력해주세요." name="ment"></textarea>
							<button type="submit">등록</button>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<%-- 모임에 등록된 댓글을 렌더링하는 영역 --%>
			<div class="moim-replys">
				<c:choose>
					<c:when test="${empty replys }">
						<div>등록된 댓글이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<th width="10%">작성자</th>
								<th>내용</th>
								<th width="10%">작성일</th>
							</tr>
							<c:forEach var="r" items="${replys }">
								<tr>
									<td>${r.writer }</td>
									<td>${r.ment }</td>
									<td><fmt:formatDate value="${r.writed }"
											pattern="yyyy.MM.dd" /></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>

			</div>
</body>
</html>