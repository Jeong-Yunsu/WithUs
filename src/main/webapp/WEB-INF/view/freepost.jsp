<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>with US</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="../css/freepost.css">
</head>


<body>
<div class="container" style="margin-top: 150px">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h1 class="mb-3" style="font-weight: bold;padding-bottom: 13px">자유게시판 작성하기</h1>
            <form method = "post" action = "/free/post">
                <div class="mb-3">
                    <label>제목</label>
                    <input type = "text" class="form-control2 textbox" name ="ntc_ttl" size=50 required>
                </div>
                <div class="mb-3">
                    <label>사진</label>
                    <input type = "file" class="real-upload" accept="image/*">
                </div>
                <div class="mb-3">
                    <label>내용</label>
                    <textarea type = "text" name="ntc_cn" cols=85 rows=15 required></textarea>
                </div>
                <div>
                    <input type="hidden" name = "mbr_sn" value ="${user.mbr_sn}" required>
                    <button class="button1 btn-lg btn-block" type="submit">작성하기</button>
                    <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">이전으로</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>


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
            return history.back();
        } else {
            return false
        }
    }
</script>
</body>
</html>