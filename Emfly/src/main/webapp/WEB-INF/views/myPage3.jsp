<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" href="resources/css/myPage3.css"> <!--해당페이지 CSS-->
<body style="background:#F2F4F7;height:1300px;">
    <jsp:include page="./header.jsp" />
      <div id="divBack"></div>
      <section>
        <div id="menu1LayOut">
            <div class="subject">마이 페이지 <span style="font-size:20px;">[ 개인 회원 ]</span></div>
            <div id="myTab">
                 <a href="emplyMyPage1A.me"><div class="tabList" id="tab1">이력서 관리</div>|</a>
                    <a href="emplyMyPage2.me"><div class="tabList" id="tab2">모의면접 답변 모음</div>|</a>
                    <a href="emplyMyPage3.me"><div class="tabList" id="tab3">관심 기업 정보</div>|</a>
                    <a href="emplyMyPage4.me"><div class="tabList" id="tab4">기업 회원 전환</div></a>
                </div>
            <div id="boardLine"></div>
            <div id="TabContent1">
                    <div id="inform">
                    <table>
                            <thead>
                                <tr>
                                    <th width="300px" style="padding-left:20px;">기업명</th>
                                    <th width="360px" style="padding-left:20px;">기업 요약</th>
                                    <th width="335px" style="padding-left:20px;">기업 위치</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                
                                <tr>
                                    <td onClick="location.href='./comDetail.html'">
                                            <label>삼성전자</label>
                                    </td>
        
                                    <td>
                                        <div>
                                            <strong class="high">대기업</strong>
                                            <strong>산업군 | 제조업</strong>
                                            <label>평균연봉 : 5500만원</label>
                                        </div>
                                    </td>
        
                                    <td class="date">경기 수원시</td>
                                </tr>
                                
                                <tr>
                
                                    <td>
                                         <label>우아한 형제들</label>
                                    </td>
            
                                        <td>
                                            <div>
                                                <strong class="middle">중견 기업</strong>
                                                <strong>산업군 | IT</strong>
                                                <label>평균연봉 : 3500만원</label>
                                            </div>
                                        </td>
            
                                        <td class="date">경기 수원시</td>
                                </tr>
        
                                <tr>
                                 
        
                                    <td>
                                            <label>KH정보교육원</label>
                                        </td>
            
                                        <td>
                                            <div>
                                                <strong class="low">중소 기업</strong>
                                                <strong>산업군 | 교육업</strong>
                                                <label>평균연봉 : 2500만원</label>
                                            </div>
                                        </td>
            
                                        <td class="date">경기 수원시</td>
                                </tr>
                            </tbody>
                        </table>
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