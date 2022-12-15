function delOk(){
    var result = confirm("이전 페이지로 돌아가시겠습니까?");

    if(result) {
        return history.back();
    } else {
        return false
    }
}
function delUser() {
    var result = confirm("진짜로 탈퇴할거야??");

    if (result) {
        alert("회원이 탈퇴되었습니다.");
    } else {
        return false
    }
}
function delTxt() {
    var result = confirm("글을 삭제하시겠습니까?");

    if (result) {
        alert("글이 삭제되었습니다.");
    } else {
        return false
    }
}