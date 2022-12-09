<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .id_ok{
            color: #57a9ef;
            display: none;
        }

        .id_already{
            color: #fb6ad2;
            display: none;
        }
    </style>
    <style>
        body {
            min-height: 100vh;

            background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
            background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
        }
        .input-form {
            max-width: 680px;

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
    </style>
</head>

<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h2 class="mb-3">회원가입</h2>
            <form action="/signup" method="post">
                <div class="mb-3">
                    <label>아이디</label>
                    <script type="text/javascript" src="/js/signup/id.js" defer></script>
                    <input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디" oninput="checkId()" required>
                    <span class="id_ok">사용가능한 아이디입니다.</span>
                    <span class="id_already">이미 사용중인 아이디입니다.</span>
                    <span class="id_check">2~12자의 영문, 숫자만 사용 가능합니다.</span>
                </div>
                <div class="mb-3">
                    <label>비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" onchange="checkPassword()" required>
                </div>
                <div class="mb-3">
                    <label>비밀번호 확인</label>
                    <script type="text/javascript" src="/js/signup/password.js" defer></script>
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" onchange="checkPassword2()" required>
                    <span id="check"></span>
                </div>
                <div class="mb-3">
                    <label>이름</label>
                    <input type="text" class="form-control" name="mbr_nm" placeholder="이름" required>
                </div>
                <div class="mb-3">
                    <label>닉네임</label>
                    <input type="text" class="form-control" name="mbr_nick" placeholder="닉네임" required>
                </div>
                <div class="mb-3">
                    <label>성별</label><br>
                    남 <input type="radio" name="mbr_gen" value="남자"/> <br>
                    여 <input type="radio" name="mbr_gen" value="여자"/>
                </div>
                <div class="mb-3">
                    <label>전화번호</label>
                    <%--                        <script type="text/javascript" src="/js/signup/tel.js" defer></script>--%>
                    <%--                        <td>--%>
                    <%--                            <span id="zero">010</span><span id="middle1">-</span><input type="text" id="fir_number" oninput="handleInputLength(this, 4)" required><span id="middle2">-</span><input type="text" id="sec_number" oninput="handleInputLength(this, 4)" required>--%>
                    <%--                            <input type="hidden" id="mbr_tel" name="mbr_tel" value="">--%>
                    <%--                        </td>--%>
                    <input type="text" class="form-control" name="mbr_tel" placeholder="전화번호(-를 제외하시오)" required>
                </div>
                <div class="mb-3">
                    <label>생일(선택)</label>
                    <script type="text/javascript" src="/js/signup/date.js" defer></script>
                    <input type="text" class="form-control" name="yy" id="yy" placeholder="년(4자)" oninput="handleInputLength(this, 4)">
                    <select class="form-control" id="mm", name="mm">
                        <option value="">월</option>
                        <option value="01" >1</option>
                        <option value="02" >2</option>
                        <option value="03" >3</option>
                        <option value="04" >4</option>
                        <option value="05" >5</option>
                        <option value="06" >6</option>
                        <option value="07" >7</option>
                        <option value="08" >8</option>
                        <option value="09" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                    </select>
                    <input type="text" class="form-control" name="dd" id="dd" placeholder="일" oninput="handleInputLength(this, 2)">
                    <input type="hidden" id="mbr_date" name="mbr_date" value="">
                </div>
                <div class="mb-3">
                    <label>이메일(선택)</label>
                    <script type="text/javascript" src="/js/signup/email.js" defer></script>
                    <input type="text" class="form-control" id="user_email"><span id="middle">@</span><input type="text" class="form-control" id="email_address" list="user_email_address" placeholder="ex) naver.com">
                    <datalist id="user_email_address">
                        <option value="naver.com"></option>
                        <option value="daum.com"></option>
                        <option value="gmail.com"></option>
                        <option value="직접입력"></option>
                    </datalist>
                    <input type="hidden" id="mbr_email" name="mbr_email" value="">
                </div>
                <center>
                    <button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
                    <button class="btn btn-secondary btn-lg btn-block" type="button" onclick="delOk()">취소</button>
                </center>
            </form>
            </td>
            </tr>
        </div>
    </div>
</div>
</body>
</html>

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

<script>
    function handleInputLength(el, max) {
        if(el.value.length > max) {
            el.value = el.value.substr(0, max);
        }
    }
</script>