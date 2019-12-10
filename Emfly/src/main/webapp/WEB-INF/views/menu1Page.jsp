<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" href="resources/css/menu1Screen.css"> <!-- 메인페이지 스크린 CSS -->
<link rel="stylesheet" href="resources/css/select2.min.css"> 
<script type="text/javascript" src="resources/js/select2.min.js"></script>

</head>
<body style="background:url(resources/images/Background.png);">
    <jsp:include page="./header.jsp" />
	  
         <section>
        <div id="menu1LayOut">
            <div id="menu1Title">AI 자기소개서 분석</div>
            <div id="div1Text">자기소개 분석을 원하는 직무를 선택하세요</div>
            
            <div id="selectJob">
               <div id="jobTitle">- 분석 직무 -</div>
               <div style="margin:0 auto;margin-left:400px;width: 600px;">
                    <select id="demo1">
                            <option value="1">분석 직무 선택</option>
                            <option value="2">CSS3</option>
                            <option value="3">JavaScript</option>
                            <option value="4">jQuery</option>
                            <option value="5">AngularJS</option>
                            <option value="6">ReactJS</option>
                            <option value="7">React Native</option>
                            <option value="8">Bootstrap</option>
                            <option value="9">Vue.js</option>
                            <option value="10">Python</option>
                          </select>
                          
               </div>    
            </div>
            <div id="selectJob">
            <div id="jobTitle">- 희망 기업 -</div>
           
            <div style="margin:0 auto;display:inline-block;width: 200px;height: 40px;">
                    <select id="demo2">
                            <option value="0">기업 선택(1)</option>
                            <option value="1">HTML</option>
                            <option value="2">CSS3</option>
                            <option value="3">JavaScript</option>
                            <option value="4">jQuery</option>
                            <option value="5">AngularJS</option>
                            <option value="6">ReactJS</option>
                            <option value="7">React Native</option>
                            <option value="8">Bootstrap</option>
                            <option value="9">Vue.js</option>
                            <option value="10">Python</option>
                          </select>
            </div>      
                 
                
            <div style="margin:0 auto;margin-left:10px;display:inline-block;width: 200px;">
                    <select id="demo3">
                            <option value="0">기업 선택(2)</option>
                            <option value="1">HTML</option>
                            <option value="2">CSS3</option>
                            <option value="3">JavaScript</option>
                            <option value="4">jQuery</option>
                            <option value="5">AngularJS</option>
                            <option value="6">ReactJS</option>
                            <option value="7">React Native</option>
                            <option value="8">Bootstrap</option>
                            <option value="9">Vue.js</option>
                            <option value="10">Python</option>
                          </select>
            </div>  
            
            
            <div style="margin:0 auto;margin-left:10px;display:inline-block;width: 200px;">
                    <select id="demo4">
                    		<option value="0">기업 선택(3)</option>
                            <option value="1">HTML</option>
                            <option value="2">CSS3</option>
                            <option value="3">JavaScript</option>
                            <option value="4">jQuery</option>
                            <option value="5">AngularJS</option>
                            <option value="6">ReactJS</option>
                            <option value="7">React Native</option>
                            <option value="8">Bootstrap</option>
                            <option value="9">Vue.js</option>
                            <option value="10">Python</option>
                          </select>
            </div>
                 
            </div>
        
               
            <div id="div2Text">주의사항에 유의하여 자기소개서를 입력하세요</div>
            <div id="menu1Div2">
                <div>1. 500자 미만의 올바른 자기소개서인지 확인해주세요.</div>
                <div>2.자기소개서 질문의 포함 여부와 띄어쓰기, 줄 간격은 분석 결과에 영향을 주지 않습니다.</div>
           </div> 
           <div id="question"> 본인에 대한 소개를 자유롭게 기술해 주세요. (500자) </div> 
        <div id="textDiv">글자수: ( <span id="textLength">0</span> / 500 )</span></div>
        <textarea cols="100" rows="8" style="resize: none;width:800px;" maxlength="500"></textarea>
        <a href="./mainPage.html"><div id="menu1button">분석하기</div></a>
        </div>
   
    </section>   
	<jsp:include page="./footer.jsp" />
    <a href="#" id="nino-scrollToTop">Go to Top</a> <!-- 스크롤 위치 A 태그 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="resources/js/jquery.dlmenu.js"></script> <!-- Drop Down Menu JS 파일 (필수)-->
    <script src="resources/js/calendar.js"></script> <!-- 달력 JS 파일 -->
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
     <script>
            var mySelect = new Select('#demo1',{
                   filtered: 'auto',
                   filter_threshold: 8,
                   filter_placeholder: '분석 직무 선택'
               });
               var mySelect = new Select('#demo2',{
                   filtered: 'auto',
                   filter_threshold: 8,
                   filter_placeholder: '기업 선택(1)'
               });
               var mySelect = new Select('#demo3',{
                   filtered: 'auto',
                   filter_threshold: 8,
                   filter_placeholder: '기업 선택(2)'
               });
               var mySelect = new Select('#demo4',{
                   filtered: 'auto',
                   filter_threshold: 8,
                   filter_placeholder: '기업 선택(3)'
               });
           </script>   
</body>
</html>