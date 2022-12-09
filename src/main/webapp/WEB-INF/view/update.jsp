<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script type="text/javascript" src="/js/signup/password.js" defer></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
    body {
        min-height: 100vh;
        background: #FCDDB0;
        /*background: -webkit-gradient(linear, left bottom, right top, from(#FF9F9F), to(#FFFAD7));*/
        /*background: -webkit-linear-gradient(bottom left, #FF9F9F 0%, #FFFAD7 100%);*/
        /*background: -moz-linear-gradient(bottom left, #FF9F9F 0%, #FFFAD7 100%);*/
        /*background: -o-linear-gradient(bottom left, #FF9F9F 0%, #FFFAD7 100%);*/
        /*background: linear-gradient(to top right, #FF9F9F 0%, #FFFAD7 100%);*/
    }
    .input-form {
        max-width: 680px;

        margin-top: 80px;
        padding: 32px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    .button1 {
        background-color:#FF9F9F;
        color: #fff;
        border:none;
        border-radius:15px;
    }
    .button1:hover {
        background-color:#E97777;
        transition: 0.7s;
    }
    .button2 {
        background-color: #b9b6b6;
        color: #fff;
        border:none;
        border-radius:15px;
    }
    .button2:hover {
        background-color:#a6a4a4;
        transition: 0.7s;
    }
    label {
        font-weight: bold;
        display: block;
    }
    input {
        height: 45px;
        border: solid #cbccc9;
        border-radius: 10px;
    }
</style>

<body>
<tr  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>

<div class="container" style="margin-top: 150px">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h2 class="mb-3" style="font-weight: bold">정보 수정</h2>
        <form action="/update" method="post">
            <div class="mb-3">
                <label>아이디</label>
                <input type="text" style="width: 100%" name="mbr_id" value="${user.mbr_id}" size=50 readonly>
            </div>
            <div class="mb-3">
                <label>닉네임</label>
                <input type="text" style="width: 100%" name="mbr_nick" value="${user.mbr_nick}" size=50 required>
            </div>
            <div class="mb-3">
                <label>비밀번호</label>
                <input type="password" style="width: 100%" class="form-control2" id="password" name="password" placeholder="비밀번호(8~16자의 영어, 숫자, 특수문자를 포함하세요.)" oninput="checkPassword()" required><br>
                <span style="font-weight: bold" id="check2"></span>
            </div>
            <div class="mb-3">
                <label>비밀번호 확인</label>
                <input type="password" style="width: 100%" class="form-control2" id="password2" name="password2" placeholder="비밀번호 확인" onchange="checkPassword2()" required><br>
                <span style="font-weight: bold" id="check"></span>
            </div>
            <div class="mb-3">
                <label>전화번호</label>
                <input type="text" style="width: 100%" name="mbr_tel"value="${user.mbr_tel}" size=50 required>
            </div>
            <br>
            <div>
                <button class="button1 btn-lg btn-block" type="submit">수정하기</button>
                <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">뒤로가기</button>
            </div>
        </form>
        </div>
    </div>
</div>
</div>
</body>
</html>

<script>
    function delOk(){
        var result = confirm("이전 페이지로 돌아가시겠습니까?");

        if(result) {
            return history.go();
        } else {
            return false
        }
    }
</script>