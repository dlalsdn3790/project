<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.clickable {cursor: pointer;color:white;}
.hover {text-decoration: underline;color:white;}

.wrapper {
  width: 800px;
  padding: 10px;
  margin: 20px auto;
  background-color: #ffffff;
  box-shadow: 0 1px 2px 0 #c9ced1;
  border-radius: 4px;
  color:white;
}
.page-number{
	display:inline-block;
	width:30px;
	box-shadow: 0 1px 2px 0 #c9ced1;
    border-radius: 4px;
    color:black;
    padding:5px;
    text-align:center;
    display: inline-block;
  	vertical-align: top;
  	font-size: 15px;
  	font-weight: bold;
}

h1 {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 20px;
}



/* ------------------------------ PAGINTION BEGIN ------------------------------ */
.pager {
  margin: 0 0 3.75rem;
  font-size: 0;
  text-align: center;
}
.page-number:hover, .page-number:focus, .page-number:active {
  background-color: #2E64FE;
  border-color: #2E64FE;
  color: #fff;
  text-decoration: none;
}

.active{background:#08298A; color:white; display:inline-block;}

</style>
<meta charset="UTF-8">
<title>EMFLY - 기업 검색</title>
<link rel="shortcut icon" href="resources/images/ico/favicon.png">

<!-- 부트 스트랩 CSS (필수)-->
<link rel="stylesheet" type="text/css"
   href="resources/css/bootstrap.min.css" />

<!-- 메인페이지 스크린 CSS -->
<link rel="stylesheet" href="resources/css/searchCompany.css">

<!-- 제이쿼리 JS (필수) -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<!-- 기업 검색 JS -->
<script type="text/javascript" src="resources/js/searchCompany.js"></script>
<script>
   function list(page) {
      console.log("페이지를 이동합니다.");
      location.href = "searchCompany.co?Page=" + page;
   }
</script>
</head>
<body>
   <jsp:include page="header.jsp" />

   <sql:setDataSource var="snapshot"
      driver="oracle.jdbc.driver.OracleDriver"
      url="jdbc:oracle:thin:@127.0.0.1:1521:XE" user="emfly"
      password="emfly" />

   <div id="divBack"></div>

   <section>
      <form id="checkform">
         <div id="checkbox">
            <strong>기업 분류</strong>

            <div>
               <sql:query dataSource="${snapshot}" var="result1">
               select * from company where cdiv = '대기업'
               </sql:query>
               <input type="checkbox" id="c1" value="대기업" name="cDiv"
                  onclick="choice()" /> <label for="c1"><span></span>대기업 <label
                  id="count"> <c:out value="${result1.rowCount}" />
               </label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result2">
               select * from company where cdiv = '중견기업'
               </sql:query>
               <input type="checkbox" id="c2" value="중견기업" name="cDiv"
                  onclick="choice()" /> <label for="c2"><span></span>중견기업 <label
                  id="count"><c:out value="${result2.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result3">
               select * from company where cdiv = '중소기업'
               </sql:query>
               <input type="checkbox" id="c3" value="중소기업" name="cDiv"
                  onclick="choice()" /> <label for="c3"><span></span>중소기업 <label
                  id="count"><c:out value="${result3.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result4">
               select * from company where cdiv = '기타'
               </sql:query>
               <input type="checkbox" id="c4" value="기타" name="cDiv"
                  onclick="choice()" /> <label for="c4"><span></span>기타<label
                  id="count"><c:out value="${result4.rowCount}" /></label> </label>
            </div>

            <div class="line"></div>

            <strong>회사 위치</strong>

            <div>
               <sql:query dataSource="${snapshot}" var="result5">
               select * from company where cLocation like '%'|| '서울' ||'%'
               </sql:query>
               <input type="checkbox" id="c11" value="서울" name="cLocation"
                  onclick="choice()" /> <label for="c11"><span></span>서울<label
                  id="count"><c:out value="${result5.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result6">
               select * from company where cLocation like '%'|| '경기' ||'%'
               </sql:query>
               <input type="checkbox" id="c12" value="경기" name="cLocation"
                  onclick="choice()" /> <label for="c12"><span></span>경기<label
                  id="count"><c:out value="${result6.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result7">
               select * from company where cLocation like '%'|| '광주광역시' ||'%'
               </sql:query>
               <input type="checkbox" id="c13" value="광주광역시" name="cLocation"
                  onclick="choice()" /> <label for="c13"><span></span>광주<label
                  id="count"><c:out value="${result7.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result8">
               select * from company where cLocation like '%'|| '대구' ||'%'
               </sql:query>
               <input type="checkbox" id="c14" value="대구" name="cLocation"
                  onclick="choice()" /> <label for="c14"><span></span>대구<label
                  id="count"><c:out value="${result8.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result9">
               select * from company where cLocation like '%'|| '대전' ||'%'
               </sql:query>
               <input type="checkbox" id="c15" value="대전" name="cLocation"
                  onclick="choice()" /> <label for="c15"><span></span>대전<label
                  id="count"><c:out value="${result9.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result10">
               select * from company where cLocation like '%'|| '부산' ||'%'
               </sql:query>
               <input type="checkbox" id="c16" value="부산" name="cLocation"
                  onclick="choice()" /> <label for="c16"><span></span>부산<label
                  id="count"><c:out value="${result10.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result11">
               select * from company where cLocation like '%'|| '울산' ||'%'
               </sql:query>
               <input type="checkbox" id="c17" value="울산" name="cLocation"
                  onclick="choice()" /> <label for="c17"><span></span>울산<label
                  id="count"><c:out value="${result11.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result12">
               select * from company where cLocation like '%'|| '인천' ||'%'
               </sql:query>
               <input type="checkbox" id="c18" value="인천" name="cLocation"
                  onclick="choice()" /> <label for="c18"><span></span>인천<label
                  id="count"><c:out value="${result12.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result13">
               select * from company where cLocation like '%'|| '세종' ||'%'
               </sql:query>
               <input type="checkbox" id="c19" value="세종" name="cLocation"
                  onclick="choice()" /> <label for="c19"><span></span>세종<label
                  id="count"><c:out value="${result13.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result14">
               select * from company where cLocation like '%'|| '강원' ||'%'
               </sql:query>
               <input type="checkbox" id="c20" value="강원" name="cLocation"
                  onclick="choice()" /> <label for="c20"><span></span>강원<label
                  id="count"><c:out value="${result14.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result15">
               select * from company where cLocation like '%'|| '경상남도' ||'%'
               </sql:query>
               <input type="checkbox" id="c21" value="경상남도" name="cLocation"
                  onclick="choice()" /> <label for="c21"><span></span>경남<label
                  id="count"><c:out value="${result15.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result16">
               select * from company where cLocation like '%'|| '경상북도' ||'%'
               </sql:query>
               <input type="checkbox" id="c22" value="경상북도" name="cLocation"
                  onclick="choice()" /> <label for="c22"><span></span>경북<label
                  id="count"><c:out value="${result16.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result17">
               select * from company where cLocation like '%'|| '전라남도' ||'%'
               </sql:query>
               <input type="checkbox" id="c23" value="전라남도" name="cLocation"
                  onclick="choice()" /> <label for="c23"><span></span>전남<label
                  id="count"><c:out value="${result17.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result18">
               select * from company where cLocation like '%'|| '전라북도' ||'%'
               </sql:query>
               <input type="checkbox" id="c24" value="전라북도" name="cLocation"
                  onclick="choice()" /> <label for="c24"><span></span>전북<label
                  id="count"><c:out value="${result18.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result19">
               select * from company where cLocation like '%'|| '충청북도' ||'%'
               </sql:query>
               <input type="checkbox" id="c25" value="충청북도" name="cLocation"
                  onclick="choice()" /> <label for="c25"><span></span>충북<label
                  id="count"><c:out value="${result19.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result20">
               select * from company where cLocation like '%'|| '충청남도' ||'%'
               </sql:query>
               <input type="checkbox" id="c26" value="충청남도" name="cLocation"
                  onclick="choice()" /> <label for="c26"><span></span>충남<label
                  id="count"><c:out value="${result20.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result21">
               select * from company where cLocation like '%'|| '제주' ||'%'
               </sql:query>
               <input type="checkbox" id="c27" value="제주" name="cLocation"
                  onclick="choice()" /> <label for="c27"><span></span>제주<label
                  id="count"><c:out value="${result21.rowCount}" /></label> </label>
            </div>

            <div class="line"></div>

            <strong>평균 급여</strong>

            <div>
               <sql:query dataSource="${snapshot}" var="result22">
               select * from company where csalary < 25000000
               </sql:query>
               <input type="checkbox" id="c101" value="25000000" name="cSalary"
                  onclick="choice()" /> <label for="c101"><span></span>~2,500만원<label
                  id="count"><c:out value="${result22.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result23">
               select * from company where csalary between 25000001 and 30000000
               </sql:query>
               <input type="checkbox" id="c102" value="30000000" name="cSalary"
                  onclick="choice()" /> <label for="c102"><span></span>~3,000만원<label
                  id="count"><c:out value="${result23.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result24">
               select * from company where csalary between 30000001 and 35000000
               </sql:query>
               <input type="checkbox" id="c103" value="35000000" name="cSalary"
                  onclick="choice()" /> <label for="c103"><span></span>~3,500만원<label
                  id="count"><c:out value="${result24.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result25">
               select * from company where csalary between 35000001 and 45000000
               </sql:query>
               <input type="checkbox" id="c104" value="45000000" name="cSalary"
                  onclick="choice()" /> <label for="c104"><span></span>~4,500만원<label
                  id="count"><c:out value="${result25.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result26">
               select * from company where csalary between 45000001 and 50000000
               </sql:query>
               <input type="checkbox" id="c105" value="50000000" name="cSalary"
                  onclick="choice()" /> <label for="c105"><span></span>~5,000만원<label
                  id="count"><c:out value="${result26.rowCount}" /></label> </label>
            </div>

            <div>
               <sql:query dataSource="${snapshot}" var="result27">
               select * from company where csalary >= 50000001
               </sql:query>
               <input type="checkbox" id="c106" value="50000001" name="cSalary"
                  onclick="choice()" /> <label for="c106"><span></span>5,000만원~
                  <label id="count"><c:out value="${result27.rowCount}" /></label>
               </label>
            </div>
         </div>
      </form>

      <div id="content">
         <div id="checklist">
            <div id="list">
               <ul id="ul">
               </ul>
            </div>

            <input type="image" src="resources/images/reset.png"
               onclick="allreset()"> <strong>초기화</strong>
         </div>
         <div id="inform">
            <div id="searchDiv">

               <div class="board-search">
                  <input type="text" class="search" id="searchWord"
                     name="searchWord" placeholder="기업명 검색" value="${searchWord}">
                  <img src="resources/images/ico/search.png" class="search-img" onclick="choice()">
               </div>
            </div>

            <table class="tbl paginated" id="tbl">
               <thead>
                  <tr>
                     <th width="85px"></th>
                     <th>기업명</th>
                     <th>기업 요약</th>
                     <th>기업 위치</th>
                  </tr>
               </thead>

               <tbody id="tbody">

					</tbody>
               
              	
            </table>
            
         </div>
 		
          <%-- <div class="page">
            <ul class="pagination pg-blue">
               <li class="page-item"><a href="#" onclick="list('1')">&laquo;</a>
               </li>
               <c:forEach var="num" begin="${pager.blockBegin}"
                  end="${pager.blockEnd}">
                  <c:choose>
                     <c:when test="${num == pager.curPage}">
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
                     test="${pager.curPage <= pager.totPage}">
                     <a href="#" onclick="list('${pager.totPage}')">»</a>
                  </c:if></li>
            </ul>
         </div>  --%>
         

      </div>
   </section>

   <jsp:include page="footer.jsp" />

   <!-- 스크롤 위치 A 태그 -->
   <a href="#" id="nino-scrollToTop">Go to Top</a>

   <!-- Drop Down Menu JS 파일 (필수)-->
   <script src="resources/js/jquery.dlmenu.js"></script>

   <script>
      var options = {
         offset : '#showHere',
         offsetSide : 'top',
         classes : {
            clone : 'banner--clone',
            stick : 'banner--stick',
            unstick : 'banner--unstick'
         }
      };

      var banner = new Headhesive('.banner', options);
   </script>
</body>
</html>