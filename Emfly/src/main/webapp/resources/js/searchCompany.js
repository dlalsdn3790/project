var c=0;
$(function() {   
   $.ajax({
      url: "searchCompany.co",
      type: "get",
      success: function(data) {
    	 
         for (var i in data) {
            var str = "";
            c++;
            str = str + '<tr><td><input type="image" src="resources/images/emptystar.png" class="star" onclick="like(this.id)" id="star' + data[i].cId + '"></td>';
            str = str + '<td><a href="companyDetail.co?cId=' + data[i].cId + '&cName=' + data[i].cName + '">' + '<label id="cNameLabel">' + data[i].cName + '</label></a></td>';

            if (data[i].cDiv == "대기업") {
               str = str + '<td><div><div><strong class="cDiv1">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            } else if (data[i].cDiv == "중견기업") {
               str = str + '<td><div><div><strong class="cDiv5">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            } else if (data[i].cDiv == "중소기업") {
               str = str + '<td><div><div><strong class="cDiv3">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            } else if (data[i].cDiv == "기타") {
               str = str + '<td><div><div><strong class="cDiv4">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            }

            str = str + '<td class="date">' + data[i].cLocation + '</td></tr>';

            $("#tbody").append(str);       
         }    
         page();
       
      }
   });
});

function page(){ 
	
	var reSortColors = function($table) {
	  $('tbody tr td', $table).removeClass('even').removeClass('listtd').addClass('odd');
	  $('tbody tr td', $table).removeClass('odd').removeClass('listtd').addClass('even');
	 };
	 $('table.paginated').each(function() {
	 
	  var pagesu = 10;  //페이지 번호 갯수
	  var currentPage = 0;
	  var numPerPage = 10;  //목록의 수
	  var $table = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRows = $table.find('tbody tr').length;
	 
	  //Math.ceil를 이용하여 반올림
	  var numPages = Math.ceil(numRows / numPerPage);
	  //리스트가 없으면 종료
	  if (numPages==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
	  
	  var nowp = currentPage;
	  var endp = nowp+10;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $table.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	   $("#remo").html("");
	   
	   if (numPages > 1) {     // 한페이지 이상이면
	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
	     nowp = 0;     // 1부터 
	     endp = pagesu;    // 10까지
	    }else{
	     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
	     endp = nowp+pagesu;   // 10까지
	     pi = 1;
	    }
	    
	    if (numPages < endp) {   // 10페이지가 안되면
	     endp = numPages;   // 마지막페이지를 갯수 만큼
	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
	    }
	    if (nowp < 1) {     // 시작이 음수 or 0 이면
	     nowp = 0;     // 1페이지부터 시작
	    }
	   }else{       // 한페이지 이하이면
	    nowp = 0;      // 한번만 페이징 생성
	    endp = numPages;
	   }
	   // [처음]
	   $('<br /><span class="page-number" cursor: "pointer"><<</span>').bind('click', {newPage: page},function(event) {
	          currentPage = 0;   
	          $table.trigger('repaginate');  
	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
	      }).appendTo($pager).addClass('clickable');
	    // [이전]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;<&nbsp;</span>').bind('click', {newPage: page},function(event) {
	          if(currentPage == 0) return; 
	          currentPage = currentPage-1;
	    $table.trigger('repaginate'); 
	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [1,2,3,4,5,6,7,8]
	   for (var page = nowp ; page < endp; page++) {
	    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
	     currentPage = event.data['newPage'];
	     $table.trigger('repaginate');
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	     }).appendTo($pager).addClass('clickable');
	   } 
	    // [다음]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;>&nbsp;</span>').bind('click', {newPage: page},function(event) {
	    if(currentPage == numPages-1) return;
	        currentPage = currentPage+1;
	    $table.trigger('repaginate'); 
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [끝]
	   $('<span class="page-number" cursor: "pointer">&nbsp;>></span>').bind('click', {newPage: page},function(event) {
	           currentPage = numPages-1;
	           $table.trigger('repaginate');
	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	     
	     $($(".page-number")[2]).addClass('active');
	reSortColors($table);
	  });
	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
	   $pager.appendTo($table);
	   $table.trigger('repaginate');
	   $("#tbody").append($pager);
	 });
	}

