<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>with US</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function(){
            console.log(<%= request.getParameter("latiVal")%>);
            console.log(<%= request.getParameter("longiVal")%>);
        });
    </script>
</head>

<body>
<form method = "post" action = "/post">
    <table  style="padding-top:50px" align = center width=700 border=0 cellpadding=2 >
        <tr>
            <td height=20 align= center bgcolor=#FF9F9F><font color=white></font></td>
        </tr>
        <tr>
            <td bgcolor=white>
                <table class = "table2">
                    <tr>
                        <td>제목</td>
                        <td><input type = "text" name ="txt_nm" size=50 required></td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                        <td><input type = date name = "txt_date" size=50 required></td>
                    </tr>
                    <tr>
                        <td>사진</td>
                        <td><input type="file" class="real-upload" accept="image/*"></td>
                    </tr>



                    <input type = "hidden" name ="txt_loc_lat" value="${latiVal}" size=50 required>



                    <input type = "hidden" name ="txt_loc_lng" value="${longiVal}"  size=50 required>


                    <tr>
                        <td>내용</td>
                        <td><textarea type="text" name ="txt_cn" cols=85 rows=15 required></textarea></td>
                    </tr>
                </table>

                <center>
                    <input type="hidden" name = "mbr_sn" value ="${user.mbr_sn}" required>
                    <button type="button" onclick="delOk()">이전으로</button>
                    <button type="submit">작성하기</button>
                </center>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

<html>
<body>
<input type="file" class="real-upload" accept="image/*" required multiple style="display: none;">
<div class="upload"></div>
<script>
    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');

    upload.addEventListener('click', () => realUpload.click());
</script>

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