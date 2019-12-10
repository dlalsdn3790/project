<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
    <link rel="stylesheet" href="resources/css/boardList.css"> <!-- 해당페이지 CSS -->
    <script type="text/javascript" src="resources/js/jquery.min.js"></script> <!-- 제이쿼리 JS (필수) -->
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS (필수) -->
    <script src="/emfly/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body style="background:#F2F4F7;height:1000px;">
    <jsp:include page="./header.jsp" />
    <div id="divBack"></div>
    <section>
        <div id="menu1LayOut">
            <div class="content-header">
                <div class="content-title">
                    정보공유 게시판
                </div>
              <%-- <c:if test="${sessionScope.member.mNickname != null}"> --%>
                <!-- <a href="emplyMenu4Write.me"> -->  <a href="javascript:loginCheck()"><button class="write-button"><img src="resources/images/ico/pencil.png">&nbsp;<span>글쓰기</span></button></a>
               <%-- </c:if> --%>
                <div class="board-search">
                    <input type="text" id="keyword" name="keyword" class="search" placeholder="게시글 검색" value="${map.keyword}">
                    <a href="javascript:go_searchList()"><img src="resources/images/ico/search.png" class="search-img"></a>
                </div>
                <div style="margin-left:780px;">
                    (${map.listCount})개의 게시글이 있습니다.
                </div>
            </div>
            <div class="content-container">
                <div id="boardLine">
                </div>
                <c:forEach var="b" items="${map.list}">
                <c:url var="bdetail" value="emplyMenu4View.me">
                   <c:param name="bId" value="${b.bId}"/>
                   <c:param name="page" value="${map.boardPager.curPage}" />
                  </c:url>
                <a href="${bdetail}">
                    <div class="board-list">
                        <div class="title">
                        
                            <span class="ct">${b.bTitle}</span>
                        </div>
                        <span class="view-count"><img src="resources/images/ico/visibility.png"><span class="count">${b.bCount}</span></span>
                        <span class="date">${b.createDate}<%-- <fmt:formatDate value="${b.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%></span>
                        <span class="writer">${b.mNickname}</span>
                    </div>
                </a>
                </c:forEach>
                <div class="page">
                        <ul class="pagination pg-blue">
                                <li class="page-item"><a href="#" onclick="list('1')">&laquo;</a>
                                    
                                </li>
                                <c:forEach var="num" begin="${map.boardPager.blockBegin}"
                                      end="${map.boardPager.blockEnd}">
                                      <c:choose>
                                      <c:when test="${num == map.boardPager.curPage}">
                        <li class="page-item active"><a class="page-link">${num}</a>
                        </li>
                              </c:when>
                                 <c:otherwise>
                        <li class="page-item"><a href="#" onclick="list('${num}')">
                              ${num} </a></li>
                                 </c:otherwise>
                           </c:choose>
                        </c:forEach>
                        <li class="page-item"><c:if
                           test="${map.boardPager.curPage <= map.boardPager.totPage}">
                           <a href="#" onclick="list('${map.boardPager.totPage}')">»</a>
                           </c:if>
                        </li>
                        </ul>
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
   
   <script>
      function go_searchList() {
         var keyword = $("#keyword").val();

         window.location.href = "/emfly/emplyMenu4List.me?page=1&keyword="+ keyword;
      }
   </script>
   
   <script>
   function list(page) {
      console.log("페이지를 이동합니다.");
      location.href = "emplyMenu4List.me?curPage=" + page;
   }
</script>

<script>
   function loginCheck() {
      //if(${not empty sessionScope.member.mNickname}){
      var m = '<%= session.getAttribute("member") %>';
      if(m != "null"){
         /* ${sessionScope.member.mNickname != null} */
         location.href="emplyMenu4Write.me";
      }else{
         alert("로그인 후 이용가능한 서비스입니다.");
         location.href="loginPage.do";
      }
   }
</script>
   
</body>
</html>