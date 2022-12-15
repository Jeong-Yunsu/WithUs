<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>withUS</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/signup/id.js" defer></script>
    <script type="text/javascript" src="/js/signup/password.js" defer></script>
    <script type="text/javascript" src="/js/signup/date.js" defer></script>
    <script type="text/javascript" src="/js/signup/email.js" defer></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="../css/signup.css">
</head>

<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h1 class="mb-3" style="font-weight: bold;padding-bottom: 13px">회원가입</h1>
            <form action="/signup" method="post">
                <div class="mb-3">
                    <label>아이디</label>
                    <input type="text" style="width: 100%" class="form-control2" id="mbr_id" name="mbr_id" placeholder="아이디(2~12자의 영문, 숫자만 사용 가능합니다.)" oninput="checkId()" required><br>
                    <span class="id_ok" style="font-weight: bold">사용가능한 아이디입니다.</span>
                    <span class="id_already" style="font-weight: bold">이미 사용중인 아이디입니다.</span>
                    <span class="id_check" style="font-weight: bold">2~12자의 영문, 숫자만 사용 가능합니다.</span>
                </div>
                <div class="mb-3">
                    <label>비밀번호</label>
                    <input type="password" style="width: 100%" class="form-control2" id="password" name="password" placeholder="비밀번호(8~16자의 영어, 숫자, 특수문자를 포함하세요.)" oninput="checkPassword()" required><br>
                    <span style="font-weight: bold" id="check2"></span>
                </div>
                <div class="mb-3">
                    <label>비밀번호 확인</label>
                    <input type="password" style="width: 100%" class="form-control2" id="password2" name="password2" placeholder="비밀번호 확인" onchange="checkPassword2()" required><br>
                    <span style="font-weight: bold" id="check"></span>
                </div>
                <div class="mb-3">
                    <label>이름</label>
                    <input type="text" style="width: 100%" class="form-control2" name="mbr_nm" placeholder="이름" required>
                </div>
                <div class="mb-3">
                    <label>닉네임</label>
                    <input type="text" style="width: 100%" class="form-control2" name="mbr_nick" placeholder="닉네임" required>
                </div>
                <div class="mb-3">
                    <label>성별</label>
                    남성 <input type="radio" name="mbr_gen" value="남자"/>
                    여성 <input type="radio" name="mbr_gen" value="여자"/>
                </div>
                <div class="mb-3">
                    <label>전화번호</label>
                    <%--                        <script type="text/javascript" src="/js/signup/tel.js" defer></script>--%>
                    <%--                        <td>--%>
                    <%--                            <span id="zero">010</span><span id="middle1">-</span><input type="text" id="fir_number" oninput="handleInputLength(this, 4)" required><span id="middle2">-</span><input type="text" id="sec_number" oninput="handleInputLength(this, 4)" required>--%>
                    <%--                            <input type="hidden" id="mbr_tel" name="mbr_tel" value="">--%>
                    <%--                        </td>--%>
                    <input type="text" style="width: 100%" class="form-control2" name="mbr_tel" placeholder="전화번호(-를 제외하시오)" required>
                </div>
                <div class="mb-3">
                    <label>생년월일(선택)</label>
                    <input type="text" style="width: 40%" class="form-control2" name="yy" id="yy" placeholder="년(4자)" oninput="handleInputLength(this, 4)">
                    <select style="width: 29%" class="form-control2" id="mm", name="mm">
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
                    <input type="text" style="width: 29%" class="form-control2" name="dd" id="dd" placeholder="일" oninput="handleInputLength(this, 2)">
                    <input type="hidden" id="mbr_date" name="mbr_date" value="">
                </div>
                <div class="mb-3">
                    <label>이메일(선택)</label>
                    <input type="text" style="width: 48%" class="form-control2" id="user_email"><span style="height: 45px" id="middle">@</span><input type="text" style="width: 48%" class="form-control2" id="email_address" list="user_email_address" placeholder="ex) naver.com">
                    <datalist class="form-control2" id="user_email_address">
                        <option value="naver.com"></option>
                        <option value="daum.com"></option>
                        <option value="gmail.com"></option>
                        <option value="직접입력"></option>
                    </datalist>
                    <input type="hidden" id="mbr_email" name="mbr_email" value="">
                </div>
                <br>
                <div>
                    <button class="button1 btn-lg btn-block" type="submit" onclick="work()">가입하기</button>
                    <button class="button2 btn-lg btn-block" type="button" onclick="delOk()">취소</button>
                </div>
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
            return history.back();
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
<script>
    function work() {
        var result = confirm("회원가입을 진행하겠습니까?");

        if (result) {
            alert("withUS에 오신 것을 환영합니다~");
        }
    }
</script>