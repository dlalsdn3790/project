<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title>
<link rel="stylesheet" href="resources/css/myPage2.css">
<!--해당페이지 CSS-->
<body style="background: #F2F4F7; height: 1300px;">
	<jsp:include page="./header.jsp" />
	<div id="divBack"></div>
	<section>
		<div id="menu1LayOut">
			<div class="subject">
				마이 페이지 <span style="font-size: 20px;">[ 개인 회원 ]</span>
			</div>
			<div id="myTab">
				<a href="emplyMyPage1A.me"><div class="tabList" id="tab1">이력서
						관리</div>|</a> <a href="emplyMyPage2.me"><div class="tabList" id="tab2">모의면접
						답변 모음</div>|</a> <a href="emplyMyPage3.me"><div class="tabList"
						id="tab3">관심 기업 정보</div>|</a> <a href="emplyMyPage4.me"><div
						class="tabList" id="tab4">기업 회원 전환</div></a>
			</div>
			<div id="boardLine"></div>
			<div id="TabContent1">
				<c:forEach var="row" items="${map.qnaList}">
					<div class="col">
						<div class="tabs">
							<fmt:formatDate var="resultRegDt" value="${row.addDate}"
								pattern="yyyy-MM-dd hh:mm:ss" />
							<div id="date">작성일자 : ${resultRegDt}</div>
							<div class="tab">
								<input type="radio" id="rd1${row.aId}" name="rd${row.aId}">
								<label class="tab-label" for="rd1${row.aId}">${row.question1}</label>
								<div class="tab-content">${row.answer1}</div>
							</div>
							<div class="tab">
								<input type="radio" id="rd2${row.aId}" name="rd${row.aId}">
								<label class="tab-label" for="rd2${row.aId}">${row.question2}</label>
								<div class="tab-content">${row.answer2}</div>
							</div>
							<div class="tab">
								<input type="radio" id="rd3${row.aId}" name="rd${row.aId}">
								<label class="tab-label" for="rd3${row.aId}">${row.question3}</label>
								<div class="tab-content">${row.answer3}</div>
							</div>
							<div class="tab">
								<input type="radio" id="rd4${row.aId}" name="rd${row.aId}">
								<label for="rd4${row.aId}" class="tab-close">탭 끄기
									&times;</label>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>

	<jsp:include page="./footer.jsp" />
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
	<!-- 이미지 삽입 버튼-->
	<script type="text/javascript">
		function ImagePreview() {

			var ImagePreview = document.getElementById('image_preview');
			var UploadFile = document.getElementById('file_to_upload').files[0];
			var ReaderObj = new FileReader();
			ReaderObj.onloadend = function() {
				ImagePreview.src = ReaderObj.result;
			}

			if (UploadFile) {
				ReaderObj.readAsDataURL(UploadFile);
			} else {
				ImagePreview.src = '';
			}
		}
	</script>
	<!-- 이미지 삽입 끝-->

	<script type="text/javascript">
		$(".myselect").select2();
	</script>
</body>
</html>