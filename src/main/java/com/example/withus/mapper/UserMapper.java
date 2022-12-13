package com.example.withus.mapper;

import com.example.withus.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {   // Mapper 메서드 이름은 DB 관점에서!
    List<UserVo> getUserList(Integer sn); // User 테이블 가져오기
    void insertUser(UserVo userVo); // 회원가입
    UserVo getUserByEmail(UserVo userVo);    // 회원 정보 가져오기
    UserVo getUserBySn(Integer mbr_sn);
    UserVo getUserById(String mbr_id);
    void updateUser(UserVo userVo); // 회원 정보 수정
    void deleteUser(int mbr_sn); // 회원 탈퇴
    int idCheck(String mbr_id);
    void lockMemberLogin(UserVo userVo);
}