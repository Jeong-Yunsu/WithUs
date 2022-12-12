function getSearchList(){
    $.ajax({
        type: 'GET',
        url : "/getSearchList",
        data : $("form[name=search-form]").serialize(),
        success : function(result){
            //테이블 초기화
            $('#boardtable > tbody').empty();
            if(result.length>=1){
                result.forEach(function(item){
                    str='<tr>'
                    str += "<td>"+item.ntc_ttl+"</td>";
                    str+="<td>"+item.ntc_cn+"</td>";
                    str+="</tr>"
                    $('#boardtable').append(str);
                })
            }
        }
    })
}

