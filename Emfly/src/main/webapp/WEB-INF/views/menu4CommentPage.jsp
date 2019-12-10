<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
    <link rel="stylesheet" href="resources/css/boardPage.css"> <!-- 해당페이지 CSS -->
    <script type="text/javascript" src="resources/js/jquery.min.js"></script> <!-- 제이쿼리 JS (필수) -->
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS (필수) -->
</head>
<body>
   <div id="comment-title">(${rCount})개의 댓글</div>
                    <div class="comment-container" id="comment-container">
                       <c:forEach var="r" items="${reList}"> 
                        <div class="comment-list" id="replyList">
                            <div class="writer">
                                <span class="comment-id">${r.mNickname}</span>
                            </div> 
                            <div class="comment">
                                <span>${r.createDate}</span>
                            </div>
                        </div>
                        <div class="comment-list2">
                            <div>
                                <div class="comment-content2" id="comment" name="comment">${r.rContent}</div>
                                <c:if test="${sessionScope.member.mId == r.mId}">
                                <a href="javascript:go_replyDelete()"><div id="menu2button">삭제</div></a>
                                </c:if>
                                <%-- <input type="hidden" id="comment-id" value="${r.rId}"></input> --%>
                                 <div id="rId" style="display:none;">${r.rId}</div>
                            </div>
                        </div>
                        </c:forEach>
                    </div> 


 <script>
       function go_replyDelete(){
          var rId = document.getElementById("rId").innerHTML;
         
          if(confirm("댓글을 삭제하시겠습니까?") == true){
          $.ajax({
             type:"POST",
             url: "replyDelete.me",
             data : {rId:rId},
             success: function(data){ 
                 alert("댓글 삭제가 완료되었습니다."); 
                replySelect();  
               }
           });  
          }else{
             return;
          }
       }  
    
    </script>
</body>
</html>