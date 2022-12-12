<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        function search(){
            var searchCnd = document.getElementById("searchCnd").value;
            var searchWrd = document.getElementById("searchWrd").value;
            var dataForm = {"searchCnd" : searchCnd, searchWrd:searchWrd}

            $.ajax({
                async: true,
                type: "GET",
                url: ($("#contextPath").val() + "/getSearchList"),
                /* url: ("/search.do"), */
                data: dataForm,
                dataType: "json",
                success: function(res){
                    $("#list").empty();


                    var tempHtml = "";
                    res.searchList.forEach(function(item, index) {
                        tempHtml += "<tr><td>" + (index+1) + "</td>" +
                            "<td>" + "<a href=/free/" + item.ntc_sn + ">" + item.ntc_ttl + "</a>" + "</td>" +

                            "</tr>"


                    });

                    $("#list").append(tempHtml);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown){
                    alert("통신 실패.")
                }
            });
        };
    </script>
</head>

<body>

<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">

<div class="center">
    <div class="tableTop">
        <div class="table_search" style="margin: 0;">
            <select class="W180" name="searchCnd" id="searchCnd">
                <option value="0">전체</option>
                <option value="1">제목</option>
                <option value="2">내용</option>
            </select>
            <input type="text" id="searchWrd" name="searchWrd" placeholder="검색어를 입력하세요." >
            <button  onclick="search()">검색</button>
        </div>
    </div>

    <div class="table_area">
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
            </tr>
            </thead>
            <tbody id="list">
            <c:forEach var="list" items="${freelist}" varStatus="listvoStatus">
                <tr>
                    <td>${listvoStatus.index + 1}</td>
                    <td><a href="/free/${list.ntc_sn}" datatype="">${list.ntc_ttl}</a></td>

                    <input type="hidden"${list.ntc_cn}>


                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div style="margin-top: 5px; float: right">
        </div>
    </div>
</div>
<a href="/free/post">글작성하기</a>

</body>
</html>



<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--    <head>--%>
<%--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--        <title>User List</title>--%>

<%--        <link rel="stylesheet" type="text/css" href="../css/write.css">--%>
<%--        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">--%>

<%--        <link rel="stylesheet" type="text/css" href="css/free.css">--%>

<%--        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>--%>
<%--        <script>--%>
<%--            function search(){--%>
<%--                var searchCnd = document.getElementById("searchCnd").value;--%>
<%--                var searchWrd = document.getElementById("searchWrd").value;--%>
<%--                var dataForm = {"searchCnd" : searchCnd, searchWrd:searchWrd}--%>

<%--                $.ajax({--%>
<%--                    async: true,--%>
<%--                    type: "GET",--%>
<%--                    url: ($("#contextPath").val() + "/getSearchList"),--%>
<%--                    /* url: ("/search.do"), */--%>
<%--                    data: dataForm,--%>
<%--                    dataType: "json",--%>
<%--                    success: function(res){--%>
<%--                        $("#list").empty();--%>


<%--                        var tempHtml = "";--%>
<%--                        res.searchList.forEach(function(item, index) {--%>
<%--                            tempHtml += "<tr><td>" + (index+1) + "</td>" +--%>
<%--                                "<td>" + "<a href=/free/" + item.ntc_sn + ">" + item.ntc_ttl + "</a>" + "</td>" +--%>

<%--                                "</tr>"--%>


<%--                        });--%>

<%--                        $("#list").append(tempHtml);--%>
<%--                    },--%>
<%--                    error: function(XMLHttpRequest, textStatus, errorThrown){--%>
<%--                        alert("통신 실패.")--%>
<%--                    }--%>
<%--                });--%>
<%--            };--%>
<%--        </script>--%>
<%--    </head>--%>

<%--    <body>--%>
<%--    <input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">--%>
<%--        <div class="limiter">--%>
<%--            <div class="container-table100">--%>
<%--                <div class="wrap-table100">--%>
<%--                    <select class="W180" name="searchCnd" id="searchCnd">--%>
<%--                        <option value="0">전체</option>--%>
<%--                        <option value="1">제목</option>--%>
<%--                        <option value="2">내용</option>--%>
<%--                    </select>--%>
<%--                    <input type="text" id="searchWrd" name="searchWrd" placeholder="검색어를 입력하세요." >--%>
<%--                    <button  onclick="search()">검색</button>--%>

<%--                    <div class="table">--%>
<%--                        <div class="row header">--%>
<%--                            <div class="cell">--%>
<%--                                번호--%>
<%--                            </div>--%>
<%--                            <div class="cell">--%>
<%--                                제목--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="cell" data-title="Full Name">--%>
<%--                                <c:forEach var="list" items="${freelist}" varStatus="listvoStatus">--%>
<%--                                    <tr>--%>
<%--                                        <td>${listvoStatus.index + 1}</td>--%>
<%--                                        <td><a href="/free/${list.ntc_sn}" datatype="">${list.ntc_ttl}</a></td>--%>

<%--                                        <input type="hidden"${list.ntc_cn}>--%>


<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
<%--                            </div>--%>
<%--                            <div class="cell" data-title="Age">--%>
<%--                                31--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>--%>

<%--        <script src="vendor/bootstrap/js/popper.js"></script>--%>
<%--        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>--%>

<%--        <script src="vendor/select2/select2.min.js"></script>--%>

<%--        <script src="js/main.js"></script>--%>

<%--        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>--%>
<%--        <script>--%>
<%--            window.dataLayer = window.dataLayer || [];--%>
<%--            function gtag(){dataLayer.push(arguments);}--%>
<%--            gtag('js', new Date());--%>

<%--            gtag('config', 'UA-23581568-13');--%>
<%--        </script>--%>

<%--        <a href="/free/post">글작성하기</a>--%>
<%--    </body>--%>
<%--</html>--%>