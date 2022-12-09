package com.example.withus.mapper;

import com.example.withus.vo.PostVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<PostVo> getPostList(Integer group); // 테이블 가져오기
    void insertPost(PostVo postVo);

    List<PostVo> getmbrPostList(Integer mbr_sn);



}