function choice() {
   var cDiv = "";
   var cLocation = "";
   var cSalary = "";
   var searchWord = "";
   var url = "searchCompany.co?";
   
 
   $("#tbody").empty();
   $("#ul").empty();

   
   $("input[name='cDiv']:checked").each(function() {
   
      
      cDiv += $(this).val() + ",";

      $("#ul").append('<li><span class="checkSpan"></span> 기업 분류 : ' + $(this).val() + '</li>');
   });

   $("input[name='cLocation']:checked").each(function() {
      cLocation += $(this).val() + ",";

      $("#ul").append('<li><span class="checkSpan"></span> 회사 위치 : ' + $(this).val() + '</li>');
   });

   $("input[name='cSalary']:checked").each(function() {
      cSalary += $(this).val() + ",";

      if ($(this).val() == 25000000) {
         $("#ul").append('<li><span class="checkSpan"></span> 평균 연봉 : 2000만원 이하</li>');
      } else if ($(this).val() == 50000001) {
         $("#ul").append('<li><span class="checkSpan"></span> 평균 연봉 : 5000만원 이상</li>');
      } else {
         $("#ul").append('<li><span class="checkSpan"></span> 평균 연봉 : ~' + ($(this).val())/10000 + '만원</li>');
      }
   });
   
  
	   searchWord += $("#searchWord").val();

	     
   

   if(cDiv != null) {
      cDiv = "cDiv=" + cDiv.substr(0, cDiv.length-1);
      cLocation = "&cLocation=" + cLocation.substr(0, cLocation.length-1);
      cSalary = "&cSalary=" + cSalary.substr(0, cSalary.length-1);
      searchWord = "&searchWord=" + searchWord.substr(0, searchWord.length);
   }
   else if(cLocation != null) {
         cLocation = "cLocation=" + cLocation.substr(0, cLocation.length-1);
         cSalary = "&cSalary=" + cSalary.substr(0, cSalary.length-1);
         searchWord = "&searchWord=" + searchWord.substr(0, searchWord.length);
      }
   else if(cSalary != null) {
       cSalary = "&cSalary=" + cSalary.substr(0, cSalary.length-1);
       searchWord = "&searchWord=" + searchWord.substr(0, searchWord.length);
    }
      else {
    	  searchWord = "searchWord=" + searchWord.substr(0, searchWord.length);
      }
   

   url += cDiv + cLocation + cSalary + searchWord;

   $.ajax({
      url: url,
      type: "get",
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      success: function(data) {
         for (var i in data) {
            var str = "";
          
            
            str = str + '<tr><td><input type="image" src="resources/images/emptystar.png" class="star" onclick="like(this.id)" id="star' + data[i].cId + '"></td>';
            str = str + '<td><a href="companyDetail.co?cId=' + data[i].cId + '&cName=' + data[i].cName + '">' + '<label id="cNameLabel">' + data[i].cName + '</label></a></td>';

            if (data[i].cDiv == "대기업") {
               str = str + '<td><div><div><strong class="cDiv1">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            } else if (data[i].cDiv == "중견기업") {
               str = str + '<td><div><div><strong class="cDiv5">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            } else if (data[i].cDiv == "중소기업") {
               str = str + '<td><div><div><strong class="cDiv3">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            } else if (data[i].cDiv == "기타") {
               str = str + '<td><div><div><strong class="cDiv4">' + data[i].cDiv + '</strong></div><div class="margin"><strong class="sector">' + data[i].cSector +'</strong></div></div></td>';
            }

            str = str + '<td class="date">' + data[i].cLocation + '</td></tr>';

            $("#tbody").append(str);
         }
         page();
      }
   });
}

function allreset() {
	   $("#checkform").each(function () {
	      this.reset();
	   });

	   choice();
	}







