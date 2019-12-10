<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMFLY</title> 
<!-- 제이쿼리 JS (필수) -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS (필수)-->
<link rel="stylesheet" href="resources/css/searchWorker.css"> <!-- 구직자 검색 CSS -->
<script type="text/javascript" src="resources/js/searchWorker.js"></script> <!-- 구직자 검색 JS -->
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
</head>
<body>
    <jsp:include page="./header.jsp" />
    <sql:setDataSource var="snapshot"
      driver="oracle.jdbc.driver.OracleDriver"
      url="jdbc:oracle:thin:@127.0.0.1:1521:XE" user="emfly"
      password="emfly" />
      <div id="divBack"></div>
    <section>
        <form id="checkform">
            <div id="checkbox">
    
                <strong>경력</strong>  
                <div>
                <sql:query dataSource="${snapshot}" var="result0">
              	select * from resume where reyear is null
               	 </sql:query> 
                        <input type="checkbox" id="c0" value="0" name="reYear" onclick="choice(this)" />
                        <label for="c0"><span></span>신입<label id="count"><c:out value="${result0.rowCount}" /></label> </label>
                </div>
                <div>
                <sql:query dataSource="${snapshot}" var="result1">
              	 select * from resume where reyear in('1년','2년','3년','4년','5년')
               	 </sql:query>
                        <input type="checkbox"  id="c5" value="5" name="reYear" onclick="choice(this)" />
                        <label for="c5"><span></span>1~5년<label id="count"><c:out value="${result1.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result2">
              	 select * from resume where reyear in('6년','7년','8년','9년','10년')
               	 </sql:query>
                        <input type="checkbox"  id="c10" value="10" name="reYear" onclick="choice(this)" />
                        <label for="c10"><span></span>6~10년<label id="count"><c:out value="${result2.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result3">
              	 select * from resume where reyear in('11년','12년','13년','14년','15년')
               	 </sql:query>
                        <input type="checkbox"  id="c15" value="15" name="reYear" onclick="choice(this)" />
                        <label for="c15"><span></span>11~15년<label id="count"><c:out value="${result3.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result4">
              	 select * from resume where reyear in('16년','17년','18년','19년''20년')
               	 </sql:query>
                        <input type="checkbox"  id="c99" value="99" name="reYear" onclick="choice(this)" />
                        <label for="c99"><span></span>15년 ↑<label id="count"><c:out value="${result4.rowCount}" /></label> </label>
                </div>              
                <div class="line"></div>

                <strong>성별</strong>
                <div>
                 <sql:query dataSource="${snapshot}" var="result5">
              	 select * from resume where regender = 'M'
               	 </sql:query>
                        <input type="checkbox"  id="c400" value="400" name="reGender" onclick="choice(this)" />
                        <label for="c400"><span></span>남<label id="count"><c:out value="${result5.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result6">
                 select * from resume where regender = 'F'
               	 </sql:query>
                        <input type="checkbox"  id="c500" value="500" name="reGender" onclick="choice(this)" />
                        <label for="c500"><span></span>여<label id="count"><c:out value="${result6.rowCount}" /></label> </label>
                </div>
                <div class="line"></div>

                <strong>나이</strong>
                <div>
                 <sql:query dataSource="${snapshot}" var="result7">
              	 select * from resume where 
              	 SUBSTR(rebirth,1,4) IN('1991','1992','1993','1994','1995','1996','1997','1998','1999','2000')
               	 </sql:query>
                        <input type="checkbox"  id="c29" value="29" name="reBirth" onclick="choice(this)" />
                        <label for="c29"><span></span>20~29세<label id="count"><c:out value="${result7.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result8">
              	 select * from resume where 
              	  SUBSTR(rebirth,1,4) IN('1981','1982','1983','1984','1985','1986','1987','1988','1989','1990')   
               	 </sql:query>
                        <input type="checkbox"  id="c39" value="39" name="reBirth" onclick="choice(this)" />
                        <label for="c39"><span></span>30~39세<label id="count"><c:out value="${result8.rowCount}" /></label> </label>
                </div>
                <div>
                <sql:query dataSource="${snapshot}" var="result9">
              	 select * from resume where 
              	 SUBSTR(rebirth,1,4) IN('1971','1972','1973','1974','1975','1976','1977','1978','1979','1980') 
               	 </sql:query>
                        <input type="checkbox"  id="c49" value="49" name="reBirth" onclick="choice(this)" />
                        <label for="c49"><span></span>41~49세<label id="count"><c:out value="${result9.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result10">
              	 select * from resume where 
              	 SUBSTR(rebirth,1,4) IN('1961','1962','1963','1964','1965','1966','1967','1968','1969','1970')
               	 </sql:query>
                        <input type="checkbox"  id="c50" value="50" name="reBirth" onclick="choice(this)" />
                        <label for="c50"><span></span>50세 ↑<label id="count"><c:out value="${result10.rowCount}" /></label> </label>
                </div>

                <div class="line"></div>
                <strong>최종 학력</strong>
                <div>
                <sql:query dataSource="${snapshot}" var="result11">
              	 select * from resume where reschool = '(4년제)'
               	 </sql:query>
                        <input type="checkbox"  id="c44" value="44" name="reSchool" onclick="choice(this)" />
                        <label for="c44"><span></span>4년제<label id="count"><c:out value="${result11.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result12">
              	 select * from resume where reschool = '(2,3년제)'
               	 </sql:query>
                        <input type="checkbox"  id="c23" value="23" name="reSchool" onclick="choice(this)" />
                        <label for="c23"><span></span>2,3년제<label id="count"><c:out value="${result12.rowCount}" /></label> </label>
                </div>
                <div>
                <sql:query dataSource="${snapshot}" var="result13">
              	 select * from resume where reschool = '(석사)' or reschool = '(박사)'
               	 </sql:query>
                        <input type="checkbox"  id="c56" value="56" name="reSchool" onclick="choice(this)" />
                        <label for="c56"><span></span>석/박사<label id="count"><c:out value="${result13.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result14">
              	 select * from resume where reschool = '(고졸이하)'
               	 </sql:query>
                        <input type="checkbox"  id="c11" value="11" name="reSchool" onclick="choice(this)" />
                        <label for="c11"><span></span>고졸 이하<label id="count"><c:out value="${result14.rowCount}" /></label> </label>
                </div>
                <div class="line"></div>

                <strong>희망근무 지역</strong>
                <div>
                 <sql:query dataSource="${snapshot}" var="result15">
              	 select * from resume where relocation like '%'|| '서울' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c100" value="서울" name="reLocation" onclick="choice(this)" />
                        <label for="c100"><span></span>서울<label id="count"><c:out value="${result15.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result16">
              	 select * from resume where relocation like '%'|| '경기' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c101" value="경기" name="reLocation" onclick="choice(this)" />
                        <label for="c101"><span></span>경기<label id="count"><c:out value="${result16.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result17">
              	 select * from resume where relocation like '%'|| '광주' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c102" value="광주" name="reLocation" onclick="choice(this)" />
                        <label for="c102"><span></span>광주<label id="count"><c:out value="${result17.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result18">
              	 select * from resume where relocation like '%'|| '대구' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c103" value="대구" name="reLocation" onclick="choice(this)" />
                        <label for="c103"><span></span>대구<label id="count"><c:out value="${result18.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result19">
              	 select * from resume where relocation like '%'|| '대전' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c104" value="대전" name="reLocation" onclick="choice(this)" />
                        <label for="c104"><span></span>대전<label id="count"><c:out value="${result19.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result20">
              	 select * from resume where relocation like '%'|| '부산' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c105" value="부산" name="reLocation" onclick="choice(this)" />
                        <label for="c105"><span></span>부산<label id="count"><c:out value="${result20.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result21">
              	 select * from resume where relocation like '%'|| '울산' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c106" value="울산" name="reLocation" onclick="choice(this)" />
                        <label for="c106"><span></span>울산<label id="count"><c:out value="${result21.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result22">
              	 select * from resume where relocation like '%'|| '인천' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c107" value="인천" name="reLocation" onclick="choice(this)" />
                        <label for="c107"><span></span>인천<label id="count"><c:out value="${result22.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result23">
              	 select * from resume where relocation like '%'|| '세종' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c108" value="세종" name="reLocation" onclick="choice(this)" />
                        <label for="c108"><span></span>세종<label id="count"><c:out value="${result23.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result24">
              	 select * from resume where relocation like '%'|| '강원' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c109" value="강원" name="reLocation" onclick="choice(this)" />
                        <label for="c109"><span></span>강원<label id="count"><c:out value="${result24.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result25">
              	 select * from resume where relocation like '%'|| '경남' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c110" value="경남" name="reLocation" onclick="choice(this)" />
                        <label for="c110"><span></span>경남<label id="count"><c:out value="${result25.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result26">
              	 select * from resume where relocation like '%'|| '경북' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c111" value="경북" name="reLocation" onclick="choice(this)" />
                        <label for="c111"><span></span>경북<label id="count"><c:out value="${result26.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result27">
              	 select * from resume where relocation like '%'|| '전남' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c112" value="112" name="reLocation" onclick="choice(this)" />
                        <label for="c112"><span></span>전남<label id="count"><c:out value="${result27.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result28">
              	 select * from resume where relocation like '%'|| '전북' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c113" value="113" name="reLocation" onclick="choice(this)" />
                        <label for="c113"><span></span>전북<label id="count"><c:out value="${result28.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result29">
              	 select * from resume where relocation like '%'|| '충북' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c114" value="충북" name="reLocation" onclick="choice(this)" />
                        <label for="c114"><span></span>충북<label id="count"><c:out value="${result29.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result30">
              	 select * from resume where relocation like '%'|| '충남' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c115" value="충남" name="reLocation" onclick="choice(this)" />
                        <label for="c115"><span></span>충남<label id="count"><c:out value="${result30.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result31">
              	 select * from resume where relocation like '%'|| '제주' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c116" value="제주" name="reLocation" onclick="choice(this)" />
                        <label for="c116"><span></span>제주<label id="count"><c:out value="${result31.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result32">
              	 select * from resume where relocation like '%'|| '전국' ||'%'
               	 </sql:query>
                        <input type="checkbox"  id="c117" value="전국" name="reLocation" onclick="choice(this)" />
                        <label for="c117"><span></span>전국<label id="count"><c:out value="${result32.rowCount}" /></label> </label>
                </div>

                <div class="line"></div>

                <strong>직종 구분</strong>
                <div>
                  <sql:query dataSource="${snapshot}" var="result33">
              	 select * from resume where reemdiv = '경영·사무'
               	 </sql:query>
                        <input type="checkbox"  id="c201" value="경영·사무" name="reEmdiv" onclick="choice(this)" />
                        <label for="c201"><span></span>경영·사무<label id="count"><c:out value="${result33.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result34">
              	 select * from resume where reemdiv = '영업·고객상담'
               	 </sql:query>
                        <input type="checkbox"  id="c202" value="영업·고객상담" name="reEmdiv" onclick="choice(this)" />
                        <label for="c202"><span></span>영업·고객상담<label id="count"><c:out value="${result34.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result35">
              	 select * from resume where reemdiv = '건설'
               	 </sql:query>
                        <input type="checkbox"  id="c203" value="건설" name="reEmdiv" onclick="choice(this)" />
                        <label for="c203"><span></span>건설<label id="count"><c:out value="${result35.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result36">
              	 select * from resume where reemdiv = '생산·제조'
               	 </sql:query>
                        <input type="checkbox"  id="c204" value="생산·제조" name="reEmdiv" onclick="choice(this)" />
                        <label for="c204"><span></span>생산·제조<label id="count"><c:out value="${result36.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result37">
              	 select * from resume where reemdiv = '유통·무역'
               	 </sql:query>
                        <input type="checkbox"  id="c205" value="유통·무역" name="reEmdiv" onclick="choice(this)" />
                        <label for="c205"><span></span>유통·무역<label id="count"><c:out value="${result37.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result38">
              	 select * from resume where reemdiv = 'IT·인터넷'
               	 </sql:query>
                        <input type="checkbox"  id="c206" value="IT·인터넷" name="reEmdiv" onclick="choice(this)" />
                        <label for="c206"><span></span>IT·인터넷<label id="count"><c:out value="${result38.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result39">
              	 select * from resume where reemdiv = '전문직'
               	 </sql:query>
                        <input type="checkbox"  id="c207" value="전문직" name="reEmdiv" onclick="choice(this)" />
                        <label for="c207"><span></span>전문직<label id="count"><c:out value="${result39.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result40">
              	 select * from resume where reemdiv = '디자인'
               	 </sql:query>
                        <input type="checkbox"  id="c208" value="디자인" name="reEmdiv" onclick="choice(this)" />
                        <label for="c208"><span></span>디자인<label id="count"><c:out value="${result40.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result41">
              	 select * from resume where reemdiv = '교육'
               	 </sql:query>
                        <input type="checkbox"  id="c209" value="교육" name="reEmdiv" onclick="choice(this)" />
                        <label for="c209"><span></span>교육<label id="count"><c:out value="${result41.rowCount}" /></label> </label>
                </div>
                 <div>
                 <sql:query dataSource="${snapshot}" var="result42">
              	 select * from resume where reemdiv = '경리·회계·결산'
               	 </sql:query>
                        <input type="checkbox"  id="c210" value="경리·회계·결산" name="reEmdiv" onclick="choice(this)" />
                        <label for="c210"><span></span>경리·회계·결산<label id="count"><c:out value="${result42.rowCount}" /></label> </label>
                </div>
                <div class="line"></div>
				
                <strong>근무 조건</strong>
                <div>
                <sql:query dataSource="${snapshot}" var="result44">
              	 select * from resume where reemploy = '정규직'
               	 </sql:query>
                        <input type="checkbox"  id="c300" value="정규직" name="reEmploy" onclick="choice(this)" />
                        <label for="c300"><span></span>정규직<label id="count"><c:out value="${result44.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result45">
              	 select * from resume where reemploy = '계약직'
               	 </sql:query>
                        <input type="checkbox"  id="c301" value="계약직" name="reEmploy" onclick="choice(this)" />
                        <label for="c301"><span></span>계약직<label id="count"><c:out value="${result45.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result46">
              	 select * from resume where reemploy = '인턴직'
               	 </sql:query>
                        <input type="checkbox"  id="c302" value="인턴직" name="reEmploy" onclick="choice(this)" />
                        <label for="c302"><span></span>인턴직<label id="count"><c:out value="${result46.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result47">
              	 select * from resume where reemploy = '파견직'
               	 </sql:query>
                        <input type="checkbox"  id="c303" value="파견직" name="reEmploy" onclick="choice(this)" />
                        <label for="c303"><span></span>파견직<label id="count"><c:out value="${result47.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result48">
              	 select * from resume where reemploy = '프리랜서'
               	 </sql:query>
                        <input type="checkbox"  id="c304" value="프리랜서" name="reEmploy" onclick="choice(this)" />
                        <label for="c304"><span></span>프리랜서<label id="count"><c:out value="${result48.rowCount}" /></label> </label>
                </div>
                <div class="line"></div>
                <strong>희망 급여</strong>
                <div>
                <sql:query dataSource="${snapshot}" var="result49">
              	select * from resume where RESALARY <= 2500
               	 </sql:query>
                        <input type="checkbox"  id="c2500" value="2500" name="reSalary" onclick="choice(this)" />
                        <label for="c2500"><span></span>~2,500만원<label id="count"><c:out value="${result49.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result50">
              	select * from resume where RESALARY between 2501 and 3000
               	 </sql:query>
                        <input type="checkbox"  id="c3000" value="3000" name="reSalary" onclick="choice(this)" />
                        <label for="c3000"><span></span>~3,000만원<label id="count"><c:out value="${result50.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result51">
              	select * from resume where RESALARY between 3001 and 3500
               	 </sql:query>
                        <input type="checkbox"  id="c3500" value="3500" name="reSalary" onclick="choice(this)" />
                        <label for="c3500"><span></span>~3,500만원<label id="count"><c:out value="${result51.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result52">
              	select * from resume where RESALARY between 3501 and 4000
               	 </sql:query>
                        <input type="checkbox"  id="c4000" value="4000" name="reSalary" onclick="choice(this)" />
                        <label for="c4000"><span></span>~4,000만원<label id="count"><c:out value="${result52.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result53">
              	select * from resume where RESALARY between 4001 and 4500
               	 </sql:query>
                        <input type="checkbox"  id="c4500" value="4500" name="reSalary" onclick="choice(this)" />
                        <label for="c4500"><span></span>~4,500만원<label id="count"><c:out value="${result53.rowCount}" /></label> </label>
                </div>
                <div>
                 <sql:query dataSource="${snapshot}" var="result54">
              	select * from resume where RESALARY > 4500
               	 </sql:query>
                        <input type="checkbox"  id="c9999" value="9999" name="reSalary" onclick="choice(this)" />
                        <label for="c9999"><span></span>4,500만원 ↑<label id="count"><c:out value="${result54.rowCount}" /></label> </label>
                </div>
            </div>
        </form>

        <div id="content">
            <div id="checklist">
                <div id="list">
                    <ul id="ul">
                    </ul>
                </div>

                <input type="image" src="resources/images/reset.png" onclick="allreset()">
                <strong>초기화</strong>
            </div>

            <div id="filter">
                <ul>
                    <li>
                        <div class="on" id="recent" onclick="sort(this.id)"> 최신순</div>
                    </li>
                    <li>
                        <div id="age" onclick="sort(this.id)">나이순</div>
                    </li>
                    <li>
                        <div id="study" onclick="sort(this.id)"> 최종학력순</div>
                    </li>
                    <li>
                        <div id="salary" onclick="sort(this.id)">희망급여순</div>
                    </li>
                </ul>
            </div>

            <div id="inform">
                <table class="tbl paginated" id="tbl">
                    <thead>
                        <tr>
                            <th width="85px"></th>
                            <th width="150px" style="padding-left:30px;">이름</th>
                            <th width="350px" style="padding-left:100px;">이력서 요약</th>
                            <th width="180px" style="padding-left:60px;">업데이트일</th>
                        </tr>
                    </thead>

                    <tbody id="tbody">
                   <%--  <c:forEach var="row" items="${map.list}">
                    
                     <tr>
                            <td><input type="image" src="resources/images/emptystar.png" class="star" onclick="like(this.id)" id="star${row.reId}"></td>

                            <td>
                            <c:url var="rdetail" value="emplyMenu6Detail.me">
										<c:param name="reId" value="${ row.reId }" />
							</c:url> 
							
							<a href="${ rdetail }">
                                <label class="name">${row.rName}</label>
                            </a>
                            
                            
                                <c:set var="TextValue" value="${row.reBirth}"/>
                                <label class="genderage">
                                (
                                <c:if test="${row.reGender == 'M'}">
                                                 남자
                                </c:if>
                             	<c:if test="${row.reGender == 'F'}">
                                                여자
                                </c:if>
                                / ${fn:substring(TextValue,0,4)}년생)</label>                          
                            </td>
                            <td>
                                <div>
                                <c:if test="${row.reComName == null}">
                                    <strong class="newbie">
                                    	신입
                                    </strong>
                                </c:if>
                                <c:if test="${row.reComName != null}">
                                    <strong class="career">
                                    	${row.reYear}
                                    </strong>
                                </c:if>
                                    <label>${row.reScname} ${row.reSchool} ${row.reMajor}</label>
                                    <div>${row.reLocation}</div>
                                    <div>/</div>
                                    <div>${row.reEmDiv}</div>
                                    <div>/</div>
                                    <div>${row.reEmploy}</div>
                                    <div>/</div>
                                    <div>${row.reSalary}만원</div>
                                </div>
                            </td>

                            <td class="date">${row.reDate}</td>
                        </tr>
                    </c:forEach> --%>
                          
                    </tbody>
                </table>
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