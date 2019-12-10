
var qlist=[];
var num=1;
var has_rec=false;
var download_check=false; // 다운로드 했는지 체크
var recording_limit_check=false; // 문제당 촬영 1회로 제한

//기술질문DB -> 자바스크립트
$.ajax({
	url:"techqlist.ajax",
	type: "POST",
	dataType:"json",
	success: function(data){
		console.log(data);
		console.log(data.qlist1.tQuestion)
		qlist[0]=data.qlist1.tQuestion;
		qlist[1]=data.qlist2.tQuestion;
		qlist[2]=data.qlist3.tQuestion;
		//첫번째 문제 출력
		$('.question').html(qlist[0]);
	}
})

const nextButton = document.querySelector('button.nextbutton');

function nextQ() {
	
	if(typeof(recordedBlobs)!=='undefined'){ // 촬영된 영상이 있는지
		console.log("download_check"+download_check);
		
		if(!download_check){ // 영상 다운로드 했는지
			var download_confirm =confirm('영상을 다운로드 하지 않았습니다. 넘어가시겠습니까?')
		}
		
			if(download_confirm||download_check){
				if(num==1){

					$(".question").html(qlist[num]);
					$(".progress-bar").css('width','66%');
					$(".progress-bar").html("2번문제");

					num++;
					recordedBlobs=undefined;
					download_check=false;
					recording_limit_check=false;
					return;
				}
				if(num==2){
					$(".question").html(qlist[num]);
					$(".progress-bar").css('width','100%');
					$(".progress-bar").html("3번문제");

					$(".nextbutton").html("종료");
					recordedBlobs=undefined;
					download_check=false;
					recording_limit_check=false;
					num++;
					return;
					
				}
				if(num==3){
					//그냥 종료하는걸로 변경
//					$('.nextbutton').attr("onclick","moveMain()");
					confirm('종료하시겠습니까?');
					if(confirm){
						moveMain();
					}
//					recordedBlobs=undefined;
					download_check=false;
					recording_limit_check=false;
					
				}
			}else{
				console.log("download_confirm&&download_check [else]")
				console.log("download_check"+download_check);
				console.log("download_confirm"+download_confirm)
			}
	}else{
		alert('영상이 없습니다. 촬영 먼저 해주세요');
	}
	
}


function moveMain(){
	//http://localhost:8989/spring/home
	console.log("종료버튼 실행")
	//location.href="http://localhost:8989/tsp/home";
	location.href="/emfly/mainPage.jsp";
}

//$(document).on('click','#recButton', function () {
//console.log("클릭됨");
//var interval;
//function timerstart() {
//$('.recording').addClass('on');
//var counter = 60;
//var interval = setInterval(function () {
//counter--;
//$('.time').text(counter);
//if (counter == 0) {

//clearInterval(interval);
//}
//}, 1000);

//}

//function timerstop() {
//$('.recording').removeClass('on');
//clearInterval(interval);
//}
//$('.recording').hasClass('on')? timerstart() : timerstop();



//});

//$('button#nextbutton').on('click',function(){
//alert(1);
//console.log('clicked');
//});

//$(document).on('click','#recButton',function(){
//alert(1);
//console.log('clicked');
//});


//function timer() {




//var time= $('.time').html();
//console.log(time);
//if(time ==60){
////clearInterval(interval);



//var counter = 60;
//var interval = setInterval(function () {
//counter--;
//$('.time').text(counter);
//if (counter == 0) {

//clearInterval(interval);
//}
//}, 1000);

//}else{
//console.log("else  ");
//clearInterval(interval);
//}

//}

var isPause=false ;
var interval;
function timerstart() {
	// $('.recording').addClass('on');
//	$('.recordingImg').attr('src','/k/resources/images/simulation/blackrec.png');
//	interview 경로에 이미지 경로 맞춤
	$('.recordingImg').attr('src','resources/images/simulation/blackrec.png');
	isPause=true;
	var counter = 60;
	$('.time').text(counter);
	interval = setInterval(function () {

		counter--;
		$('.time').text(counter);
		if (counter == 0) {
			$('.recordingImg').attr('src','resources/images/simulation/rec.png');

			console.log("0됨");

			clearInterval(interval);
		}
	}, 1000);

}
function timerstop() {
	$('.recordingImg').attr('src','resources/images/simulation/rec.png');
	// $('.recording').removeClass('on');
	clearInterval(interval);
	isPause=false;
}




//---------------------------------------------webcam

//화면 로딩시 웹캠 출력
//'use strict';

//On this codelab, you will be streaming only video (video: true).
//console.log(mediaStream);


const mediaStreamConstraints = {
		video: true,
		audio: true
};

//Video element where stream will be placed.
const localVideo = document.querySelector('video');

//Local stream that will be reproduced on the video.
let localStream;

