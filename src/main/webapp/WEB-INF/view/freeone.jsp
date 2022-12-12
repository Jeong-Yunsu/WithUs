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
        background: #eaeaea;
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
<div type="button" class="container" style="margin-top: 150px">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
                <c:forEach items="${golist}" var="u">
                    <div class="mb-3">
                        <label>${u.ntc_ttl}</label>
                        <tr>${u.ntc_cn}</tr>
                    </div>
                </c:forEach>
            <div style="display: inline-block">
                <button class="button1 btn-lg btn-block" type="button" onclick="location.href='update'">게시물 수정</button>
                <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">이전 으로</button>
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
            return history.back();
        } else {
            return false
        }
    }
</script>