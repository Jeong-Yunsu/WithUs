<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex, follow">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>자유게시판</title>

        <link rel="stylesheet" type="text/css" href="../css/write.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/free.css">

        <script src="js/free.js"></script>
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/vaafb692b2aea4879b33c060e79fe94621666317369993" integrity="sha512-0ahDYl866UMhKuYcW078ScMalXqtFJggm7TmlUtp0UlD4eQk0Ixfnm5ykXKvGJNFjLMoortdseTfsRT8oCfgGA==" data-cf-beacon='{"rayId":"77830a6b9e6219e4","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.11.3","si":100}' crossorigin="anonymous"></script>
    </head>

    <body>
        <input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">

        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <select class="W180" name="searchCnd" id="searchCnd" style="float: left">
                        <option value="0">전체</option>
                        <option value="1">제목</option>
                        <option value="2">내용</option>
                    </select>

                    <input type="text" id="searchWrd" name="searchWrd" placeholder="검색어를 입력하세요." style="float: left; margin-bottom: 10px">
                    <button  onclick="search()">검색</button>

                    <div class="table">
                        <div class="row header">
                            <div class="cell">번호</div>
                            <div class="cell">제목</div>
                            <div class="cell">작성일</div>
                        </div>

                        <div id="list">
                            <table>
                                <c:forEach var="list" items="${freelist}" varStatus="listvoStatus">
                                    <div class="row">
                                        <div class="cell" data-title="번호">
                                            <a href="/free/${list.ntc_sn}" datatype="">${listvoStatus.index + 1}</a>
                                            <input type="hidden"${list.ntc_cn}>
                                        </div>
                                        <div class="cell" data-title="제목">
                                            <a href="/free/${list.ntc_sn}" datatype="">${list.ntc_ttl}</a>
                                            <input type="hidden"${list.ntc_cn}>
                                        </div>
                                        <div class="cell" data-title="작성일">
                                            <a href="/free/${list.ntc_sn}" datatype="">${list.rgtr_dt}</a>
                                            <input type="hidden"${list.ntc_cn}>
                                        </div>
                                    </div>
                                </c:forEach>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
            <a href="/free/post">글작성하기</a>
        </div>
    </body>
</html>