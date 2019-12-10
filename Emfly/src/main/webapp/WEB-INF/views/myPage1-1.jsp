<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
<link rel="stylesheet" href="resources/css/myPage1-1.css"> <!--해당페이지 CSS-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body style="background:#F2F4F7;height:1600px;">
    <jsp:include page="./header.jsp" />
      <div id="divBack"></div>
      <section>
      
        <div id="menu1LayOut">
            <div class="subject">마이 페이지 <span style="font-size:20px;">[ 개인 회원 ]</span></div>
            <div id="myTab">
                    <a href="emplyMyPage1A.me"><div class="tabList" id="tab1">이력서 관리</div>|</a>
                    <a href="emplyMyPage2.me?mEmail=${member.mEmail}"><div class="tabList" id="tab2">모의면접 답변 모음</div>|</a>
                    <a href="emplyMyPage3.me"><div class="tabList" id="tab3">관심 기업 정보</div>|</a>
                    <a href="emplyMyPage4.me"><div class="tabList" id="tab4">기업 회원 전환</div></a>
                </div>
            <div id="boardLine"></div>
            <div id="TabContent1">
                <div class="subject2">이력서 작성</div>
                <div id="menu1button" onclick="return validate();">작성완료</div>
                <h2 class="header">인적사항</h2>
				
				<form action="rinsert.do" method="post" id="resumeForm"> <!-- enctype="Multipart/form-data" -->
                <div class="form formProfile">
                    <div class="row">
                        <div class="input is-label input-profile-name is-value">
                            <label for="UserInfo_M_Name">이름</label>
                            <input type="text" id="UserInfo_M_Name" name="rName">
                        </div>
                        <div class="input is-label input-profile-birth is-value">
                            <label for="UserInfo_M_Born">생년월일</label>
                            <input id="UserInfo_M_Born" type="text" name="reBirth">
                        </div>
                        <div class="dropdown">
                        <div class="label">성별</div>
                            <select class="label-selectbox" name="reGender">
                                <option value="남자">남자</option>
                                <option value="여자">여자</option>
                            </select>
                        </div>
                        <div class="input input-profile-email is-label is-value">
                            <label for="UserInfo_M_Email">이메일</label>
                            <input type="email" id="UserInfo_M_Email" name="reEmail">
                            <div class="autocomplete hidden" aria-hidden="true"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input is-label input-profile-hp is-value">
                            <label for="UserInfo_M_Hand_Phone">휴대폰번호</label>
                            <input type="text" id="UserInfo_M_Hand_Phone"
                                maxlength="13" name="rePhone">
                        </div>
                        <a href="javascript:addrSearch();" class="input is-label input-profile-addr is-value">
                            <label for="temp_M_Addr_Text">주소</label>
                            <input type="text" id="temp_M_Addr_Text" name="reAddress">
                        </a>
                    </div>


                    <!-- <div class="picture dropped">
                        <div class="guide">  
                            <img src="resources/images/ico/plus.png" id="image_preview" style="cursor: pointer;">
                        </div>  
                    </div>
                    <label for="file_to_upload" id="labelImage1">사진 추가</label>
                    <input type="file" id="file_to_upload" name="uploadFile" onchange="ImagePreview()" accept=".gif, .jpg, .png" /> -->
                </div>
                <h2 class="header">학력</h2>
                 <div class="formWrap formWrapEducation" id="formEducation">
                   
                    <div class="form formEducation">
                        <div id="school_containers">
                            <div class="container container1" data-cid="c1">
                                <div class="row">
                                    <div class="dropdown dropdown-education-category selected is-label"  style="width:206px;">
                                        <div class="label">학교구분</div>
                                            <select class="label-selectbox" name="reSchool" style="width:206px;">
                                                <option value="(고졸이하)">고졸이하</option>
                                                <option value="(2,3년제)">대학교(2,3년)</option>
                                                <option value="(4년제)">대학교(4년제)</option>
                                                <option value="(석사)">대학원</option>
                                                <option value="(박사)">박사과정</option>
                                            </select>
                                    </div>
                                    <div class="input input-education-name is-label is-ellipsis  is-value"
                                        id="UnivSchoolautoComplete_c1">
                                        <label for="UnivSchool_Schl_Name_c1">학교명</label>
                                        <input type="text" id="UnivSchool_Schl_Name_c1" name="reScname" maxlength="50">
                                        <div class="validation hidden">학교명을 입력해주세요</div>
                                    </div>
                                   
                                    <div class="input input-education-startdate is-label is-value">
                                        <label for="UnivSchool_Entc_YM_c1">입학년월</label>
                                        <input type="text" id="UnivSchool_Entc_YM_c1" name="reSdate"
                                             >
                                      
                                    </div>
                                    <div class="input input-education-enddate is-label is-value">
                                        <label for="UnivSchool_Grad_YM_c1">졸업년월</label>
                                        <input type="text" id="UnivSchool_Grad_YM_c1" name="reEdate"
                                             >
                                       
                                    </div>
                                    <div class="dropdown">
                                        <div class="label">졸업상태</div>
                                            <select class="label-selectbox" name="reGraduate">
                                                <option value="졸업">졸업</option>
                                                <option value="졸업예정">졸업예정</option>
                                                <option value="재학중">재학중</option>
                                                <option value="중퇴">중퇴</option>
                                                <option value="수료">수료</option>
                                                <option value="휴학">휴학</option>
                                            </select>
                                        </div>
                                    </div>
                                <div class="row">
                                    <span class="devMainMajorTemplateArea">

                                        <div class="input input-education-major-name search is-label is-value" id="UnivMajorAutoComplete_1_0">
                                            <label for="univmajor_0_0">전공명</label>
                                            <input type="text" id="univmajor_0_0" maxlength="50" name="reMajor">
                                            <div class="autocomplete hidden">
                                            </div>
                                        </div>

                                    </span>
                                    <div class="input input-education-grades is-label is-value"
                                        style="width:106px; margin-right:-1px;">
                                        <label for="UnivSchool_Grade_c1">학점</label>
                                        <input type="text" id="UnivSchool_Grade_c1" name="reGpoint"
                                            maxlength="4">
                                    </div>

                                    <div class="dropdown">
                                            <div class="label">총점</div>
                                            <select class="label-selectbox" name="reTpoint">
                                                <option value="4.5">4.5</option>
                                                <option value="4.3">4.3</option>
                                                <option value="4.0">4.0</option>
                                                <option value="100">100</option>
                                            </select>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 class="header">경력</h2>
                <div class="formWrap formWrapCareer" id="formCareer">


                    <div class="form formCareer">

                        <div id="career_containers">
                            <div class="container container1">
                                <div class="row">
                                   
                                    <div class="input input-career-name is-label">
                                        <label for="Career_C_Name_c7">회사명</label>
                                        <input type="text" id="Career_C_Name_c7" name="reComName" maxlength="50">
                                    </div>
                                    <div class="input input-career-part is-label" style="margin-right:0px;">
                                        <label for="Career_C_Part_c7">부서명</label>
                                        <div class="validation hidden"></div>
                                        <input type="text" id="Career_C_Part_c7" name="reDivName"
                                            maxlength="25">
                                    </div>

                                    <div class=" input rank">
                                        <label>직급/직책</label>
                                        <input type="text" id="Career_C_Part_c7" name="reRank"
                                            maxlength="25">
                                    </div>

                                    <div class=" input input-career-joindate is-label">
                                        <label for="Career_CSYM_c7">근속년수</label>
                                        <input type="text" id="Career_CSYM_c7" name="reYear"
                                                 maxlength="2">
                                        <div class="unit">년</div>
                                    </div>

                                </div>
                                <div class="row workInputRow">
                                    <div class="textarea is-label workInput">
                                        <label for="lbl_o_experience_contents">담당업무</label>
                                        <textarea cols="30" rows="10" id="Career_Prfm_Prt_c7" name="reWorkInfo"
                                            placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 class="header">희망근무조건</h2>
                <div class="formWrap formWrapHopework" id="formWrapHopework">
                    <div class="form formHopework" id="formHopework">
                        <div class="row">
                            <div class="dropdown dropdown-hopework-type is-label selected">
                                    <div class="label" style="left: 10px;">고용형태</div>
                                    <select class="label-selectbox" id="selectbox" name="reEmploy">
                                        <option value="졸업">정규직</option>
                                        <option value="졸업예정">계약직</option>
                                        <option value="수료">인턴직</option>
                                        <option value="중퇴">파견직</option>
                                        <option value="재학중">프리랜서</option>
                                    </select>
                            </div>

                            <div class="dropdown dropdown-hopework-type is-label selected">
                                    <div class="label" style="left: 10px;">직종구분</div>
                                    <select class="label-selectbox" id="selectbox" name="reEmDiv">
                                        <option value="경영·사무">경영·사무</option>
                                        <option value="영업·고객상담">영업·고객상담</option>
                                        <option value="건설">건설</option>
                                        <option value="생산·제조">생산·제조</option>
                                        <option value="유통·무역">유통·무역</option>
                                        <option value="IT·인터넷">IT·인터넷</option>
                                        <option value="전문직">전문직</option>
                                        <option value="디자인">디자인</option>
                                        <option value="교육">교육</option>
                                    </select>
                            </div>

                            <div class="dropdown dropdown-hopework-type is-label selected">
                                    <div class="label" style="left: 10px;">희망근무지역</div>
                                    <select class="label-selectbox" id="selectbox" name="reLocation">
                                        <option value="서울">서울</option>
                                        <option value="경기">경기</option>
                                        <option value="광주">광주</option>
                                        <option value="대구">대구</option>
                                        <option value="대전">대전</option>
                                        <option value="부산">부산</option>
                                        <option value="울산">울산</option>
                                        <option value="인천">인천</option>
                                        <option value="세종">세종</option>
                                        <option value="강원">강원</option>
                                        <option value="경남">경남</option>
                                        <option value="경북">경북</option>
                                        <option value="전남">전남</option>
                                        <option value="전북">전북</option>
                                        <option value="충북">충북</option>
                                        <option value="충남">충남</option>
                                        <option value="제주">제주</option>
                                        <option value="전국">전국</option>
                                    </select>
                            </div>

                            <div class="input input-hopework-salary is-label">
                                <label for="UserWishWork_M_Want_Pay_Amt">희망연봉</label>
                                <input type="text" id="UserWishWork_M_Want_Pay_Amt"
                                      maxlength="5" name="reSalary">
                                <div class="unit">만원</div>
                            </div>
                        </div>

                    </div>

                </div>
                <table style="margin-left:580px;margin-top:30px;">
                    <th style="font-size:20px; font-weight: bold; padding-right:30px;">이력서 공개여부</th>
                    <td style="padding-left:10px;"><label class="radio">
                        <input type="radio" value="1" name="reStatus" checked>
                        <span>공개</span>
                    </label></td>
                    <td style="padding-left:10px;"><label class="radio">
                        <input type="radio" value="2" name="reStatus"> 
                        <span>비공개</span>
                    </label></td>
                </table>
                
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
   function addrSearch() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;

               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               $('#temp_M_Addr_Text').val(data.zonecode); //5자리 새우편번호 사용
               
               $('#temp_M_Addr_Text').val(fullAddr);

               // 커서를 상세주소 필드로 이동한다.
               $('#temp_M_Addr_Text').focus();
           }
       }).open();
   };
   </script>
   <script>
   function validate(){
	   $("#resumeForm").submit();          
    }
   </script>
</body>
</html>