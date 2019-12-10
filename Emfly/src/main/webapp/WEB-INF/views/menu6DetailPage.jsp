<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap2.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
<link rel="stylesheet" href="resources/css/myPage1-2.css"> <!--해당페이지 CSS-->
</head>
<body style="background:#F2F4F7;height:1600px;">
    <jsp:include page="./header.jsp" />
      <div id="divBack"></div>
      <section>
        <div id="menu1LayOut">

            <div id="TabContent1">
                <div class="subject2">이력서 정보</div>
                <h2 class="header" style="font-weight: 600;margin-left:20px;">인적사항</h2>
                <div class="container">
                    <div class="info-container">
                        <div class="info-general">
                            <div class="item-name" id="item-name">${resume.rName}</div>
                            <c:if test="${resume.reGender == 'M'}">
                             <div class="item-gender">남자</div>
                            </c:if>
                            <c:if test="${resume.reGender == 'F'}">
                             <div class="item-gender">여자</div>
                            </c:if>
                            <c:set var="TextValue" value="${resume.reBirth}"/>
                            <div class="item-year"> ${fn:substring(TextValue,0,4)}년생</div>
                        </div>
                        <div class="info-detail">
                            <div class="item">
                                <div class="label">휴대폰</div>
                                <div class="value">${resume.rePhone}</div>
                            </div>
                            <div class="item">
                                <div class="label">Email</div>
                                <div class="value">
                                    <a href="mailto:crazy2178@naver.com">${resume.reEmail}</a>
                                </div>
                            </div>
                            <div class="item item-full">
                                <div class="label">주소</div>
                                <div class="value" style="width:350px;">${resume.reAddress}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 class="header" style="font-weight: 600;margin-left:20px;">학력</h2>
                <div class="summary">

                    <div class="item2">
                        <div class="s-header">학력</div>
                        <div class="description">
                           ${resume.reScname} </div>
                        <div class="options">
                            <div class="option">${resume.reSchool}</div>
                            <div class="option">${resume.reGraduate}</div>
                        </div>
                    </div>

                    <div class="item2">
                        <div class="s2-header">입학,졸업년월</div>
                        <div class="description" style="color: #39f;">${resume.reSdate} ~ ${resume.reEdate}</div>
                    </div>

                    <div class="item2">
                        <div class="s2-header">학점</div>
                        <div class="description" style="color: #39f;">${resume.reGpoint}/ ${resume.reTpoint}</div>
                    </div>

                </div>

                <h2 class="header" style="font-weight: 600;margin-left:20px;">경력</h2>
               
                <div class="summary">
    
                    <div class="item2">
                        <div class="s-header">업체명</div>
                        <div class="description">${resume.reComName}</div>
                        <div class="options">
                            <div class="option">${resume.reYear}</div>
                        </div>
                    </div>
    
                    <div class="item2">
                        <div class="s2-header">부서 | 직급</div>                              
                        <div class="options">
                            <div class="option">${resume.reDivName} | ${resume.reRank}</div>
                        </div>
                    </div>
                    <div class="item2">
                        <div class="s2-header">담당업무</div>
                        <div class="description" style="color: #39f;">${resume.reWorkInfo}</div>
                    </div>
                </div>

                <div class="hopework" id="hopework">
                    <h2 class="header" style="font-weight: 600;margin-left:20px;">희망근무조건</h2>
                    
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">고용형태</th>
                                <td>${resume.reEmploy}</td>
                            </tr>
                            <tr>
                                <th scope="row">희망연봉</th>
                                <td>${resume.reSalary}만원</td>
                            </tr>
                            <tr>
                                <th scope="row">지원분야</th>
                                <td>
                                    <div class="td-label">
                                        <div class="item">
                                            <div class="label" style="margin-left:-20px;">직무</div>
                                            <div class="value">
                                                <ul class="list-hopework">
                                                    <li>
                                                        <div class="item" style="margin-left:-110px;">${resume.reEmDiv}</div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>       
            </div>          
        </div>
    </section>
       
	<jsp:include page="./footer.jsp" />
    <script src="resources/js/jquery.dlmenu.js"></script> <!-- Drop Down Menu JS 파일 (필수)-->
    <script>
       var options = {
                offset: '#showHere',
                offsetSide: 'top',
                classes: {
                    clone: 'banner--clone',
                    stick: 'banner--stick',
                    unstick: 'banner--unstick'
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
            ReaderObj.onloadend = function () {
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