<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY - 메인페이지</title>
<link rel="shortcut icon" href="resources/images/ico/favicon.png">

<!-- 메인페이지 스크린 CSS -->
<link rel="stylesheet" href="resources/css/mainPageScreen.css">

<link rel="stylesheet" href="resources/css/jsCalendar.css">

<!-- 제이쿼리 JS (필수) -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<!-- <script type="text/javascript" src="resources/js/jquery.min.js"></script> -->

<script src="resources/js/mainPage.js"></script>
</head>
<body>
	<jsp:include page="WEB-INF/views/header.jsp" />

	<section>
	<div id="div1LayOut">
		<div id="bannerScreen">
			<img src="resources/images/bannerScreen2.png">
		</div>
	</div>

	<div id="padding-content">
		<br>
		<h2 class="nino-sectionHeading">CATEGORY</h2>
	</div>

	<div id="div2LayOut">


		<div class="menu">
			<a href="searchCompany.do?page=1">
				<div class="menuImage">
					<img src="resources/images/menu/menu2.jpg">
				</div>
				<div class="menuText"># 기업 정보 리스트</div>
			</a>
		</div>

		<div class="menu">
			<a href="movepage.in">
				<div class="menuImage">
					<img src="resources/images/menu/menu3.jpg">
				</div>
				<div class="menuText"># 모의 면접</div>
			</a>
		</div>

		<div class="menu">
			<a href="emplyMenu4List.me">
				<div class="menuImage">
					<img src="resources/images/menu/menu4.jpg">
				</div>
				<div class="menuText"># 정보공유 게시판</div>
			</a>
		</div>

		<div class="menu">
			<a href="emplyMenu5.me">
				<div class="menuImage">
					<img src="resources/images/menu/menu5.jpg">
				</div>
				<div class="menuText"># 면접예상질문</div>
			</a>
		</div>

		<div class="menu">
			<a href="searchWorker.do">
				<div class="menuImage">
					<img src="resources/images/menu/menu6.jpg">
				</div>
				<div class="menuText"># 구직자 검색 - 기업회원</div>
			</a>
		</div>
	</div>

	<div id="padding-content">
		<h2 class="nino-sectionHeading">JOB CALENDAR</h2>
		<br>
	</div>

	<div id="div3LayOut">
		<div id="dateLayOut" style="display: inline-block;">
			<svg style="visibility:hidden;" width="0" height="0"> <filter
				id="duotone" color-interpolation-filters="sRGB"> <feColorMatrix
				type="matrix"
				values="0.7 0 0 0 0.3 0.6 0 0 0 0.2 0.3 0 0 0 0.6 0 0 0 1 0"></feColorMatrix>
			</filter> </svg>

			<div class="flex-contatiner" style="width: 400px;">
				<div class="calendar-container">
					<div class="image-container">
						<div class="image"></div>
					</div>

					<div class="calendar">
						<h2 class="month-title" id="js-month"></h2>
						<table class="calendar-table">
							<thead>
								<tr>
									<th>일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th>토</th>
								</tr>
							</thead>
							<tbody id="js-calendar-body"></tbody>
						</table>
					</div>
				</div>
			</div>

			<div id="dateInfo" style="display: inline-block;">
				<div id="dateTitle">- 오늘의 채용 정보 -</div>

				<div id="dateContent">
					<ol class="rectangle-list" id="ol">
					</ol>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="WEB-INF/views/footer.jsp" />

	<!-- 스크롤 위치 A 태그 -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>

	<!-- Drop Down Menu JS 파일 (필수)-->
	<script src="resources/js/jquery.dlmenu.js"></script>
	<!-- 달력 JS 파일 -->
	<script src="resources/js/calendar.js"></script>

	<script>
      var options = {
         offset : '#showHere',
         offsetSide : 'top',
         classes : {
            clone  : 'banner--clone',
            stick : 'banner--stick',
            unstick : 'banner--unstick'
         }
      };

      var banner = new Headhesive('.banner', options);
   </script>
</body>
</html>