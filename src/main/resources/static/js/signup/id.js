function checkId(){
    var idJ = /^[a-z0-9][a-z0-9_\-]{2,12}$/;
    var mbr_id = $('#mbr_id').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'./idCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{mbr_id:mbr_id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다
            if(cnt > 0) {
                $('.id_ok').css("display","none");
                $('.id_already').css("display", "inline-block");
                $('.id_check').css("display","none");
            } else if(idJ.test($('#mbr_id').val())===true) {
                $('.id_ok').css("display", "inline-block");
                $('.id_already').css("display", "none");
                $('.id_check').css("display","none");
            } else {
                $('.id_ok').css("display", "none");
                $('.id_already').css("display", "none");
                $('.id_check').css("display","inline-block");
            }
        },
        error:function(){
            alert("에러발생");
        }
    });
};