<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>User List</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/freeone.css">
    <link rel="stylesheet" type="text/css" href="../css/nav.css">

    <script src="/js/notice.js" defer></script>
</head>


<body>

<nav>
    <div class="nav-links">
        <a href="/mypage" class="link">마이페이지</a>
        <a href="/date" class="link">캘린더</a>
        <a href="/chat" class="link" onClick="window.open(this.href, '', 'width=600, height=650', left=0, top=0); return false;">채팅</a>
        <a href="/free" class="link">자유게시판</a>
        <form action="/logout" method="post">
            <button type="submit" class="link btn-logout" style="cursor:pointer" all="unset">로그아웃</button>
        </form>
    </div>
</nav>

<div type="button" class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <c:forEach items="${golist}" var="u">
                <div class="mb-3">
                    <label>${u.ntc_ttl}</label>
                    <tr>${u.ntc_cn}</tr>
                </div>
            </c:forEach>
            <div style="float: right">
                <div style="display: inline-block">
                    <button class="button1 btn-lg btn-block" type="button" onclick="location.href='/freeupdate'">수정</button>
                </div>
                <div style="display: inline-block">
                    <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>