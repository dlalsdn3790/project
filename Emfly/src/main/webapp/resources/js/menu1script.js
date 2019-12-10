$(document).ready(function (event){
    
    $('textarea').keyup(function(){
    

    
    var inputLength = $(this).val().length;
    
    var remain = inputLength;
    if(remain <= 500){

     $('#textLength').html(remain);
     }else{
         alert("자기소개서를 500자 미만으로 작성해주세요");
     }
            
        });
    
            
    
    });