var map;
var lati,longi;
var infoWindow;
var markerList=[];
var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
var address;
var readlist=[
    {"gr_sn":1,"mbr_sn":120,"rgtr_dt":null,"rgtr_id":0,"test_nm":"","txt_cn":"ㅋㅋㅋㅋㅋ","txt_date":"2022-12-17","txt_loc_lat":"35.8727089","txt_loc_lng":"128.7085681","txt_nm":"경도위도잘들어가는거봐 ㅋㅋㅋㅋ","txt_pic":"","txt_sn":55},
    {"gr_sn":1,"mbr_sn":86,"rgtr_dt":null,"rgtr_id":0,"test_nm":"","txt_cn":"dd","txt_date":"2022-12-21","txt_loc_lat":"35.7688718","txt_loc_lng":"128.7495952","txt_nm":"dd","txt_pic":"","txt_sn":56},
    {"gr_sn":1,"mbr_sn":120,"rgtr_dt":null,"rgtr_id":0,"test_nm":"","txt_cn":"asdf","txt_date":"2022-12-06","txt_loc_lat":"35.9191897","txt_loc_lng":"128.650332","txt_nm":"나다2","txt_pic":"","txt_sn":58},
    {"gr_sn":1,"mbr_sn":120,"rgtr_dt":null,"rgtr_id":0,"test_nm":"","txt_cn":"df","txt_date":"2022-11-28","txt_loc_lat":"35.8994466","txt_loc_lng":"128.6659961","txt_nm":"asd","txt_pic":"","txt_sn":59},
    {"gr_sn":1,"mbr_sn":120,"rgtr_dt":null,"rgtr_id":0,"test_nm":"","txt_cn":"gdgd","txt_date":"2022-12-09","txt_loc_lat":"35.8752475","txt_loc_lng":"128.6974102","txt_nm":"안녕하세요","txt_pic":"","txt_sn":60}
];
$(document).ready(function(){
    //var dataForm = $("#readlist");
    // $(document).ready(function(){
    //     var dataForm = $("#readlist");
    //
    //     dataForm.forEach(function (n) {
    //         console.log(n.txt_loc_lat);
    //         console.log(n.txt_loc_lng);
    //     });
    // });
    console.log("data: "+readlist);
    console.log(readlist);
});

function map() {

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new naver.maps.LatLng(lati, longi), // 지도의 중심좌표
            zoom: 10, // 지도의 확대 레벨
            mapTypeControl: true
        };

    // 지도를 생성합니다
    map = new naver.maps.Map(mapContainer, mapOption);

    // 내 위치에 마커 띄우기
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(lati, longi),
        map: map
    });

    infoWindow = new naver.maps.InfoWindow({
        anchorSkew: true
    });

    setMyData(); // 게시물 지도에 마커로 표시

    map.setCursor('pointer');
    map.getPanes().floatPane.appendChild(menuLayer[0]);

    // 마우스 클릭이벤트
    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
        setMarkerAndInfo(e);
        //isClick = true;
    });

    naver.maps.Event.addListener(map, 'keydown', function(e) {
        var keyboardEvent = e.keyboardEvent,
            keyCode = keyboardEvent.keyCode || keyboardEvent.which;

        var ESC = 27;

        if (keyCode === ESC) {
            keyboardEvent.preventDefault();

            for (var i=0, ii=markerList.length; i<ii; i++) {
                markerList[i].setMap(null);
            }

            markerList = [];
            menuLayer.hide();
        }
    });

    naver.maps.Event.addListener(map, 'mousedown', function(e) {
        menuLayer.hide();
    });

    function setMyData(){
        readlist.forEach(function (item){

            let itTitle = item.test_nm;
            //let itTxt = item.txt_cn;
            let itLocation = new naver.maps.LatLng(item.txt_loc_lat, item.txt_loc_lng);

            var marker = new naver.maps.Marker({
                map: map,
                position: itLocation
            });

            var infowindow = new naver.maps.InfoWindow({
                maxWidth: 500,
                backgroundColor: "#eee",
                borderColor: "#2db400",
                borderWidth: 5,
                anchorSize: new naver.maps.Size(30, 30),
                anchorSkew: true,
                anchorColor: "#eee",
                pixelOffset: new naver.maps.Point(20, -20)
            });

            infowindow.setContent([
                '<div class="iw_inner">',
                '   <h3>'+item.test_nm+'</h3>',
                '</div>'
            ].join(''));

            naver.maps.Event.addListener(marker, "click", function(e) {
                    infowindow.open(map, marker);
            });

            infowindow.open(map, marker);
        });
    };

    function setMarkerAndInfo(e){
        var marker = new naver.maps.Marker({
            position: e.coord,
            map: map
        });

        markerList.push(marker);

        // var coordHtml = 'Point: ' + e.point + '<br />';
        //
        // menuLayer.show().css({
        //     left: e.offset.x-22,
        //     top: e.offset.y-90,
        //     borderRadius:20
        // }).html(coordHtml);

        console.log('Coord: ' + e.coord.toString());
    };
}

function searchCoordinateToAddress(latlng) {

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,
            address = '',
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
        }

        infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        infoWindow.open(map, latlng);
        getData();

        function getData() {
            $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v2/local/search/keyword.json?y=" + lati.toString() + "&x=" + longi.toString() + "&radius=20000",
                data: {query: address},
                headers: {Authorization: "KakaoAK 00b285e6c72f581d9c2f16bb7c585100"}
            })
                .done(function (msg) {
                    console.log(msg);
                    try {
                        $("#latiVal").val(msg.documents[0].x);
                        $("#longiVal").val(msg.documents[0].y);
                        $("#locationTitle").html(" <strong>" + msg.documents[0].place_name + "</strong>");
                        $("#category_name").html("<li>" + "category: " + msg.documents[0].category_name + "</li>");
                        $("#place_url").html("<li>" + "url: " + msg.documents[0].place_url + "</li>");
                        $("#phone").html("<li>" + "phone: " + msg.documents[0].phone + "</li>");
                        $("#distance").html("<li>" + "현위치로 부터 " + msg.documents[0].distance + "m 거리에 있습니다." + "</li>");

                    } catch (error) {
                        $("#locationTitle").html(" <strong>*정보 없음*</strong>");
                        $("#category_name").html("<li>" + "" + "</li>");
                        $("#place_url").html("<li>" + "" + "</li>");
                        $("#phone").html("<li>" + "" + "</li>");
                        $("#distance").html("<li>" + "" + "</li>");
                    }
                });
        }
    });
}

function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,

        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString (word, lastString) {
    return new RegExp(lastString + '$').test(word);
}

function hasAddition (addition) {
    return !!(addition && addition.value);
}

var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
};

function success(pos) {
    crd = pos.coords;
    lati = crd.latitude;
    longi = crd.longitude;

    //alert(crd.latitude+","+crd.longitude);

    map();
};

function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
};


navigator.geolocation.getCurrentPosition(success, error, options);
