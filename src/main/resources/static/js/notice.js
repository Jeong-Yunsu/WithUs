function delOk(){
    var result = confirm("이전 페이지로 돌아가시겠습니까?");

    if(result) {
        return history.back();
    } else {
        return false
    }
}
function work() {
    var result = confirm("회원을 탈퇴 할 것인가요?");

    if (result) {
        alert("회원이 탈퇴되었습니다");
    }
}