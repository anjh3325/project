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
#boardcss table {
  border-collapse: collapse;
  width: 100%;
}

#boardcss thead tr {
  background-color: #f2f2f2;
}

#boardcss th, #boardcss td {
  text-align: center;
  padding: 8px;
  border-bottom: 1px solid #ddd;
}

#boardcss tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

#boardcss tbody tr:hover {
  background-color: #ddd;
}

#boardcss th {
  font-weight: bold;
  color: #333;
}

#boardcss td {
  color: #555;
}
li{
list-style-type: none;
}
</style>
</head>
<body>
  <h1>국가 위험 경보</h1>

                    <h2>${countryData.countryNm }
                        (${countryData.countryEngNm }) <br /> 대륙:
                        ${countryData.continentEngNm }
                    </h2> 
    <div >
        <table>
            <tr>
                <td>
                    <img src="${countryData.flagUrl}" style="width: 300px; height: 200px">
                </td>
                <td>
                    <ul>

                        <li>면적 : <fmt:formatNumber value="${DetailData.area }"
                                pattern="#,###" /> km2
                        </li>
                        <li>면적설명 : ${DetailData.areaDesc }</li>
                        <li>수도 : ${DetailData.capital }</li>
                        <li>국경일 : ${DetailData.establish eq null ? '정보없음' : DetailData.establish }</li>
                        <li>인구 : <fmt:formatNumber value="${DetailData.population }"
                                pattern="#,###" />명
                        </li>
                        <li>종교 : ${DetailData.religion eq null ? '정보없음' : DetailData.religion }</li>
                        <li>기후 : ${DetailData.climate eq null ? '정보없음' : DetailData.climate }</li>
                    </ul>
                </td>
                <td>
           	
                    <a href="/cautionDetail?countryNm=${country }" id="reviewBtn"><button type="button">여행후기</button></a> 
                    <a href="/cautionDetailBoard?countryNm=${country }" id="meetingBtn"><button type="button">모임</button></a>
                   
                    <div id="commentBox" style="display: block;">
                   <a href="/board/write?country=${country }"><button type="button">글쓰기</button></a>
                    </div>
    			<div >
		
				</div>
                </td>
            </tr>
        </table>
    </div>

   <div style="overflow: auto;">
    <div style="float: left; margin-right: 10px;">
        <img src="${countryData.mapUrl }" style="width: 600px; height: 500px;">
    </div>
    <div style="float: right; width: calc(100% - 630px);" id="boardcss">
        <c:forEach items="${boardLi }" var="li">
            <table>
                <thead>
                    <tr>
                    	
                        <th>작성자</th>
                        <th>제목</th>
                        <th>시간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                  
                        <td>${li.writer }</td>
                       <td>${li.title }</td>
                       <td>${li.time }</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>
    </div>
</div>
</body>
</html>