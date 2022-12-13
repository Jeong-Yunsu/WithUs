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

    <link rel="stylesheet" type="text/css" href="../css/freeone.css">
</head>


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
            <div style="float: right">
                <div style="display: inline-block">
                    <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">뒤로 가기</button>
                </div>
                <div style="display: inline-block">
                    <button class="button1 btn-lg btn-block" type="button" onclick="location.href='update'">게시물 수정</button>
                </div>


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