//Handles success by adding the MediaStream to the video element.
function gotLocalMediaStream(mediaStream) {
	console.log(mediaStream);
	localStream = mediaStream;
	localVideo.srcObject = mediaStream;
//	mediaStream.getAudioTracks()[0].enabled =false;


}

//Handles error by logging a message to the console with the error message.
function handleLocalMediaStreamError(error) {
	console.log('navigator.getUserMedia error: ', error);
}

//Initializes media stream.
navigator.mediaDevices.getUserMedia(mediaStreamConstraints)
.then(gotLocalMediaStream).catch(handleLocalMediaStreamError);


//-------------------------------------------------------
//recording 기능

let mediaRecorder;
let recordedBlobs;
//console.log(recordedBlobs);    // : undefined
let sourceBuffer;

const errorMsgElement = document.querySelector('span#errorMsg');
//const recordedVideo = document.querySelector('video#recorded');
const recordButton = document.querySelector('button#recButton');



function startRecording(){
	
	console.log("startRecoding function 시작");
	recordedBlobs = [];
	let options = {mimeType: 'video/webm;codecs=vp9'};


	//mimetype 지원여부에 따른 재설정
	if (!MediaRecorder.isTypeSupported(options.mimeType)) {
		console.error(`${options.mimeType} is not Supported`);
		errorMsgElement.innerHTML = `${options.mimeType} is not Supported`;
		options = {mimeType: 'video/webm;codecs=vp8'};
		if (!MediaRecorder.isTypeSupported(options.mimeType)) {
			console.error(`${options.mimeType} is not Supported`);
			errorMsgElement.innerHTML = `${options.mimeType} is not Supported`;
			options = {mimeType: 'video/webm'};
			if (!MediaRecorder.isTypeSupported(options.mimeType)) {
				console.error(`${options.mimeType} is not Supported`);
				errorMsgElement.innerHTML = `${options.mimeType} is not Supported`;
				options = {mimeType: ''};
			}
		}
	}

	// console.log(options); 
	//medearecoder 생성 ( 변수 중요 )
	try {
		mediaRecorder = new MediaRecorder(localStream, options);
	} catch (e) {
		console.error('Exception while creating MediaRecorder:', e);
		errorMsgElement.innerHTML = `Exception while creating MediaRecorder: ${JSON.stringify(e)}`;
		return;
	}

	console.log('Created MediaRecorder', mediaRecorder, 'with options', options);
	// recordButton.textContent = 'Stop Recording';
	downloadButton.disabled = true;
	mediaRecorder.onstop = (event) => {
		console.log('Recorder stopped: ', event);
	};
	console.log(event);
	mediaRecorder.ondataavailable = handleDataAvailable;
	mediaRecorder.start(10); // collect 10ms of data
	console.log('MediaRecorder started', mediaRecorder);

	// console.log('recordedblobs:',recordedBlobs);  //배열출력됨
}

function stopRecording() {
	mediaRecorder.stop();
	console.log('Recorded Blobs: ', recordedBlobs);
}



//$(document).on('click','#recButton', function () {
//console.log(isPause);


//if(!isPause){
//console.log("이프문");
////$('.recording').hasClass('on')?  timerstop() : timerstart();
//timerstart();
//}else{
//console.log("else");
//clearInterval(interval);
//timerstop();
//}



//});

//촬영버튼 , 다운로드체크
recordButton.addEventListener('click', () => {
	
	if (!isPause) {
		if(!recording_limit_check){
		startRecording(); //레코딩 시작
		timerstart(); //타이머시작
		recording_limit_check=true; // 촬영1회 체크
		downloadButton.disabled = true;   //다운로드버튼
		nextButton.disabled=true;		//다음질문 버튼
		}else{
			alert('이미 촬영하셨습니다');
		}
		
	} else {
		stopRecording();
		clearInterval(interval);
		timerstop();
		downloadButton.disabled = false;
		nextButton.disabled=false;
	}
	
	
});

//blob으로 활용할 변수에 데이터 넣기
function handleDataAvailable(event) {
	if (event.data && event.data.size > 0) {
		recordedBlobs.push(event.data);
	}
}

const downloadButton = document.querySelector('button#downloadButton');

//다운로드버튼 , blob에 촬영본 넣음
downloadButton.addEventListener('click', () => {

	if(typeof(recordedBlobs)!=='undefined'){
		const blob = new Blob(recordedBlobs, {type: 'video/webm'});
		const url = window.URL.createObjectURL(blob);
		const a = document.createElement('a');
		a.style.display = 'none';
		a.href = url;
		// a.download = 'test.webm';
		a.download = '모의면접테스트영상';
		document.body.appendChild(a);
		a.click();
		setTimeout(() => {
			document.body.removeChild(a);
			window.URL.revokeObjectURL(url);
		}, 100);
		download_check=true;
	}else{
		alert('영상이 없습니다. 촬영 먼저 해주세요');
	}
});