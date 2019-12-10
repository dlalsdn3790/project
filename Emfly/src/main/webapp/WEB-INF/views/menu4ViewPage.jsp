<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
    <link rel="stylesheet" href="resources/css/boardPage.css"> <!-- 해당페이지 CSS -->
    <script type="text/javascript" src="resources/js/jquery.min.js"></script> <!-- 제이쿼리 JS (필수) -->
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS (필수) -->
   <script src="/emfly/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body style="background:#F2F4F7;height:1250px;">
    <jsp:include page="./header.jsp" />
    <div id="divBack"></div>
    <form name="form1" method="post">
      <section >
        <div id="menu1LayOut">
                <div class="content-header">
                        <div class="content-title">
                            게시글
                        </div>
                </div>
                
                <div class="board-title">
                
                        <div class="title" id="title">
                           ${board.bTitle}
                        </div>
                        <div class="write-info">
                            <span id="writer">${board.mNickname}</span>
                            <span>${board.createDate}</span>
                            <span><img src="resources/images/ico/visibility.png" style="padding-bottom:3px;"><span id="count">${board.bCount}</span></span>
                        </div>
                    </div>
        
                    <div class="board-content" id="board-content">
                       ${board.bContent}
                    </div>
                    
                      <div id="replyList">
                      
                      </div> <!-- 댓글리스트 -->
            
                    
                    <div class="commentWrite">
                        <input type="text"  class="comment-content" id="comment" name="comment" maxlength="100" placeholder="내용을 입력하세요 (최대 100자)" value="">
                        <a href="javascript:go_replyInsert()"><div id="menu1button" name="menu1button">작성</div></a>
                    </div>
                    <div style="margin:0 auto;text-align: center;">
                       <c:if test="${sessionScope.member.mId == board.mId}">
                        <a href="javascript:go_boardUpdate()"><div id="menu4button">수정</div></a>
                        </c:if>
                        <a href="emplyMenu4List.me?"><div id="menu5button">목록</div></a>
                        <div id="bId" style="display:none;">${board.bId}</div>
                    </div>
        </div>
        
    </section>
   </form>
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
    </script>
    
    <script>
       function go_boardUpdate() {
         var bId2 = document.getElementById("bId").innerHTML;
         window.location.href = "/emfly/emplyMenu4UpdateView.me?bId="+bId2;
      }
    </script>
    <script>
    $(function(){
        
        replySelect();
        
    });
         function replySelect(){ 
          $.ajax({
             type:"get",
             url:"replyList.me?bId=${board.bId}",
                   
             success: function(data){
                
                $("#replyList").html(data);
             }
          });
        }  
    </script>
    <script>
       function go_replyInsert(){
          var rContent = $(".comment-content").val();
          var bId="${board.bId}";
          var m = '<%= session.getAttribute("member") %>';
          if(m != "null"){
           if(rContent == ""){
            alert("내용을 입력하세요");
            document.form1.rContent.focus();
            return;
              }else{
                 if(confirm("댓글을 등록 하시겠습니까?") == true){
                    $.ajax({
                        
                      type:"POST",
                      url: "replyInsert.me",
                      data : {bId:bId,rContent:rContent},
                      success: function(data){ 
                          alert("댓글이 등록되었습니다."); 
                         replySelect();  
                              }
                       });  
                 }else{
                    return;
                 }
              }
         }else{
            alert("로그인 후 이용가능한 서비스입니다.");
            location.href="loginPage.do";
         }
       }  
    
    </script>
    
</body>
</html>