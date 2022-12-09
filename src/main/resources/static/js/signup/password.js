function checkPassword() {
    var idJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;

    document.getElementById('check2').innerHTML='ㅎㅇㅎㅇ'
    if(idJ.test(document.getElementById('password').value) === true) {
        document.getElementById('check2').innerHTML='사용가능한 비밀번호입니다.'
        document.getElementById('check2').style.color='#57a9ef';
    } else {
        document.getElementById('check2').innerHTML='8~16자 영어, 숫자, 특수문자를 포함하세요.';
        document.getElementById('check2').style.color='#ec134d';
    }
}

    // var password = document.getElementById('password').value;
    // if (password.length < 4 || password.length > 16) {
    //     window.alert('비밀번호는 4글자 이상, 16글자 이하만 이용 가능합니다.');
    //     document.getElementById('password').value = '';
    // }

function checkPassword2() {
    if(document.getElementById('password').value !=='' && document.getElementById('password2').value!=='') {
        if(document.getElementById('password').value === document.getElementById('password2').value) {
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='#57a9ef';
        } else {
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='#ec134d';
        }
    } else{
        document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
        document.getElementById('check').style.color='#ec134d';
    }

}