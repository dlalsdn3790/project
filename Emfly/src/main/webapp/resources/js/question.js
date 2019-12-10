$(document).ready(function (event){
    
    $('#answer1').keyup(function(){
    

    
    var inputLength = $(this).val().length;
    
    var remain = inputLength;
    if(remain <= 300){

     $('#textLength1').html(remain);
     }else{
         alert("1번 항목을 300자 미만으로 작성해주세요");
     }
            
        });

        $('#answer2').keyup(function(){
    

    
            var inputLength = $(this).val().length;
            
            var remain = inputLength;
            if(remain <= 300){
        
             $('#textLength2').html(remain);
             }else{
                 alert("2번 항목을 300자 미만으로 작성해주세요");
             }
                    
                });

    $('#answer3').keyup(function(){
    

    
    var inputLength = $(this).val().length;
    
    var remain = inputLength;
    if(remain <= 300){

     $('#textLength3').html(remain);
     }else{
         alert("3번 항목을 300자 미만으로 작성해주세요");
     }
            
        });
    
            
    
    });