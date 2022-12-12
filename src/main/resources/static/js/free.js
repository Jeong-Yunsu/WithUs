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
                    "<div id=\"list\">"+
                    "<table >" +
                    "<div className=\"row\">"+
                        "<div id=\"list\"className=\"cell\"data-title=\"Full Name\">" +

                          "<a href=/free/" + item.ntc_sn + ">" + item.ntc_ttl + "</a>"+

                        "</div>" +
                    "</div>"+
                    "</table>"+"</div>"
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
