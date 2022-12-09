package com.example.withus.service;

import com.example.withus.vo.PostVo;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface PostService {
    void upload(PostVo postVo);

    List<PostVo> getPostList(Integer group);

    List<PostVo> getmbrPostList(Integer mbr_sn);

    Map<String, Object> readjosn(Integer group);

}