<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<style>
    html,
    body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
        background: #eaeaea;
    }
    .input-form {
        max-width: 800px;
        margin-top: 230px;
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
        font-size: 27px;
    }
    p {
        height: 45px;
        border-bottom: solid #cbccc9;
        font-size: 20px;
    }
    nav{
        position: relative;
        float: left;
        transform: translateX(0px);
        background-color: #FF9F9F;
        width: 400px;
        height: 100%;
    }
    nav .nav-links {
        position: relative;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        transform: translateX(0px);
        opacity: 0;
        transition: all 900ms cubic-bezier(.9, 0, .33, 1);
    }
    nav .nav-links .link {
        margin: 20px 0;
        text-decoration: none;
        font-family: sans-serif;
        color: #ffffff;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 1.2rem;
        transition: all 300ms cubic-bezier(.9, 0, .33, 1);
    }
    nav .nav-links .link:hover {
        color: rgba(0, 0, 0, .5);
    }
    a{
        margin: 0 20px;
        color: #fff;
        font-size: 2rem;
        transition: all 400ms ease;
    }
    a:hover{
        color: #222;
    }
</style>

<body>
<%--<button type="button" class="img-button" onclick="location.href='main'"></button>--%>

<nav>
    <div class="nav-links">
        <a href="/mypage" class="link">마이페이지</a>
        <a href="/date" class="link">캘린더</a>
        <a href="/chat" class="link" onClick="window.open(this.href, '', 'width=600, height=650', left=0, top=0); return false;">채팅</a>
        <a href="/free" class="link">자유게시판</a>
        <form action="/logout" method="post">
            <button type="submit" class="link" all="unset">로그아웃</button>
        </form>
    </div>
</nav>

<div type="button" class="container" >
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <c:forEach items="${list}" var="u">
                <h1 class="mb-3" style="font-weight: bold;padding-bottom: 13px">${u.mbr_nm}님의 마이페이지</h1>
                <form action="/userList" method="post">
                    <div class="mb-3">
                        <label>닉네임</label>
                        <p>${u.mbr_nick}</p>
                    </div>
                    <div class="mb-3">
                        <label>성별</label>
                        <p>${u.mbr_gen}</p>
                    </div>
                    <div class="mb-3">
                        <label>전화번호</label>
                        <p>${u.mbr_tel}</p>
                    </div>
                    <div class="mb-3">
                        <label>생일</label>
                        <p>${u.mbr_date}</p>
                    </div>
                    <div class="mb-3">
                        <label>이메일</label>
                        <p>${u.mbr_email}</p>
                    </div>
                    <div>
                        <button class="button1 btn-lg btn-block" type="button" onclick="location.href='update'">정보 수정</button>
                        <form action="/delete" method="post">
                            <button class="button2 btn-lg btn-block" type="submit">회원 탈퇴</button>
                        </form>
                        <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">이전으로</button>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>
</div>
</body>

<script>
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
</script>
</html>