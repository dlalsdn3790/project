<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/HeaderMenu.css">
<link rel="stylesheet" href="resources/css/default.css">
<link rel="stylesheet" href="resources/css/dropDown.css">

<!-- 부트스트랩 JS (필수) -->
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<!-- Drop Down Menu JS (필수) -->
<script src="resources/js/modernizr.custom.js"></script>

<!-- 스크롤 JS -->
<script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript"
   src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/unslider-min.js"></script>
<script type="text/javascript" src="resources/js/template.js"></script>
</head>
<body>
   <!-- 헤더 -->
   <header class="banner">
      <div id="bannerWidth">
         <!-- 좌측 로고 DIV -->
         <div id="logo">
            <a href="${pageContext.request.contextPath}/mainPage.jsp"><img
               src="resources/images/mainLogo.png" id="logoImage"><br></a>
         </div>

         <!-- 우측 메뉴 DIV -->
         <div id="menu">
            <ul>
               <li><a href="${pageContext.request.contextPath}/mainPage.jsp"
                  class="menuList" id="menuListHome">HOME</a></li>

               <!-- 헤더 메뉴 (로그인 이전) -->
               <c:if test="${empty sessionScope.member}">
                  <li><a href="loginPage.do" class="menuList">로그인</a></li>
               </c:if>

               <!-- 헤더 메뉴 (로그인 이후) -->
               <c:if test="${not empty sessionScope.member}">
                  <div id="myPageDiv">
                     <img src="${member.mImg}" id="personImage">
                  </div>

                  <li style="margin-left: 30px;"><c:if
                        test="${member.mAccess eq 'normal'}">
                        <a href="myPage_normal.do?tab=1" class="menuList">${member.mName}</a>
                     </c:if> <c:if test="${member.mAccess eq 'company'}">
                        <a href="myPage_company.do" class="menuList">${member.mName}</a>
                     </c:if> <c:if test="${member.mAccess eq 'admin'}">
                        <a href="myPage_admin.do" class="menuList">${member.mName}</a>
                     </c:if></li>

                  <li><a href="logout.me" class="menuList">로그아웃</a></li>
               </c:if>

               <li>
                  <div id="dl-menu" class="dl-menuwrapper">
                     <button class="dl-trigger"></button>
                     <ul class="dl-menu">
                        <li><a href="emplyMenu1.me">자기소개서 분석</a></li>
                        <li><a href="searchCompany.do">기업 정보 리스트</a></li>
                        <li><a href="movepage.in">모의 면접</a></li>
                        <li><a href="emplyMenu4List.me">정보공유 게시판</a></li>
                        <li><a href="emplyMenu5.me">면접예상 질문</a></li>
                        <li><a href="searchWorker.do">구직자 검색 </a></li>

                        <!-- 임시적으로 추가함 -->
                        <li><a href="emplyMyPage1A.me">마이 페이지1-1 </a></li>
                        <li><a href="emplyMyPage1B.me">마이 페이지1-2</a></li>
                        <li><a href="emplyMyComPage.me">기업회원 페이지</a></li>
                        <li><a href="emplyAdminPage.me">관리자 페이지</a></li>
                        <li><a href="emplyResume.me">이력서 열람 페이지</a></li>
                     </ul>
                  </div>
               </li>
            </ul>
         </div>
      </div>
   </header>
</body>
</html>