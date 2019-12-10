<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
<link rel="stylesheet" href="resources/css/interview.css"> <!-- 해당페이지 CSS -->

<script type="text/javascript" src="resources/js/jquery.min.js"></script> <!-- 제이쿼리 JS (필수) -->
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS (필수) -->
<script type="text/javascript" src="resources/js/mockInterview.js"></script>
</head>
<body style="background:#F2F4F7">
    <jsp:include page="./header.jsp" />
    <div id="divBack"></div>
    <section>
        <div id="menu1LayOut">
            <div class="content-header">
                <div class="content-title">
                    모의 면접 테스트
                </div>
            </div>
            <div class="content-container" >
                <div id="boardLine">
                </div>
                <div class="question-box">
                        <span class="label label-info">Q</span>
                        <span class="question">  원치 않는 업무를 맡게 된다면 어떻게 하시겠습니까?</span>
                         <button class="nextbutton btn btn-primary" onclick="nextQ()">다음 질문</button>
            
                         
                         <!-- <button class="endbutton">종료</button> -->
                         <hr>
                </div>  
                    <div class="progress">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 33%;">
                             1번 문제
                            </div>
                    </div>
                        <div class="webcam-container">
                            <div class="webcam">
                
                            </div>
                            <div class="webcam-buttonbox">
                                
                                    <button class="recording" id="recButton" >
                                            <img src="resources/images/simulation/rec.png" alt=""
                                             class="recordingImg">
                                        </button>
                                        <span class="time">60</span>
                                        <span>sec</span>
                                    
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
   
</body>
</html>