/*function choice(checkbox) {
   if (checkbox.checked == true) {
      var text = "";
      var check = "";
      // 기업분류
      if (checkbox.value == 0 || checkbox.value == 1 || checkbox.value == 2 || checkbox.value == 333) {
         text = '<li id="' + checkbox.value + '"> 기업분류 : ';

         switch (checkbox.value) {
         case "0":
            text += "대기업";
            check += "대기업";
            break;
         case "1":
            text += "중견기업";
            check += "중견기업";
            break;
         case "2":
            text += "중소기업";
            check += "중소기업";
            break;
         case "333":
            text += "기타";
            check += "기타";
            break;   
         }
      }
      // 희망 근무지역1
      if (checkbox.value == 100 || checkbox.value == 101 || checkbox.value == 102 || checkbox.value == 103 || checkbox.value == 104 || checkbox.value == 105 || checkbox.value == 106 || checkbox.value == 107 || checkbox.value == 108) {
         text = '<li id="' + checkbox.value + '"> 회사 위치 : ';

         switch (checkbox.value) {
         case "100":
            text += "서울";
            check += "서울";
            break;
         case "101":
            text += "경기";
            check += "경기";
            break;
         case "102":
            text += "광주";
            check += "광주";
            break;
         case "103":
            text += "대구";
            check += "대구";
            break;
         case "104":
            text += "대전";  
            check += "대전";
            break;
         case "105":
            text += "부산"; 
            check += "부산";
            break;
         case "106":
            text += "울산";
            check += "울산";
            break;
         case "107":
            text += "인천";
            check += "인천";
            break;
         case "108":
            text += "세종";
            check += "세종";
            break;
         }
      }

      // 희망 근무지역2
      if (checkbox.value == 109 || checkbox.value == 110 || checkbox.value == 111 || checkbox.value == 112 || checkbox.value == 113 || checkbox.value == 114 || checkbox.value == 115 || checkbox.value == 116) {
         text = '<li id="' + checkbox.value + '"> 회사 위치 : ';

         switch (checkbox.value) {
         case "109":
            text += "강원";
            check += "강원";
            break;
         case "110":
            text += "경남";
            check += "경남";
            break;
         case "111":
            text += "경북";
            check += "경북";
            break;
         case "112":
            text += "전남";
            check += "전남";
            break;
         case "113":
            text += "전북";
            check += "전북";
            break;
         case "114":
            text += "충북";
            check += "충북";
            break;
         case "115":
            text += "충남";
            check += "충남";
            break;
         case "116":
            text += "제주";
            check += "제주";
            break;
         }
      }

      // 평균 급여
      if (checkbox.value == 2500 || checkbox.value == 3000 || checkbox.value == 3500 || checkbox.value == 4500 || checkbox.value == 5000 || checkbox.value == 9999) {
         text = '<li id="' + checkbox.value + '"> 평균 연봉 : ';

         switch (checkbox.value) {
         case "2500":
            text += "~2,500만원";
            break;
         case "3000":
            text += "~3,000만원";
            break;
         case "3500":
            text += "~3,500만원";
            break;
         case "4500":
            text += "~4,500만원";
            break;
         case "5000":
            text += "~5,000만원";
            break;
         case "9999":
            text += "5,000만원 ↑";
            break;
         }
      }

      $("#ul").append(text + '<input type="image" src="resources/images/x.png" onclick="reset(' + checkbox.value + ')"></input> </li>');
      var checkboxValues = [];
      if (checkbox.checked == true) {

         checkboxValues.push(check);
      };
      $.ajax({
         url:"searchCompany.do",
         method:'GET',
         type: "json",
         data: { checkboxValues: check},
         success:function(data){
            alert(data);
         },
         error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생");
            self.close();
         }
      });
   } else {
      $("#" + checkbox.value).remove();
   }
}




function reset(list) {
   if (list == 4) {
      $("#checkform").each(function () {
         this.reset();
      });

      $("#ul").empty();
   } else {
      $("#" + list).remove();

      $('input[id="c' + list + '"]').attr('checked', false);
   }
}

function like(id) {
   var state = $("#" + id).attr("src");

   if (state == "resources/images/emptystar.png") {
      $("#" + id).attr("src", "resources/images/fullstar.png");
   } else {
      $("#" + id).attr("src", "resources/images/emptystar.png");
   }
}*/