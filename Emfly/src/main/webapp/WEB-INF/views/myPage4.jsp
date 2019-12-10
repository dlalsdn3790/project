<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" href="resources/css/myPage4.css"> <!--해당페이지 CSS-->
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
                <form action="einsert.me" method="post" id="enterForm" enctype="Multipart/form-data">
                		<input type="hidden" name="eId" value="${member.mId}">
                		<input type="hidden" name="eAccess" value="${member.mAccess}">  
                        <div id="inform">기업 회원으로 전환하시겠습니까?</div>
                        <div id="inform2">소속회사 / 사원증 사본 정보를 등록해주세요</div>
                        <div id="inform3">
                                <label>소속회사: </label><input type="text" name="eName">
                                <div id="imageAdd">
                                    <img id="image_preview" src="resources/images/idCardEmp.png">
                                </div>
                                <label for="file_to_upload" id="labelImage1">사원증 등록</label>
                                <input type="file" id="file_to_upload" name="uploadFile" onchange="ImagePreview()"/>
                        </div>
                       
                        <div id="menu1button" onclick="return validate();">제출</div>
                   </form> 

            </div>
        </div>
    </section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
      <script>
   function validate(){
	   $("#enterForm").submit();          
    }
   </script>
</body>
</html>