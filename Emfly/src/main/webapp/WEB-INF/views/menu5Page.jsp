<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
    <link rel="stylesheet" href="resources/css/question.css"> <!-- 해당페이지 CSS -->
    <script type="text/javascript" src="resources/js/jquery.min.js"></script> <!-- 제이쿼리 JS (필수) -->
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS (필수) -->
    <script type="text/javascript" src="resources/js/question.js"></script>
</head>
<body style="background:#F2F4F7;height:1250px;">
    <jsp:include page="./header.jsp" />
     <div id="divBack"></div>
    <section>
        <div id="menu1LayOut">
            <div class="content-header">
                <div class="content-title">
                    예상 면접 질문
                </div>
            </div>
            <form action="qinsert.me" method="post" id="questionForm">
            <div class="content-container">
                <div id="boardLine">
                </div>
                    <div class="board-list">
                        <div class="title">
                            <span class="ct" id="ct1">1. ${map.qlist1.qName}</span> <div id="textDiv1">글자수: ( <span id="textLength1">0</span> / 300 )</span></div>
                       		<input type="hidden" name="question1"/>
                        </div>
                    </div>
                    <div class="answer">
                    <textarea cols="100" rows="8" name="answer1" id="answer1" maxlength="300"></textarea>
                    </div>
                    <div class="board-list">
                        <div class="title">
                            <span class="ct" id="ct2">2. ${map.qlist2.qName}</span><div id="textDiv2">글자수: ( <span id="textLength2">0</span> / 300 )</span></div>
                        	<input type="hidden" name="question2"/>
                        </div>
                    </div>
                    <div class="answer">
                        <textarea cols="100" rows="8" name="answer2" id="answer2" maxlength="300"></textarea>
                    </div>
                    <div class="board-list">
                        <div class="title">
                            <span class="ct" id="ct3">3. ${map.qlist3.qName}</span><div id="textDiv3">글자수: ( <span id="textLength3">0</span> / 300 )</span></div>
                        	<input type="hidden" name="question3"/>
                        	<input type="hidden" name="writerId" value="${member.mEmail}"/>
                        </div>
                    </div>
                    <div class="answer">
                        <textarea cols="100" rows="8" name="answer3" id="answer3" maxlength="300"></textarea>
                    </div>
                    <button type="submit" id="menu1button" onclick="return validate();">답변 제출</button>     
        		</div>
        		</form>
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
    <script>
    function validate(){
    	var ct1 = document.getElementById("ct1").innerHTML;
    	var ct2 = document.getElementById("ct2").innerHTML;
    	var ct3 = document.getElementById("ct3").innerHTML;
    	$('input[name=question1]').attr('value',ct1); 
    	$('input[name=question2]').attr('value',ct2); 
    	$('input[name=question3]').attr('value',ct3); 
        $("#questionForm").submit();            
     }
    </script>
</body>
</html>