package com.example.withus.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@Getter
@Setter
public class PostVo {
    private int txt_sn;
    private int gr_sn;
    private int mbr_sn;
    private String txt_nm;
    private String txt_cn;
    private String txt_date;
    private String txt_place;
    private String txt_pic;
    private String test_nm;

    private int rgtr_id;
    private LocalDateTime rgtr_dt;
}