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

#commentcss table {
  border-collapse: collapse;
  width: 100%;
}

#commentcss thead tr {
  background-color: #f2f2f2;
}

#commentcss th, #commentcss td {
  text-align: center;
  padding: 8px;
  border-bottom: 1px solid #ddd;
}

#commentcss tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

#commentcss tbody tr:hover {
  background-color: #ddd;
}

#commentcss th {
  font-weight: bold;
  color: #333;
}

#commentcss td {
  color: #555;
}
li{
list-style-type: none;
}
  /* 지도 버튼 스타일 */
    .map-btn {
        display: inline-block;
        border: 2px solid #1A1A1A;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        color: #1A1A1A;
        background-color: #F5F5F5;
        text-decoration: none;
        margin-right: 10px;
    }

    .map-btn:hover {
        background-color: #1A1A1A;
        color: #F5F5F5;
        cursor: pointer;
    }

    /* 댓글 폼 스타일 */
    #commentBox form {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-top: 20px;
    }

    #commentBox input[type="text"] {
        flex: 1;
        border: none;
        border-bottom: 2px solid #1A1A1A;
        padding: 5px;
        margin-right: 10px;
    }

    #commentBox button[type="submit"] {
        border: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        color: #F5F5F5;
        background-color: #1A1A1A;
        text-decoration: none;
    }

    #commentBox button[type="submit"]:hover {
        background-color: #F5F5F5;
        color: #1A1A1A;
        cursor: pointer;
    }
</style>
</head>
<body>
    <h1>국가 위험 경보</h1>
    <div >
                    <h2>${countryData.countryNm }
                        (${countryData.countryEngNm }) <br /> 대륙:
                        ${countryData.continentEngNm }
                    </h2> 
        <table>
            <tr>
                <td>

                    <img src="${countryData.flagUrl}" style="width: 300px; height: 200px">
                </td>
                <td>
                    <ul >

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
                    <form action="/createComment">
                        <input type="hidden" name="country" value="${country }" >
                        <input type="text" placeholder="후기를 적어주세요" name="body"> <button type="submit">등록</button>
                          
                    </form>
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
    <div style="float: right; width: calc(100% - 630px);"id="commentcss">
        <c:forEach items="${commentLi }" var="comment">
            <table>
                <thead>
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${comment.writer }</td>
                        <td>${comment.body }</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>
    </div>
</div>
	<script type="text/javascript">
	
      
     
	</script>


</body>
</html>