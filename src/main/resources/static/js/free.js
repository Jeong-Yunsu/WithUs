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
                tempHtml +=
                    "<div class='row' onClick=\"location.href=\'/free/" + item.ntc_sn + "\'\">" +
                    "<div class='cell' data-title='Full Name'>" + (index + 1)+ "</div>" +
                    "<div class='cell' data-title='Age'>" + item.ntc_ttl + "</div>" +
                    "<div class='cell' data-title='Age'>" + item.mbr_nm + "</div>" +
                    "<div class='cell' data-title='Age'>" + item.rgtr_dt + "</div>" +
                    "</div>"
            });
            $("#list").append(tempHtml);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
            alert("통신 실패.")
        }
    });
};

window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'UA-23581568-13');
