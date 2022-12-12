package com.example.withus.service;

import com.example.withus.mapper.PostMapper;
import com.example.withus.vo.PostVo;
import lombok.RequiredArgsConstructor;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostMapper postMapper;

    @Override
    public void upload(PostVo postVo) {
        int mbr_sn = postVo.getMbr_sn();

        postVo.setRgtr_id(mbr_sn);
        postVo.setRgtr_dt(LocalDateTime.now());

        postMapper.insertPost(postVo);
    }

    public List<PostVo> getPostList(Integer group) { return postMapper.getPostList(group); }


    public List<PostVo> getmbrPostList(Integer mbr_sn) {
        return postMapper.getmbrPostList(mbr_sn);
    }

    @Override
    public Map<String, Object> readjosn(Integer group) {

        List<PostVo> readlist = postMapper.getPostList(group);

        JSONArray jsonArray = JSONArray.fromObject(readlist);


        Map<String, Object> result = new HashMap<>();
        result.put("readlist",jsonArray);

        return result;
    }
//    @Override
//    public Map<String, Object> readmbrjosn(Integer group) {
//
//        List<PostVo> readlist = postMapper.getmbrPostList(group);
//
//        JSONArray jsonArray = JSONArray.fromObject(readlist);
//
//
//        Map<String, Object> result = new HashMap<>();
//        result.put("readmbrlist",jsonArray);
//
//        return result;
//    }

    @Override
    public Map<String, Object> readmbrjosn(Integer group) {

        List<PostVo> readlist = postMapper.getmbrPostList(group);

        JSONArray jsonArray = JSONArray.fromObject(readlist);


        Map<String, Object> result = new HashMap<>();
        result.put("readmbrlist",jsonArray);

        return result;
    }
}
