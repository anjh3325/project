<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>국가 위험 경보</h1>
	<div>
		</div>
	<div>
    <table>
        <tr>
            <td>
		
			<h2>${countryData.countryNm } (${countryData.countryEngNm }) <br/>
				대륙: ${countryData.continentEngNm }</h2>
		
                <img src="${countryData.flagUrl}" style="width: 300px; height:200px ">
            </td>
            <td>
                <ul>
                    <li>면적 : <fmt:formatNumber value="${DetailData.area }" pattern="#,###"/> km2</li>
                    <li>면적설명 : ${DetailData.areaDesc }</li>
                    <li>수도 : ${DetailData.capital }</li>
                    <li>국경일 : ${DetailData.establish eq null ? '정보없음' : DetailData.establish }</li> 
                    <li>인구 : <fmt:formatNumber value="${DetailData.population }" pattern="#,###"/>명</li>
                    <li>종교 : ${DetailData.religion }</li>
                    <li>기후 : ${DetailData.climate eq null ? '정보없음' : DetailData.climate }</li>
                </ul>
            </td>
            <td>
         	<a href=""><button type="submit">여행후기</button></a>
         	
         	<a href=""><button type="submit">모임</button></a>
            </td>
        </tr>
    </table>
</div>
	
		<div>
		<img src="${countryData.mapUrl }" style="widows: 600px; height: 500px">
		</div>
		
	
	
</body>
</html>