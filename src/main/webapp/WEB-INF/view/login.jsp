<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <link rel="stylesheet" type="text/css" href="/css/login.css">
    </head>

    <body>
        <form action="/login" method="post">
            <div class="figure" style="margin-top: 400px; border-radius: 20px" >
                <!---728x90--->
                <div class="main">
                    <div class="head">
                        <h1>withUS</h1>
                    </div>
                    <div class="input_form">
                        <form>
                            <input type="text" name="mbr_id" value="ID" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                            <input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required=""><br>
                            <span style="color: red;">${message}</span>
                            <input type="submit" value="LOGIN"/>
                            <input type="button" value="회원가입" style="margin-top: 10px" onclick="location.href='signup'"/>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>