<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>

        <link rel="stylesheet" type="text/css" href="../css/write.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/free.css">
    </head>

    <body>
<%--        <table  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>--%>
<%--            <tr>--%>
<%--                <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td bgcolor=white>--%>
<%--                    <table class = "table2" align=center>--%>
<%--                        <c:forEach items="${freelist}" var="u">--%>
<%--                            <a href="/free/${u.ntc_sn}" datatype="">${u.ntc_ttl}</a>--%>
<%--                        </c:forEach>--%>
<%--                    </table>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>


        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <form name="search-form" autocomplete="off">
                        <select name="type" style="float: left">
                            <option selected value="">검색 내용 선택</option>
                            <option value="ntc_ttl">제목</option>
                            <option value="ntc_cn">내용</option>
                        </select>
                        <input type="text" name="keyword" value="" style="float: left">
                        <input type="button" onclick="getSearchList()" class="btn btn-outline-primary mr-2" value="검색" style="float: left">
                    </form>

                    <div class="table">
                        <div class="row header">
                            <div class="cell">
                                번호
                            </div>
                            <div class="cell">
                                제목
                            </div>
                        </div>
                        <div class="row">
                            <div class="cell" data-title="Full Name">
                                Vincent Williamson
                            </div>
                            <div class="cell" data-title="Age">
                                31
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>

        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <script src="vendor/select2/select2.min.js"></script>

        <script src="js/main.js"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', 'UA-23581568-13');
        </script>
    </body>
</html>