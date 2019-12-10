<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<!-- 부트 스트랩 CSS (필수)-->
<link rel="stylesheet" href="resources/css/comDetail.css">
<!-- 해당페이지 CSS -->
<body>
	<jsp:include page="./header.jsp" />

	<div id="divBack"></div>
	<section>
		<div id="menu1LayOut">
			<div class="content-header">
				<div class="content-title">
					<div id="company">
						<div id="companyText">기업명</div>
						<c:if test="${company.cUrl == '#'}">
						<a href="#">
							<div id="cName">${company.cName}</div>
						</a>
						</c:if>
						<c:if test="${company.cUrl != '#'}">
						<a href="https://${company.cUrl}">
							<div id="cName">${company.cName}</div>
						</a>
						</c:if>
					</div>
					<div id="salary">
						<div id="salaryText">예상평균연봉</div>
						<div style="width: 300px;">
							<c:set var="TextValue" value="${company.cSalary}"/>	
							${fn:substring(TextValue,0,4)}<span style="font-size:20px">  만원</span>
						</div>
					</div>

				</div>
			</div>
			<div class="content2">
				<div class="content2-inner">
					<div id="locationText">소재지 |</div>
					<div id="location">${company.cLocation}</div>
				</div>
			</div>
			<div id="boardLine"></div>
			<div class="content-container">
				<div class="board-list">
					<!-- <div id="infoTitle">| 기업정보</div> -->
					<div id="info">
						<div id="infoImg">
							<img src="resources/images/info3.png">
						</div>
						기업구분 <span id="info2">${company.cDiv}</span>
						<div style="font-size: 12px;color:white;">-</div>
					</div>
					<div id="info">
						<div id="infoImg">
							<img src="resources/images/info2.png">
						</div>
						사원수 
						<span id="info2">
						<c:if test="${company.cPerson == 0}">
						비공개
						</c:if>
						<c:if test="${company.cPerson != 0}">
						${company.cPerson} 명
						</c:if>
						</span>
						<div style="font-size: 12px;color:white;">-</div>
					</div>
					<div id="info">
						<div id="infoImg">
							<img src="resources/images/info4.png">
						</div>
						자본금 <span id="info2"> 
						<c:if test="${company.cCapital == 0}">
						비공개					
						</c:if> 
						<c:if test="${company.cCapital != 0 and company.cCapital >= 1000}">
							 <fmt:formatNumber value="${company.cCapital}" pattern="#,###" />		
						</c:if>
						<c:if test="${company.cCapital != 0 and company.cCapital < 1000}">
						<span style="font-size:15px;">
						 <fmt:formatNumber value="${company.cCapital * 1000000}" pattern="#,###" /> 원
						</span>			
						</c:if>
						</span>
						<c:if test="${company.cCapital != 0 and company.cCapital >= 1000}">
							 <div style="font-size: 12px;rgb(0, 0, 0);">(단위 : 백만원)</div>	
						</c:if>
						<c:if test="${company.cCapital != 0 and company.cCapital < 1000 or company.cCapital == 0}">
							 <div style="font-size: 12px;color:white;">-</div>	
						</c:if>	
					</div>
					<div id="info">
						<div id="infoImg">
							<img src="resources/images/info5.png">
						</div>
						매출액 
						<span id="info2">
						<c:if test="${company.cSales == 0}">
						비공개
						</c:if>
						 
						<c:if test="${company.cSales != 0 and company.cSales >= 10000}">
							 <fmt:formatNumber value="${company.cSales}" pattern="#,###" />		
						</c:if>
						<c:if test="${company.cSales != 0 and company.cSales < 10000}">
						<span style="font-size:15px;">
						 <fmt:formatNumber value="${company.cSales * 1000000}" pattern="#,###" /> 원
						</span>	
								
						</c:if>
						</span>
						<c:if test="${company.cSales != 0 and company.cSales >= 10000}">
							 <div style="font-size: 12px;rgb(0, 0, 0);">(단위 : 백만원)</div>	
						</c:if>
						<c:if test="${company.cSales != 0 and company.cSales < 10000 or company.cSales == 0}">
							 <div style="font-size: 12px;color:white;">-</div>	
						</c:if>	
					</div>
				</div>
			</div>
			<div class="content3">
				<div class="content3-inner">
					<div id="content3Title">기업 소개</div>
					<table>
						<tr>
							<td><span id="con3num">01</span> 업종</td>
							<td><span id="con3num">02</span> 대표자명</td>
							<td><span id="con3num">03</span> 사업내용</td>
						</tr>
						<tr>
							<td>${company.cSector}</td>
							<td>${company.cLeader}</td>
							<td>${company.cInfo}</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- <div class="content4">
				<div class="content4-inner">
					<div id="content4Title">채용 공고</div>

					<div class="job-list">
						<table id="jobTable">
							<tr>
								<td>구인제목</td>
								<td>직군</td>
								<td>최소학력</td>
								<td>근무형태</td>
								<td>접수마감일</td>
							</tr>
							<tr>
								<td>삼성SDI 공채</td>
								<td>개발직군</td>
								<td>대졸</td>
								<td>정규직</td>
								<td>2019-10-18</td>
							</tr>
							<tr>
								<td>삼성SDI 공채</td>
								<td>개발직군</td>
								<td>대졸</td>
								<td>정규직</td>
								<td>2019-10-18</td>
							</tr>
							<tr>
								<td>삼성SDI 공채</td>
								<td>개발직군</td>
								<td>대졸</td>
								<td>정규직</td>
								<td>2019-10-18</td>
							</tr>
						</table>

					</div>
				</div>
			</div> -->
			<div class="content5">
				<div class="content5-inner">
					<div id="content5Title">기업 이슈</div>
					<div class="news-list">
						<table id="newsTable">
							<tr>
								<td>제목</td>
								<td>등록일</td>
							</tr>
							<tr>
								<td><a href="${newsLink1}">${newsTitle1}</a></td>
								<td>${newsDate1}</td>
							</tr>
							<tr>
								<td><a href="${newsLink2}">${newsTitle2}</a></td>
								<td>${newsDate2}</td>
							</tr>
							<tr>
								<td><a href="${newsLink3}">${newsTitle3}</a></td>
								<td>${newsDate3}</td>
							</tr>
						</table>
						<c:forEach items="${currentNewsTitle}">
							<div>
								<a href="${currentNewsTitle}" style="cursor: pointer;">${currentNewsTitle2}</a>
							</div>
						</c:forEach>
						<div style="margin-left: 930px;">
							<a
								href="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=${company.cName}"
								id="moreInfo">+ 더 보기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="content6">
				<div class="content6-inner">
					<div id="content6Title">위치</div>
					<!-- <div id="map">
						<img src="resources/images/map.jpg">
					</div> -->
					<div id="map"
						style="width: 1000px; height: 400px; border: 1px solid rgb(138, 138, 138);"></div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="./footer.jsp" />
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<!-- 스크롤 위치 A 태그 -->
	<script src="resources/js/jquery.dlmenu.js"></script>
	<!-- Drop Down Menu JS 파일 (필수)-->
	<script>
		var options = {
			offset : '#showHere',
			offsetSide : 'top',
			classes : {
				clone : 'banner--clone',
				stick : 'banner--stick',
				unstick : 'banner--unstick'
			}
		};
		var banner = new Headhesive('.banner', options);
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b2da53fa6cff6f476e7abb5d3f75ee&libraries=services"></script>
</head>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);

	var geocoder = new kakao.maps.services.Geocoder();
	var cName = document.getElementById('cName').innerHTML;
	var cLocate = document.getElementById('location').innerHTML;
	geocoder
			.addressSearch(
					cLocate,
					function(result, status) {

						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ cName + '</div>'
									});
							infowindow.open(map, marker);

							map.setCenter(coords);
						}
					});
</script>
</body>
</html>