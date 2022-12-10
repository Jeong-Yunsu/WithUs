// 아코디언 클릭
document.querySelectorAll('.accordion .accordion_item > button').forEach((btn) => {
    btn.addEventListener('click', (e) => {
        let accordion_item = e.currentTarget.parentNode;
        accordion_item.classList.toggle('open');
    });
});

// 검색창
$(document).ready(function(){

    //var cast;
    var address = new Vue({
        el : '#address',
        data : {
            keyword : '', //검색어
            searchResult : [], // 검색어로 가져온 주소
            resultList : [] // 결과값을 담을 배열
        },
        methods : {
            searchAddress : function(){
                var self = this;
                this.resultList = []; // 검색시 기존 목록을 비움
                var searchTxt = this.keyword; // 키워드를 변수에 담음
                if(searchTxt === '' || searchTxt === null) { // 키워드 입력 안헀을 시 return
                    alert("검색어를 입력하세요");
                    return;
                }

                //localStorage.setItem('txt',searchTxt);

                // 인증키
                var config = { headers: {Authorization : 'KakaoAK 00b285e6c72f581d9c2f16bb7c585100'}};
                // url 및 키워드 담아 보냄 - 주소를 가져옴
                var url = 'https://dapi.kakao.com/v2/local/search/address.json?query='+searchTxt;
                // API호출
                axios.get(url, config).then(function(result) {
                    // 만약 API호출을 통해 가져온 주소가 있을 경우 주소의 길이만큼 키워드 검색 API호출
                    if(result.data.documents.length != 0 && result.data != undefined && result.data != null){

                        console.log(result);

                        // 결과를 목록에 담음
                        self.searchResult.push(result.data.documents);
                        for(var i=0; i<self.searchResult[0].length;i++){
                            // 키워드 검색 API호출
                            self.getAddress(result.data.documents[i].address_name);
                        }
                    }else{
                        // API호출을 통해 가져온 주소가 없을 경우 입력한 값으로 바로 키워드 호출
                        self.getAddress(self.keyword);
                    }
                })
            },
            getAddress : function(name){
                var self = this;
                // 인증키
                var config = { headers: {Authorization : 'KakaoAK 00b285e6c72f581d9c2f16bb7c585100'}};
                // 키워드 검색 API URL
                var url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query=' + name;
                axios.get(url, config).then(function(result) {
                    // 결과를 concat을 통하여 배열에 적재, flat함수는 배열의 깊이를 없애준다.
                    self.resultList = self.resultList.concat(result.data.documents.flat());
                })
            },
            move : function(x,y){
                let itLocation = new naver.maps.LatLng(x, y);

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
                    '   <h3>'+this.keyword+'</h3>',
                    '</div>'
                ].join(''));


                    infowindow.open(map, marker);

            }
        }
    });
});