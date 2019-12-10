$(function() {
	$.ajax({
		url: "mainPage.hi",
		type: "get",
		success: function(data) {
			/*var sysdate = getSysdate();*/
			var sysdate = "19-10-31";
			var sysdatearr = sysdate.split("-");
			var sysdatecompare = new Date(sysdatearr[0], sysdatearr[1], sysdatearr[2]);

			for (var i in data) {
				if (data[i].hEnddate == sysdate) {
					if (data[i].hNo=="K131311910160039" || data[i].hNo=="K120231909250010" || data[i].hNo=="K131131909160065" || data[i].hNo=="K152511909200009" || data[i].hNo=="K151341910140003") {
						$("#ol").append("<li><a href='" + data[i].hUrl + "'>" + data[i].hCompany + "<span class='hirespan_end'>오늘 마감</span></a></li>");
					}
				}
			}

			for (var i in data) {
				var enddate = data[i].hEnddate;
				var enddatearr = enddate.split("-");
				var enddatecompare = new Date(enddatearr[0], enddatearr[1], enddatearr[2]);

				if (sysdatecompare.getTime() < enddatecompare.getTime()) {					
					if (data[i].hNo=="K120311910170022" || data[i].hNo=="K151411910100029" || data[i].hNo=="K151811910080049" || data[i].hNo=="K141111909200018" || data[i].hNo=="KF10951909190002") {
						$("#ol").append("<li><a href='" + data[i].hUrl + "'>" + data[i].hCompany + "<span class='hirespan_ing'>채용중</span></a></li>");
					}
				}
			}
			
			for (var i in data) {
				if (data[i].hEnddate == "채용시") {					
					if (data[i].hNo=="K151341910080019" || data[i].hNo=="K120421910040005" || data[i].hNo=="K120141910020029" || data[i].hNo=="K120121910010023" || data[i].hNo=="K151411910100027") {
						$("#ol").append("<li><a href='" + data[i].hUrl + "'>" + data[i].hCompany + "<span class='hirespan_every'>상시 채용</span></a></li>");
					}
				}
			}
		}
	});
});

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