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

    <link rel="stylesheet" type="text/css" href="../css/mainMap.css?ver1" />
    <link rel="stylesheet" type="text/css" href="/css/mainSidebar.css">
    <link rel="stylesheet" type="text/css" href="/css/mainSub.css">
    <link rel="stylesheet" type="text/css" href="/css/mainSearch.css">
    <link rel="stylesheet" type="text/css" href="/css/font.css">

    <script src="/js/mainSidebar.js" defer></script>
    <script src="/js/mainSub.js" defer></script>
    <script src="/js/mainSearch.js" defer></script>
    <script src="../js/mainMap.js?ver0"></script>

    <script>
        $(document).ready(function(){
            $("#myKeywordSearch").on("click", function(e) {
                e.preventDefault();
            });

        });
    </script>
    <style>
        .story-label {
            font-weight: bold;
            display: inline-block;
            font-size: 24px;
            margin-bottom: 5px;
        }
        .story-div {
            display: inline-block;
            font-size: 15px;
            margin-bottom: 5px;
        }
    </style>
</head>

<body>
<div id = "grid">
    <div class="section">
        <div id="map"></div>
        <code id="snippet" class="snippet"></code>
    </div>

    <nav id ="leftSlideBar">
        <%--        <img src="image/bg_2.jpg" style="cursor:pointer;height: 50px;width: 50px" onclick="location.href='main'">--%>
        <div class="menu-btn">
            <div class="line line--1"></div>
            <div class="line line--2"></div>
            <div class="line line--3"></div>
        </div>

        <div class="nav-links" style="font-family: 'TmoneyRoundWindExtraBold'">
            <div id="test">
            <a href="/main" class="link" style="margin-bottom:200px;font-family: 'TmoneyRoundWindExtraBold';font-size: 50px;font-weight: bold">
                with US</a>
            <a href="/mypage" class="link" style="font-family: 'TmoneyRoundWindExtraBold';">마이페이지</a>
            <button href="" class="link" style="font-family: 'TmoneyRoundWindExtraBold';cursor:pointer" id="btn-story" onclick="storyShow()" >추억 모아보기</button>
            <a href="/date" class="link" style="font-family: 'TmoneyRoundWindExtraBold';">캘린더</a>
            <a href="/chat" class="link" style="font-family: 'TmoneyRoundWindExtraBold';"onClick="window.open(this.href, '', 'width=600, height=650', left=0, top=0); return false;">채팅</a>
            <a href="/free" class="link" style="font-family: 'TmoneyRoundWindExtraBold';">자유게시판</a>
            <a href="/store" class="link" style="font-family: 'TmoneyRoundWindExtraBold';">스토어 바로가기</a>
            <form action="/logout" method="post">
                <button type="submit" class="link" style="font-family: 'TmoneyRoundWindExtraBold';cursor:pointer" all="unset">로그아웃</button>
            </form>
            </div>
        </div>
    </nav>

    <!-- 검색창 -->
    <div class="area">
        <div id="address">
            <div class="search">
                <input type="search" id = "searchInput" name="searchInput" style="font-weight: bold" @keyup.enter='searchAddress()' v-model="keyword" placeholder="장소 검색"/>
                <input type="submit" id = "myKeywordSearch" name="myKeywordSearch" @click='searchAddress()' onclick='myFunction()' style="font-family: 'TmoneyRoundWindExtraBold';" class="search_btn" value="검색">

            </div>

            <div>
                <div style="width: 300px;height: 100%;border: 1px solid black; background: white">
                    <div v-if="resultList.length > 0">
                        <div class="list_wrap" v-for='result in resultList' @:click='move(result.x,result.y)' style="font-size: 12px; width: 300px;height: 100%;border: 1px solid black;">
                            <div style="margin: 10px">
                                <p class="txt01" style="font-weight: bold">상호명: {{result.place_name}}</p>
                                <p class="txt01">지번: {{result.address_name}}</p>
                                <p class="txt03">도로명: {{result.road_address_name}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><button type="button" class="infoWin" id="nowLo" style="background-color: #2f2f2f;height: available">내 위치</button>
    </div>

    <!--지도 정보-->
        <nav id="sub" >
            <div >
            <form class="LeftForm" id="send" action="sendLocation" method="GET">
                <p><input type="hidden" name="latiVal" id="latiVal" value="latitude"></p>
                <p><input type="hidden" name="longiVal" id="longiVal" value="longitude"></p>
                <div id = locationTitle style="font-size: 24px;margin: 5px;margin: 13px; font-family: 'TmoneyRoundWindExtraBold';"></div>
                <ul>
                    <li id =category_name></li>
                    <li id =place_url></li>
                    <li id =phone></li>
                    <li id =distance></li>
                </ul>
                <input id="btn5"  class="btn" type="submit" value="스토리 작성하기">
            </form>
            <form class="LeftForm" id="infoForm" action="sendLocation" method="GET">
                <p><input type="hidden" name="latiVal2" id="latiVal2" value="lati"></p>
                <p><input type="hidden" name="longiVal2" id="longiVal2" value="longi"></p></br>
                <div style="display: grid;grid-template-rows:350px 1fr ">
                    <%--  db사진업로드 추후 추가--%>
                    <img src="/image/mP2.jpg" style="width:350px; height:350px;margin: 10px;" ><br>
                    <div id = txtTitle style="font-family: 'TmoneyRoundWindExtraBold';font-size: 24px;margin: 5px;margin-bottom: 13px"></div>
                    <div id="myTxt" style="margin:5px;background-color: #FFFFFF;border-radius: 10px;">
                        <div id = txtContent style="font-size: 15px; margin: 5px"></div></br>
                        <div id = txtDate style="float: right; margin: 3px" ></div>
                    </div>
                </div>
                <input id="modifyBtn" class="btn" type="submit" value="수정하기">
            </form>
            <form class="LeftForm" id="storyForm" action="" method="GET" style="overflow: auto">
                <c:forEach items="${postlist}" var="p">
                    <ol class="story-ul" style="background-image: url('image/${p.txt_pic}.jpg')" >
                        <label class="story-label" STYLE="text-shadow: 2px 2px 2px #ffffff;">${p.txt_nm}</label><br>
                        <div class="story-div" STYLE="text-shadow: 2px 2px 2px #ffffff;">날짜: ${p.txt_date}</div><br>
                        <div class="story-div" STYLE="text-shadow: 2px 2px 2px #ffffff;">내용: ${p.txt_cn}</div>
                    </ol>
                </c:forEach>
            </form>
            </div>

        </nav>
</div>
</body>
</html>

<script>
    function storyShow() {
        $("#send").hide();
        $("#infoForm").hide();
        $("#storyForm").show();
    }

</script>

