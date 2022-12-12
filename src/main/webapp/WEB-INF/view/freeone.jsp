<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
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
                <c:forEach items="${golist}" var="u">

                    <tr>${u.ntc_ttl}</tr>
                    <tr>${u.ntc_cn}</tr>


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