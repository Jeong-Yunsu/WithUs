package com.example.withus.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.naming.directory.SearchControls;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Getter
@Setter
public class UserVo {
    private int mbr_sn;
    private int gr_sn;
    private String mbr_id;
    private String password;
    private String mbr_nm;
    private String mbr_nick;
    private String mbr_date;
    private String mbr_gen;
    private String mbr_tel;
    private String mbr_email;

    private String rgtr_id;
    private LocalDateTime rgtr_dt;

    private int fail_cnt;
    private String lock_yn;

    private String use_yn;
}

