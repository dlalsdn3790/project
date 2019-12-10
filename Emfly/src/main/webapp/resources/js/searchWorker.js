$(function() {   
	$.ajax({
		url: "searchWorker.co",
		type: "get",
		success: function(data) {
			console.log(data);
			for (var i in data) {
				var str = "";
				str = str + '<tr><td><input type="image" src="resources/images/emptystar.png" class="star" onclick="like(this.id)" id="star' + data[i].reId + '"></td>';
				str = str + '<td><a href="emplyMenu6Detail.me?reId=' + data[i].reId + '">' + '<label id="name">' + data[i].rName + '</label></a>';
				str = str + '<c:set var="TextValue" value="${row.reBirth}"/>';
				str = str + '<label class="genderage">( ';
				if (data[i].reGender == "M") {
					str = str + '남자';
				}else if (data[i].reGender == "F") {
					str = str + '여자';
				}             
				str = str + ' / ';
				str = str + data[i].reBirth.substring(0,4) + ' 년생 )</label>';

				str = str + '</td>';
				str = str + '<td>';
				str = str + '<div>';
				if(data[i].reComName == null){
					str = str + '<strong class="newbie">';
					str = str + '신입';
					str = str +'</strong>';
				}else if(data[i].reComName != null){
					str = str + '<strong class="career">';
					str = str + data[i].reYear
					str = str + '</strong>';
				}

				str = str + '<label>' + data[i].reScname + ' ' + data[i].reSchool + ' ';
				
				if(data[i].reMajor == null){
					str = str + ' ' + '</label>';
				}else{
					str = str + data[i].reMajor + '</label>';
				}
				
				
				
				str = str + '<div>' + data[i].reLocation + '</div>';
				str = str + '<div> / </div>';
				str = str + '<div>' + data[i].reEmDiv + '</div>';
				str = str + '<div> / </div>';
				str = str + '<div>' + data[i].reEmploy + '</div>';
				str = str + '<div> / </div>';
				str = str + '<div>' + data[i].reSalary + '만원</div>';
				str = str + '</div>';
				str = str + '</td>';
				str = str + '<td class="date">' + data[i].reDate + '</td>';
				str = str + '</tr>';
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


function sort(id) {
    $("#recent").removeClass("on");
    $("#age").removeClass("on");
    $("#study").removeClass("on");
    $("#salary").removeClass("on");

    switch (id) {
        case "recent":
            $("#recent").addClass("on");
            
            break;
        case "age":
            $("#age").addClass("on");
            break;
        case "study":
            $("#study").addClass("on");
            break;
        case "salary":
            $("#salary").addClass("on");
            break;
        choice();
    }
}

function choice() {
	var reYear = "";
	var reGender = "";
	var reBirth = "";
	var reSchool = "";
	var reLocation = "";
	var reEmdiv = "";
	var reEmploy = "";
	var reSalary = "";
	var sort = "";
	var url = "searchWorker.co?";
	

	$("#tbody").empty();
	$("#ul").empty();


	$("input[name='reYear']:checked").each(function() {


		reYear += $(this).val() + ",";

		if ($(this).val() == 0) {
	         $("#ul").append('<li><span class="checkSpan"></span> 경력 : 신입</li>');
	      } else if ($(this).val() == 5) {
	         $("#ul").append('<li><span class="checkSpan"></span> 경력 : 1~5년</li>');
	      }else if ($(this).val() == 10) {
	         $("#ul").append('<li><span class="checkSpan"></span> 경력 : 6~10년</li>');
	      }else if ($(this).val() == 15) {
	         $("#ul").append('<li><span class="checkSpan"></span> 경력 : 11~15년</li>');
	      }
	      else {
	         $("#ul").append('<li><span class="checkSpan"></span> 경력 :' + '15년 ↑</li>');
	      }
	});

	$("input[name='reGender']:checked").each(function() {
			reGender += $(this).val() + ",";
			if ($(this).val() == 400) {
				$("#ul").append('<li><span class="checkSpan"></span> 성별 : 남자 </li>');
			}else{
				$("#ul").append('<li><span class="checkSpan"></span> 성별 : 여자 </li>');
			}
	      
	   });
	
	$("input[name='reBirth']:checked").each(function() {
		reBirth += $(this).val() + ",";
		if ($(this).val() == 29) {
			$("#ul").append('<li><span class="checkSpan"></span>나이 : 20 ~ 29세 </li>');
		}else if ($(this).val() == 39) {
	         $("#ul").append('<li><span class="checkSpan"></span> 나이 : 30 ~ 39세</li>');
	    }
		else if ($(this).val() == 49) {
	         $("#ul").append('<li><span class="checkSpan"></span> 나이 : 40 ~ 49세</li>');
	    }else{
			$("#ul").append('<li><span class="checkSpan"></span>나이 : 50세 ↑ </li>');
		}
      
   });
	
	$("input[name='reSchool']:checked").each(function() {
		reSchool += $(this).val() + ",";
		if ($(this).val() == 44) {
			$("#ul").append('<li><span class="checkSpan"></span> 최종학력 : (4년제) </li>');
		}else if ($(this).val() == 23) {
	         $("#ul").append('<li><span class="checkSpan"></span> 최종학력 : (2,3년제) </li>');
	    }
		else if ($(this).val() == 56) {
	         $("#ul").append('<li><span class="checkSpan"></span> 최종학력 : (석/박사)</li>');
	    }else{
			$("#ul").append('<li><span class="checkSpan"></span> 최종학력 : (고졸이하) </li>');
		}
      
   });
	
	$("input[name='reLocation']:checked").each(function() {
		reLocation += $(this).val() + ",";

	    $("#ul").append('<li><span class="checkSpan"></span></input> 희망 근무 지역 : ' + $(this).val() + '</li>');
      
   });
	
	$("input[name='reEmdiv']:checked").each(function() {
		reEmdiv += $(this).val() + ",";

	    $("#ul").append('<li><span class="checkSpan"></span></input> 직종 구분 : ' + $(this).val() + '</li>');
      
   });
	
	$("input[name='reEmploy']:checked").each(function() {
		reEmploy += $(this).val() + ",";

	    $("#ul").append('<li><span class="checkSpan"></span></input> 근무 조건 : ' + $(this).val() + '</li>');
      
   });
	
	$("input[name='reSalary']:checked").each(function() {
		reSalary += $(this).val() + ",";
		if ($(this).val() == 2500) {
			$("#ul").append('<li><span class="checkSpan"></span> 희망 급여 : ~2,500 만원 </li>');
		}else if ($(this).val() == 3000) {
	         $("#ul").append('<li><span class="checkSpan"></span> 희망 급여 : ~3,000 만원 </li>');
	    }
		else if ($(this).val() == 3500) {
	         $("#ul").append('<li><span class="checkSpan"></span> 희망 급여 : ~3,500 만원 </li>');
	    }
		else if ($(this).val() == 4000) {
	         $("#ul").append('<li><span class="checkSpan"></span> 희망 급여 : ~4,000 만원 </li>');
	    }
		else if ($(this).val() == 4500) {
	         $("#ul").append('<li><span class="checkSpan"></span> 희망 급여 : ~4,500 만원 </li>');
	    }
		else{
			$("#ul").append('<li><span class="checkSpan"></span> 희망 급여 : 4,500 만원 ↑ </li>');
		}
      
   });
	
	
	if(reYear != null) {
		reYear = "reYear=" + reYear.substr(0, reYear.length-1);
		reGender = "&reGender=" + reGender.substr(0, reGender.length-1);
		reBirth = "&reBirth=" + reBirth.substr(0, reBirth.length-1);
		reSchool = "&reSchool=" + reSchool.substr(0, reSchool.length-1);
		reLocation = "&reLocation=" + reLocation.substr(0, reLocation.length-1);
		reEmdiv = "&reEmdiv=" + reEmdiv.substr(0, reEmdiv.length-1);
		reEmploy = "&reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
		reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	   }
	   else if(reGender != null) {
	    	  reGender = "reGender=" + reGender.substr(0, reGender.length-1);
	  		  reBirth = "&reBirth=" + reBirth.substr(0, reBirth.length-1);
	  		  reSchool = "&reSchool=" + reSchool.substr(0, reSchool.length-1);
	  		  reLocation = "&reLocation=" + reLocation.substr(0, reLocation.length-1);
	  		  reEmdiv = "&reEmdiv=" + reEmdiv.substr(0, reEmdiv.length-1);
	  		reEmploy = "&reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
	  		reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	      }
	   else if(reBirth != null) {
	  		  reBirth = "reBirth=" + reBirth.substr(0, reBirth.length-1);
	  		  reSchool = "&reSchool=" + reSchool.substr(0, reSchool.length-1);
	  		  reLocation = "&reLocation=" + reLocation.substr(0, reLocation.length-1);
	  		  reEmdiv = "&reEmdiv=" + reEmdiv.substr(0, reEmdiv.length-1);
	  		  reEmploy = "&reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
	  		  reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	      }
	   else if(reSchool != null) {
	  		  reSchool = "reSchool=" + reSchool.substr(0, reSchool.length-1);
	  		  reLocation = "&reLocation=" + reLocation.substr(0, reLocation.length-1);
	  		  reEmdiv = "&reEmdiv=" + reEmdiv.substr(0, reEmdiv.length-1);
	  		  reEmploy = "&reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
	  		  reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	      }
	   else if(reLocation != null) {
	  		  reLocation = "reLocation=" + reLocation.substr(0, reLocation.length-1);
	  		  reEmdiv = "&reEmdiv=" + reEmdiv.substr(0, reEmdiv.length-1);
	  		  reEmploy = "&reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
	  		  reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	      }
	   else if(reEmdiv != null){
		   reEmdiv = "reEmdiv=" + reEmdiv.substr(0, reEmdiv.length-1);
		   reEmploy = "&reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
		   reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	   }
	   else if(reEmploy != null){
		   reEmploy = "reEmploy=" + reEmploy.substr(0, reEmploy.length-1);
		   reSalary = "&reSalary=" + reSalary.substr(0, reSalary.length-1);
	   }
	   else{
		   reSalary = "reSalary=" + reSalary.substr(0, reSalary.length-1);
	   }
	      
	   
	
		
	
	
	


	url += reYear + reGender + reBirth + reSchool + reLocation + reEmdiv + reEmploy + reSalary;

	$.ajax({
		url: url,
		type: "get",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			for (var i in data) {
				var str = "";
				str = str + '<tr><td><input type="image" src="resources/images/emptystar.png" class="star" onclick="like(this.id)" id="star' + data[i].reId + '"></td>';
				str = str + '<td><a href="emplyMenu6Detail.me?reId=' + data[i].reId + '">' + '<label id="name">' + data[i].rName + '</label></a>';
				str = str + '<c:set var="TextValue" value="${row.reBirth}"/>';
				str = str + '<label class="genderage">( ';
				if (data[i].reGender == "M") {
					str = str + '남자';
				}else if (data[i].reGender == "F") {
					str = str + '여자';
				}             
				str = str + ' / ';
				str = str + data[i].reBirth.substring(0,4) + ' 년생 )</label>';

				str = str + '</td>';
				str = str + '<td>';
				str = str + '<div>';
				if(data[i].reComName == null){
					str = str + '<strong class="newbie">';
					str = str + '신입';
					str = str +'</strong>';
				}else if(data[i].reComName != null){
					str = str + '<strong class="career">';
					str = str + data[i].reYear
					str = str + '</strong>';
				}

				str = str + '<label>' + data[i].reScname + ' ' + data[i].reSchool + ' ';
				if(data[i].reMajor == null){
					str = str + ' ' + '</label>';
				}else{
					str = str + data[i].reMajor + '</label>';
				}

				str = str + '<div>' + data[i].reLocation + '</div>';
				str = str + '<div> / </div>';
				str = str + '<div>' + data[i].reEmDiv + '</div>';
				str = str + '<div> / </div>';
				str = str + '<div>' + data[i].reEmploy + '</div>';
				str = str + '<div> / </div>';
				str = str + '<div>' + data[i].reSalary + '만원</div>';
				str = str + '</div>';
				str = str + '</td>';
				str = str + '<td class="date">' + data[i].reDate + '</td>';
				str = str + '</tr>';
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

        // 경력
        if (checkbox.value == 0 || checkbox.value == 5 || checkbox.value == 10 || checkbox.value == 15 || checkbox.value == 99) {
            text = '<li id="' + checkbox.value + '"> 경력 : ';

            switch (checkbox.value) {
                case "0":
                    text += "신입";
                    break;
                case "5":
                    text += "1~5년";
                    break;
                case "10":
                    text += "6~10년";
                    break;
                case "15":
                    text += "11~15년";
                    break;
                case "99":
                    text += "15년 ↑";
                    break;
            }
        }

        // 성별
        if (checkbox.value == 400 || checkbox.value == 500) {
            text = '<li id="' + checkbox.value + '"> 성별 : ';

            switch (checkbox.value) {
                case "400":
                    text += "남";
                    break;
                case "500":
                    text += "여";
                    break;
            }
        }

        // 나이
        if (checkbox.value == 29 || checkbox.value == 39 || checkbox.value == 49 || checkbox.value == 50) {
            text = '<li id="' + checkbox.value + '"> 나이 : ';

            switch (checkbox.value) {
                case "29":
                    text += "20~29세";
                    break;
                case "39":
                    text += "30~39세";
                    break;
                case "49":
                    text += "40~49세";
                    break;
                case "50":
                    text += "50세";
                    break;
            }
        }

        // 최종학력
        if (checkbox.value == 44 || checkbox.value == 23 || checkbox.value == 56 || checkbox.value == 11) {
            text = '<li id="' + checkbox.value + '"> 최종학력 : ';

            switch (checkbox.value) {
                case "44":
                    text += "4년제";
                    break;
                case "23":
                    text += "2,3년제";
                    break;
                case "56":
                    text += "석/박사";
                    break;
                case "11":
                    text += "고졸 이하";
                    break;
            }
        }

        // 희망 근무지역1
        if (checkbox.value == 100 || checkbox.value == 101 || checkbox.value == 102 || checkbox.value == 103 || checkbox.value == 104 || checkbox.value == 105 || checkbox.value == 106 || checkbox.value == 107 || checkbox.value == 108) {
            text = '<li id="' + checkbox.value + '"> 희망 근무지역 : ';

            switch (checkbox.value) {
                case "100":
                    text += "서울";
                    break;
                case "101":
                    text += "경기";
                    break;
                case "102":
                    text += "광주";
                    break;
                case "103":
                    text += "대구";
                    break;
                case "104":
                    text += "대전";
                    break;
                case "105":
                    text += "부산";
                    break;
                case "106":
                    text += "울산";
                    break;
                case "107":
                    text += "인천";
                    break;
                case "108":
                    text += "세종";
                    break;
            }
        }

        // 희망 근무지역2
        if (checkbox.value == 109 || checkbox.value == 110 || checkbox.value == 111 || checkbox.value == 112 || checkbox.value == 113 || checkbox.value == 114 || checkbox.value == 115 || checkbox.value == 116 || checkbox.value == 117) {
            text = '<li id="' + checkbox.value + '"> 희망 근무지역 : ';

            switch (checkbox.value) {
                case "109":
                    text += "강원";
                    break;
                case "110":
                    text += "경남";
                    break;
                case "111":
                    text += "경북";
                    break;
                case "112":
                    text += "전남";
                    break;
                case "113":
                    text += "전북";
                    break;
                case "114":
                    text += "충북";
                    break;
                case "115":
                    text += "충남";
                    break;
                case "116":
                    text += "제주";
                    break;
                case "117":
                    text += "전국";
                    break;
            }
        }

        // 직종 구분
        if (checkbox.value == 201 || checkbox.value == 202 || checkbox.value == 203 || checkbox.value == 204 || checkbox.value == 205 || checkbox.value == 206 || checkbox.value == 207 || checkbox.value == 208 || checkbox.value == 209 || checkbox.value == 210) {
            text = '<li id="' + checkbox.value + '"> 직종 구분 : ';

            switch (checkbox.value) {
                case "201":
                    text += "경영/사무";
                    break;
                case "202":
                    text += "영업/고객상담";
                    break;
                case "203":
                    text += "건설";
                    break;
                case "204":
                    text += "생산/제조";
                    break;
                case "205":
                    text += "유통/무역";
                    break;
                case "206":
                    text += "IT/인터넷";
                    break;
                case "207":
                    text += "전문직";
                    break;
                case "208":
                    text += "디자인";
                    break;
                case "209":
                    text += "교육";
                    break;
                case "210":
                    text += "경리·회계·결산";
                    break;
            }
        }

        // 근무조건
        if (checkbox.value == 300 || checkbox.value == 301 || checkbox.value == 302 || checkbox.value == 303 || checkbox.value == 304) {
            text = '<li id="' + checkbox.value + '"> 근무조건 : ';

            switch (checkbox.value) {
                case "300":
                    text += "정규직";
                    break;
                case "301":
                    text += "계약직";
                    break;
                case "302":
                    text += "인턴직";
                    break;
                case "303":
                    text += "파견직";
                    break;
                case "304":
                    text += "프리랜서";
                    break;
            }
        }

        // 희망 급여
        if (checkbox.value == 2500 || checkbox.value == 3000 || checkbox.value == 3500 || checkbox.value == 4000 || checkbox.value == 4500 || checkbox.value == 9999) {
            text = '<li id="' + checkbox.value + '"> 희망 급여 : ';

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
                case "4000":
                    text += "~4,000만원";
                    break;
                case "4500":
                    text += "~4,500만원";
                    break;
                case "9999":
                    text += "5,000만원 ↑";
                    break;
            }
        }

        $("#ul").append(text + '<input type="image" src="resources/images/x.png" onclick="reset(' + checkbox.value + ')"></input> </li>');
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
*/


function like(id) {
    var state = $("#" + id).attr("src");

    if (state == "resources/images/emptystar.png") {
        $("#" + id).attr("src", "resources/images/fullstar.png");
    } else {
        $("#" + id).attr("src", "resources/images/emptystar.png");
    }
}

function getSysdate() {
	   var d = new Date();

	   var year = d.getFullYear() - 2000;
	   var month = d.getMonth() + 1;
	   var day = d.getDate();

	   if (month < 10)
	      month = "0" + month;

	   if(day < 10)
	      day = "0" + day;

	   return year + "-" + month + "-" + day;
	}


