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

#commentcss table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

#commentcss th, #commentcss td {
  padding: 10px;
  text-align: left;
  border: 1px solid #ddd;
}

#commentcss th {
  background-color: #f2f2f2;
  font-weight: bold;
}

#commentcss tbody tr:nth-child(even) {
  background-color: #f2f2f2;
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
    body {
	background-color: #8FCFD1;
}
</style>
</head>
<body>
    <h1 style="text-align: center;">국가 위험 경보</h1>
 <div style="display: flex;">
    
    <div>
    
                    <h2>${countryData.countryNm }
                        (${countryData.countryEngNm }) <br /> 대륙:
                        ${countryData.continentEngNm } </h2> 
    
                    <img src="${countryData.flagUrl}" style="width: 300px; height: 200px">
                  <img src="${countryData.mapUrl }" style="width: 500px; height: 400px;">
    </div>
       
       
   <div style="overflow: auto;">
    <div style="float: left; margin-right: 10px;">
      
    </div>

       </div>            
               <div class="list-container">
  <div class="list-item">
    <span class="item-title">면적:</span>
    <span class="item-content">${DetailData.area }</span>
    <span class="item-desc">${DetailData.areaDesc }</span>
  </div>
  <div class="list-item">
    <span class="item-title">수도:</span>
    <span class="item-content">${DetailData.capital }</span>
  </div>
  <div class="list-item">
    <span class="item-title">국경일:</span>
    <span class="item-content">${DetailData.establish eq null ? '정보없음' : DetailData.establish }</span>
  </div>
  <div class="list-item">
    <span class="item-title">인구:</span>
    <span class="item-content">${DetailData.population }</span>
  </div>
  <div class="list-item">
    <span class="item-title">종교:</span>
    <span class="item-content">${DetailData.religion eq null ? '정보없음' : DetailData.religion }</span>
  </div>
  <div class="list-item">
    <span class="item-title">기후:</span>
    <span class="item-content">${DetailData.climate eq null ? '정보없음' : DetailData.climate }</span>
  </div>
</div>
               
           	
                    <a href="/cautionDetail?countryNm=${country }" id="reviewBtn"><button class="detail-button" type="button">여행후기</button></a> 
                    <a href="/cautionDetailBoard?countryNm=${country }" id="meetingBtn"><button type="button" class="detail-button">모임</button></a>
                   
                    <div id="commentBox" style="display: block;">
                    <form action="/createComment">
                        <input type="hidden" name="country" value="${country }" >
                        <input type="text" placeholder="후기를 적어주세요" name="body" autocomplete="off"> <button type="submit">등록</button>
                          
                    </form>
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