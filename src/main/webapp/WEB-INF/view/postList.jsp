<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>withUS</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
</head>

<body>
<table  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>
    <tr>
        <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>
    </tr>
    <tr>
        <td bgcolor=white>
            <table class = "table2" align=center>
                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>이름</td>
                        <td>${u.mbr_nm}</td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>${u.mbr_nick}</td>
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td>${u.mbr_gen}</td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>${u.mbr_tel}</td>
                    </tr>
                    <tr>
                        <td>생일</td>
                        <td>${u.mbr_date}</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>${u.mbr_email}</td>
                    </tr>
                </c:forEach>
            </table>

            <center>
                <button type="button" onclick="location.href='update'">정보 수정</button>
                <form action="/delete" method="post">
                    <button type="submit">회원 탈퇴</button>
                </form>
                <button type="button" onclick="delOk()">이전 으로</button>
            </center>
        </td>
    </tr>
</table>
<script>
    function delOk(){
        var result = confirm("이전 페이지로 돌아가시겠습니까?");

        if(result) {
            return history.go(-1);
        } else {
            return false
        }
    }
</script>
</body>
</html>