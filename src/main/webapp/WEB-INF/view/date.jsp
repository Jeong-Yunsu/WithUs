<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang='en'>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>withUS</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- bootstrap 4 -->
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- fullcalendar -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

        <style>
            #calendar{
                width:60%;
                margin:20px auto;
            }
        </style>
    </head>

    <body>
        <div id="calendarBox">
            <div id="calendar"></div>
        </div>

        <form action="/insertdate" method="post">
        <!-- modal 추가 -->
            <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                    <label  class="col-form-label">일정 내용</label>
                                    <input type="text" class="form-control" id="cal_ttl" name="cal_ttl" required>
                                    <label  class="col-form-label">시작 날짜</label>
                                    <input type="date" class="form-control" id="cal_str_dt" name="cal_str_dt" required>
                                    <label  class="col-form-label">종료 날짜</label>
                                    <input type="date" class="form-control" id="cal_end_dt" name="cal_end_dt" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-warning" id="addCalendar">추가</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    id="sprintSettingModalClose">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                    {

                        title:'일정',
                        start:'2022-12-07',
                        end:'2022-12-23'

                        // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                    }
                ]
                , headerToolbar: {
                    center: 'addEventButton' // headerToolbar에 버튼을 추가
                }, customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "일정 추가",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                            $("#calendarModal").modal("show"); // modal 나타내기

                            $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                                var calendar_content = $("#cal_ttl").val();
                                var calendar_start_date = $("#cal_str_dt").val();
                                var calendar_end_date = $("#cal_end_dt").val();

                                //내용 입력 여부 확인
                                if(calendar_content == null || calendar_content == ""){
                                    alert("내용을 입력하세요.");
                                }else if(calendar_start_date == "" || calendar_end_date ==""){
                                    alert("날짜를 입력하세요.");
                                }else if(new Date(calendar_end_date)- new Date(calendar_start_date) < 0){ // date 타입으로 변경 후 확인
                                    alert("종료일이 시작일보다 먼저입니다.");
                                }else{ // 정상적인 입력 시
                                    var obj = {
                                        "cal_ttl" : calendar_content,
                                        "cal_str_dt" : calendar_start_date,
                                        "cal_end_dt" : calendar_end_date
                                    }//전송할 객체 생성

                                    console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                }
                            });
                        }
                    }
                },
                editable: true, // false로 변경 시 draggable 작동 x
                displayEventTime: false // 시간 표시 x
            });
            calendar.render();
        });
    </script>
</html>