<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>withUS</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/nav.css">
    <link rel="stylesheet" type="text/css" href="/css/font.css">

    <script src="/js/notice.js" defer></script>
</head>

<body>
<%--<button type="button" class="img-button" onclick="location.href='main'"></button>--%>

<nav>
    <div class="nav-links" style="padding-bottom: 300px">
        <div id="test" style="margin-top: 265px">
            <a href="/main" class="link" style="margin-bottom:200px;font-family: 'TmoneyRoundWindExtraBold';font-size: 50px;font-weight: bold">
                with US</a>
            <a href="/mypage" class="link">마이페이지</a>
            <a href="/date" class="link">캘린더</a>
            <a href="/chat" class="link" onClick="window.open(this.href, '', 'width=600, height=650', left=0, top=0); return false;">채팅</a>
            <a href="/free" class="link">자유게시판</a>
            <a href="/store" class="link" style="font-family: 'TmoneyRoundWindExtraBold';">스토어 바로가기</a>
            <form action="/logout" method="post">
                <button type="submit" class="link btn-logout" style="cursor:pointer" all="unset">로그아웃</button>
            </form>
            </div>
        </div>
</nav>

<div type="button" class="container" >
    <div class="input-form-background row">
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
                </form>
                <div>
                    <button class="button1 btn-lg btn-block" type="button" onclick="location.href='update'">정보 수정</button>
                    <form action="/delete" method="post">
                        <button class="button2 btn-lg btn-block" style="margin-top: 7px; margin-bottom: 7px" type="submit" onclick="delUser()">회원 탈퇴</button>
                    </form>
                    <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">이전으로</button>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>