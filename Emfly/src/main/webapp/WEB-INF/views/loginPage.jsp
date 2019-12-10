<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY - 로그인</title>
<link rel="shortcut icon" href="resources/images/ico/favicon.png">

<!-- 로그인 스크린 CSS -->
<link rel="stylesheet" href="resources/css/loginScreen.css">
</head>
<body style="background: url(resources/images/Background.png);">
	<jsp:include page="header.jsp" />

	<section>
	<div class="container">
		<div class="login-box">
			<div class="account-box">
				<img src="resources/images/whiteLogo.png" id="loginLogo">

				<button id="naver" onclick="location.href='${naverurl}'">
					<img src="resources/images/naver.png">
				</button>

				<button id="facebook" onclick="location.href='facebooklogin.me'">
					<img src="resources/images/facebook.png">
				</button>

				<button id="google" onclick="location.href='googlelogin.me'">
					<img src="resources/images/google.png">
				</button>
			</div>

			<div class="agree">
				<p>소셜로 간편하게 로그인 해보세요!</p>
			</div>
		</div>
	</div>
	</section>

	<jsp:include page="footer.jsp" />

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
				clone : 'banner--clone',
				stick : 'banner--stick',
				unstick : 'banner--unstick'
			}
		};

		var banner = new Headhesive('.banner', options);
	</script>
</body>
</html>