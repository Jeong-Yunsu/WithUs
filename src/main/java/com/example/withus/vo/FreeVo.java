package com.example.withus.vo;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class FreeVo {
    private Integer ntc_sn;
    private String ntc_ttl;
    private String ntc_cn;
    private String mbr_sn;
    private Character top_fix;
    private String atch_file_id;
    private Character use_yn;
    private String rgtr_id;
    private LocalDateTime rgtr_dt;
    private String mdfr_id;
    private LocalDateTime mdfr_dt;

    private String searchCnd = "0";
    private String searchWrd = "";
}
