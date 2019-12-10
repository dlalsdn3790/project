<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<link rel="stylesheet" href="resources/css/adminPage.css"> <!--해당페이지 CSS-->
<body style="background:#F2F4F7;height:1300px;">
    <jsp:include page="./header.jsp" />
      <div id="divBack"></div>
          <section>
        <div id="menu1LayOut">
            <div class="subject">관리자 페이지</div>
        
            <div id="myTab">
                    <div class="tabList" id="tab1">기업 회원 요청 정보</div>
                </div>
            <div id="boardLine"></div>
            <div id="TabContent1">
                    <div id="inform">
                    <table>
                            <thead>
                                <tr>
                                    <th width="300px">회사 이름</th>
                                    <th width="360px">사원증 사본</th>
                                    <th width="335px">회원 전환 여부</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                <c:forEach var="row" items="${map.list}">
                                <tr>
                                    <td>
                                        <label>${row.eName}</label>
                                    </td>
        
                                    <td>
                                        <img id="image_preview" src="resources/euploadFiles/${row.changeName}">
                                    </td>
        
                                    <td class="date">
                                    <c:if test="${row.eAccess eq 'normal'}">
                                    <div class="menuButton" id="menuButton" onclick="return validate(${row.eId});" style="text-align:center;">
                                    	<div id="eId" style="display:none;">${row.eId}</div>
                                    	승인
                                    </div>
                                    </c:if>
                                    <c:if test="${row.eAccess eq 'company'}">
                                    <div class="menuButton" id="menuButton2" style="text-align:center;">           
                                    	승인 완료
                                    </div>
                                    </c:if>
                                    </td>
                                </tr> 
                                </c:forEach>  
                            </tbody>
                        </table>
                    </div>  
            </div>
        </div>
    </section>
       
	<jsp:include page="./footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
   <script type="text/javascript">
   $(".myselect").select2();
   </script>
    <script>
   function validate(ss){
	   msg = "기업회원으로 전환 하시겠습니까?";
       if (confirm(msg)!=0) {
    	   var eId = document.getElementById("eId").innerHTML;
    	   alert(ss);
    	   location.href = "eupdate.do?eId=" + ss; 
       } else {
           alert("아니오");
		}
	         
    }
   </script>
</body>
</html>