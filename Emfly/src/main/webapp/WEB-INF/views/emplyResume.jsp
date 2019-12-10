<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap2.min.css" />
<link rel="stylesheet" href="resources/css/resume.css">
<body style="background:#F2F4F7;height:1100px;">
    <jsp:include page="./header.jsp" />
      <div id="divBack"></div>
      <section>
        <div id="menu1LayOut">
            <div class="subject">이력서</div>
            <div id="menu1button">인쇄</div>
            <div class="profile">
                <h2 class="header" style="font-weight: 600;margin-left:20px;">인적사항</h2>
                <div class="container">
                    <div class="info-container">
                        <div class="info-general">
                            <div class="item-name" id="item-name">김동현</div>
                            <div class="item-gender">남</div>
                            <div class="item-year">1996년, </div>
                            <div class="item-age">24세</div>
                        </div>
                        <div class="info-detail">
                            <div class="item">
                                <div class="label">휴대폰</div>
                                <div class="value">010-8664-2178</div>
                            </div>
                            <div class="item">
                                <div class="label">Email</div>
                                <div class="value">
                                    <a href="mailto:crazy2178@naver.com">crazy2178@naver.com</a>
                                </div>
                            </div>
                            <div class="item item-full">
                                <div class="label">주소</div>
                                <div class="value">서울 강서구 화곡동</div>
                            </div>
                        </div>
                    </div>
                </div>
                <h2 class="header" style="font-weight: 600;margin-left:20px;">학력</h2>
                <div class="summary">

                    <div class="item2">
                        <div class="s-header">학력</div>
                        <div class="description">
                            유한대학교 </div>
                        <div class="options">
                            <div class="option">대학(2,3년)</div>
                            <div class="option">졸업</div>
                        </div>
                    </div>

                    <div class="item2">
                        <div class="s2-header">입학,졸업년월</div>
                        <div class="description" style="color: #39f;">2014.03 ~ 2018.01</div>
                    </div>

                    <div class="item2">
                        <div class="s2-header">학점</div>
                        <div class="description" style="color: #39f;">3.8 / 4.5</div>
                    </div>

                </div>
            </div>

            <h2 class="header" style="font-weight: 600;margin-left:20px;">경력</h2>
            <div class="summary">

                <div class="item2">
                    <div class="s-header">업체명</div>
                    <div class="description">KH정보교육원</div>
                    <div class="options">
                        <div class="option">2년</div>
                    </div>
                </div>

                <div class="item2">
                    <div class="s2-header">부서 | 직급</div>                              
                    <div class="options">
                        <div class="option">행정부(회계) | 대리</div>
                    </div>
                </div>
                <div class="item2">
                    <div class="s2-header">담당업무</div>
                    <div class="description" style="color: #39f;">학원 돈 관리 했습니다.</div>
                </div>
            </div>
            <div class="hopework" id="hopework">
                <h2 class="header" style="font-weight: 600;margin-left:20px;">희망근무조건</h2>
                <hr style="border-top:1px solid black; margin: 0;">
                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="row">고용형태</th>
                            <td>정규직</td>
                        </tr>
                        <tr>
                            <th scope="row">희망연봉</th>
                            <td>면접 후 결정</td>
                        </tr>
                        <tr>
                            <th scope="row">지원분야</th>
                            <td>
                                <div class="td-label">
                                    <div class="item">
                                        <div class="label">직무</div>
                                        <div class="value">
                                            <ul class="list-hopework">
                                                <li>
                                                    <div class="item" style="margin-left:-115px;">웹프로그래머</div>
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