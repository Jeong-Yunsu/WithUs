<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>with US</title>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=35o7z9sq66&submodules=geocoder"></script>
        <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%--        <script type="text/javascript" src="<c:url value='/js/mainSearch.js' />"></script>--%>

        <link rel="stylesheet" type="text/css" href="../css/mainMap.css" />
        <link rel="stylesheet" type="text/css" href="/css/mainSidebar.css">
        <link rel="stylesheet" type="text/css" href="/css/mainSub.css">
        <link rel="stylesheet" type="text/css" href="/css/mainSearch.css">

        <script src="/js/mainSidebar.js" defer></script>
        <script src="/js/mainSub.js" defer></script>
        <script src="/js/mainSearch.js" defer></script>
        <script src="../js/mainMap.js"></script>

        <script>
            $(document).ready(function(){
                // 글 작성하기 부분
                $("#test-button").click(function(){
                    //$("p").hide();asdf
                });
            });
        </script>
    </head>

    <body>
        <div id = "grid">
            <div class="section">
                <div id="map"></div>
                <code id="snippet" class="snippet"></code>
            </div>

            <nav id ="leftSlideBar">
                <div class="menu-btn">
                    <div class="line line--1"></div>
                    <div class="line line--2"></div>
                    <div class="line line--3"></div>
                </div>

                <div class="nav-links">
                    <a href="/mypage" class="link">My page</a>
                    <a href="" class="link" id="btn-story">Story</a>
                    <a href="/date" class="link">Calendar / D-day</a>
                    <a href="" class="link">Message</a>
                    <a href="/post" class="link">Post Test</a>
                    <form action="/logout" method="post">
                        <button type="submit" class="link" all="unset">로그아웃</button>
                    </form>
                </div>
            </nav>

            <!-- 검색창 -->
            <div class="area">
                <div id="address">
                    <div class="search">
                        <input type="search" @keyup.enter='searchAddress()' v-model="keyword" placeholder="장소 검색"/>
                        <input type="button" @click='searchAddress()' class="search_btn" value="검색">
                    </div>
                    <div>
                        <div style="width: 300px;height: 100%;border: 1px solid black; background: white">
                            <div v-if="resultList.length > 0">
                                <div class="list_wrap" v-for='result in resultList' @:click='move(result.x,result.y)' style="width: 300px;height: 100%;border: 1px solid black;">
                                    <p class="txt01">지번: {{result.address_name}}</p>
                                    <p class="txt03">도로명: {{result.road_address_name}}</p>
                                    <p class="txt01">상호명: {{result.place_name}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--지도 정보-->
            <nav id="sub">
                <form action="sendLocation" method="GET">
                    <p><input type="String" name="latiVal" id="latiVal" value="latitude"></p>
                    <p><input type="String" name="longiVal" id="longiVal" value="longitude"></p>
                    <div id = locationTitle></div>
                    <ul>
                        <li id =category_name></li>
                        <li id =place_url></li>
                        <li id =phone></li>
                        <li id =distance></li>
                    </ul>
                    <input id="btn5" type="submit" value="전송">
                </form>
            </nav>

            <!--지도 정보-->
<%--            <nav id="sub">--%>
<%--                <div id = locationTitle></div>--%>
<%--                <ul>--%>
<%--                    <li id =category_name></li>--%>
<%--                    <li id =place_url></li>--%>
<%--                    <li id =phone></li>--%>
<%--                    <li id =distance></li>--%>
<%--                </ul>--%>
<%--                <button type="button" id="writeBtn">글 작성하기</button>--%>
<%--            </nav>--%>

            <!--스토리-->
<%--            <nav class="test-story">--%>
<%--                <c:forEach items="${postlist}" var="p">--%>
<%--                    <ul class="story-ul">--%>
<%--                        <li>[제목]</li>--%>
<%--                        <li>${p.txt_nm}</li>--%>
<%--                        <li>[날짜]</li>--%>
<%--                        <li>${p.txt_date}</li>--%>
<%--                        <li>--%>
<%--                            <a href="/postList">상세 보기</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </c:forEach>--%>
<%--            </nav>--%>
        </div>
    </body>
</html>

