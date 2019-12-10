<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" href="resources/css/myComPage1.css"> <!--해당페이지 CSS-->
<body style="background:#F2F4F7;height:1300px;">
    <jsp:include page="./header.jsp" />
      <div id="divBack"></div>
        <section>
        <div id="menu1LayOut">
            <div class="subject">마이 페이지 <span style="font-size:20px;">[ 기업 회원 ]</span></div>
        
            <div id="myTab">
                    <div class="tabList" id="tab1">관심 구직자 정보</div>
                </div>
            <div id="boardLine"></div>
            <div id="TabContent1">
                    <div id="inform">
                    <table>
                            <thead>
                                <tr>
                                    <th width="300px" style="padding-left:20px;">이름</th>
                                    <th width="360px" style="padding-left:20px;">이력서 요약</th>
                                    <th width="335px" style="padding-left:20px;">업데이트일</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                
                                <tr>
                                    <td>
                                        <label>박○○</label>
                                        <label class="genderage">(여 / 1994년, 26세)</label>
                                    </td>
        
                                    <td>
                                        <div>
                                            <strong class="newbie">신입</strong>
                                            <strong>어떤 일이든 열심히 하겠습니다.</strong>
                                            <label>○○대학교 (4년제) 경제학부</label>
                                            <div>서울</div>
                                            <div>/</div>
                                            <div>IT·인터넷</div>
                                            <div>/</div>
                                            <div>정규직</div>
                                            <div>/</div>
                                            <div>3000만원</div>
                                        </div>
                                    </td>
        
                                    <td class="date">19-10-08</td>
                                </tr>
                                
                                <tr>
                
                                    <td>
                                        <label>박○○</label>
                                        <label class="genderage">(여 / 1994년, 26세)</label>
                                    </td>
            
                                        <td>
                                            <div>
                                                <strong class="career">4년 5개월</strong>
                                                <strong>어떤 일이든 열심히 하겠습니다.</strong>
                                                <label>○○대학교 (4년제) 경제학부</label>
                                                <div>서울</div>
                                                <div>/</div>
                                                <div>IT·인터넷</div>
                                                <div>/</div>
                                                <div>정규직</div>
                                                <div>/</div>
                                                <div>3000만원</div>
                                            </div>
                                        </td>
            
                                        <td class="date">19-10-08</td>
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