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
    body {
        min-height: 100vh;
        background: #FCDDB0;
    }
    .input-form {
        max-width: 800px;

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
        font-size: 27px;
    }
    p {
        height: 45px;
        border-bottom: solid #cbccc9;
        font-size: 20px;
    }
</style>

<body>
<div class="container" style="margin-top: 150px">
    <button>go home</button>
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <c:forEach items="${list}" var="u">
            <h1 class="mb-3" style="font-weight: bold;padding-bottom: 13px">${u.mbr_nm}님의 마이페이지</h1>
            <form action="/userList" method="post">
<%--                    <div class="mb-3">--%>
<%--                        <label>이름</label>--%>
<%--                        <template>${u.mbr_nm}</template>--%>
<%--                    </div>--%>
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
                            <button class="button2 btn-lg btn-block" type="submit" onclick="work()">회원 탈퇴</button>
                        </form>
                        <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">이전 으로</button>
                    </div>
                </c:forEach>
            </form>
        </div>
    </div>
</div>

<%--<table  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>--%>
<%--    <tr>--%>
<%--        <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td bgcolor=white>--%>
<%--            <table class = "table2" align=center>--%>
<%--                <c:forEach items="${list}" var="u">--%>
<%--                    <tr>--%>
<%--                        <td>이름</td>--%>
<%--                        <td>${u.mbr_nm}</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>닉네임</td>--%>
<%--                        <td>${u.mbr_nick}</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>성별</td>--%>
<%--                        <td>${u.mbr_gen}</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>전화번호</td>--%>
<%--                        <td>${u.mbr_tel}</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>생일</td>--%>
<%--                        <td>${u.mbr_date}</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>이메일</td>--%>
<%--                        <td>${u.mbr_email}</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </table>--%>

<%--            <center>--%>
<%--                <button type="button" onclick="location.href='update'">정보 수정</button>--%>
<%--                <form action="/delete" method="post">--%>
<%--                    <button type="submit">회원 탈퇴</button>--%>
<%--                </form>--%>
<%--                <button type="button" onclick="delOk()">이전 으로</button>--%>
<%--            </center>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--</table>--%>
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
</body>
</html>