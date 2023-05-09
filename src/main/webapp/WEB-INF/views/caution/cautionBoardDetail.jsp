<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'GmarketSansMedium';
}

.detail-button{
	background-color: #F1F6F9;
	padding: 4px;
	border-radius: 4px;
	border: 0.5px solid;
}
    body {
	background-color: #8FCFD1;
}
.comment-container {
  flex-direction: column;
  align-items: center;
}

.comment {
  margin: 10px;
  padding: 10px;
  border: 1px solid ;
  border-radius: 5px;
  max-width: 500px;
}

.comment .writer.time {
  font-weight: bold;
  margin-bottom: 5px;
}

.comment .body {
  font-size: 15px;
}

</style>
</head>
<body>
   <h1 style="text-align: center;">국가 위험 경보</h1>

  <div style="display: flex; align-content: center; align-items: center;justify-content: center; gap:20px ">
    <div style="display: flex; gap:20px;">
    
    

    <div class="list-container">
      <img src="${countryData.flagUrl}" style="width: 300px; height: 200px">
      <h2>${countryData.countryNm} (${countryData.countryEngNm}) <br /> 대륙: ${countryData.continentEngNm}</h2> 

      <div class="list-item">
        <span class="item-title">면적:</span>
        <span class="item-content">${DetailData.area}</span>
        <span class="item-desc">${DetailData.areaDesc}</span>
      </div>

      <div class="list-item">
        <span class="item-title">수도:</span>
        <span class="item-content">${DetailData.capital}</span>
      </div>

      <div class="list-item">
        <span class="item-title">국경일:</span>
        <span class="item-content">${DetailData.establish eq null ? '정보없음' : DetailData.establish}</span>
      </div>

      <div class="list-item">
        <span class="item-title">인구:</span>
        <span class="item-content">${DetailData.population}</span>
      </div>

      <div class="list-item">
        <span class="item-title">종교:</span>
        <span class="item-content">${DetailData.religion eq null ? '정보없음' : DetailData.religion}</span>
      </div>

      <div class="list-item">
        <span class="item-title">기후:</span>
        <span class="item-content">${DetailData.climate eq null ? '정보없음' : DetailData.climate}</span>
      </div>
    </div>
    <div style="overflow: auto;">
      <div style="float: left; margin-right: 10px;">
        <img src="${countryData.mapUrl}" style="width: 600px; height: 500px;">
      </div>
	</div>
      </div>
      

        <div id="commentBox" style="display: block;">
        <a href="/cautionDetail?countryNm=${country}" id="reviewBtn"><button class="detail-button" type="button">여행후기</button></a> 
        <a href="/cautionDetailBoard?countryNm=${country}" id="meetingBtn"><button type="button" class="detail-button">모임</button></a>
       <a href="/board/write?country=${country }"><button type="button" class="detail-button">글쓰기</button></a>
      
     <div class="comment-container" >
  <c:forEach items="${boardLi}" var="li">
    <div class="comment" onclick="location.href='/boardDetail?boardId=${li.id }'" style="cursor: pointer;">
      <div class="writer">${li.writer}</div>
      <div class="body">${li.body}</div>
      <div class="time">${li.time }</div>

    </div>
  </c:forEach>
</div>
        </div>
      
    </div>

</body>
</html>