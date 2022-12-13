package com.example.withus.service;

import com.example.withus.vo.LoginResponse;
import com.example.withus.vo.UserVo;

public interface UserService {

    void signUp(UserVo userVo);
    LoginResponse login(UserVo userVo);
    Integer getMbrSn(String mbr_id, String password);
    int idCheck(String mbr_id);
}
