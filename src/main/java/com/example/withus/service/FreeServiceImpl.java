package com.example.withus.service;

import com.example.withus.mapper.FreeMapper;
import com.example.withus.vo.FreeVo;
import lombok.RequiredArgsConstructor;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class FreeServiceImpl implements FreeService{

    private final FreeMapper freeMapper;

    public void insertFree(FreeVo freeVo) {
        int mbr_sn = freeVo.getMbr_sn();

        freeVo.setRgtr_id(mbr_sn);
        freeVo.setRgtr_dt(LocalDateTime.now());

        freeMapper.insertFree(freeVo);
    }


    public List<FreeVo> clickFree(int mbr_sn) {
        return  freeMapper.clickFree(mbr_sn);
    }

    @Override
    public List<FreeVo> getFree(String Y) {
        return freeMapper.getFree(Y);
    }


    public List<FreeVo> choiceFree(FreeVo  freeVo) {

        return freeMapper.choiceFree(freeVo);

    }

}
