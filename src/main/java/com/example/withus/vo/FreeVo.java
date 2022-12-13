package com.example.withus.vo;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class FreeVo {
    private int ntc_sn;
    private String ntc_ttl;
    private String ntc_cn;
    private int mbr_sn;
    private Character top_fix;
    private String atch_file_id;
    private Character use_yn;
    private int rgtr_id;
    private LocalDateTime rgtr_dt;
    private String mdfr_id;
    private LocalDateTime mdfr_dt;

    private String searchCnd = "0";
    private String searchWrd = "";

    private String mbr_nm;
}
