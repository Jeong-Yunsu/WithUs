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
    public FreeVo getTxtBySn(Integer ntc_sn){
        return freeMapper.getTxtBySn(ntc_sn);
    }
    public void insertFree(FreeVo freeVo) {
        int mbr_sn = freeVo.getMbr_sn();

        freeVo.setRgtr_id(mbr_sn);
        freeVo.setRgtr_dt(LocalDateTime.now());

        freeMapper.insertFree(freeVo);
    }
    public List<FreeVo> clickFree(int ntc_sn) {
        return  freeMapper.clickFree(ntc_sn);
    }
    @Override
    public List<FreeVo> getFree(String Y) {
        return freeMapper.getFree(Y);
    }
    public List<FreeVo> choiceFree(FreeVo  freeVo) {
        return freeMapper.choiceFree(freeVo);
    }

    // ntc_sn 받아오기
    @Override
    public Integer getNtcSn(Integer ntc_sn) {
        FreeVo freeVo = freeMapper.getTxtBySn(ntc_sn);
        return freeVo.getNtc_sn();
    }

    // 게시물 수정
    public void modifyTxt(FreeVo freeVo) {
        String ntc_ttl = freeVo.getNtc_ttl();
        String ntc_cn = freeVo.getNtc_cn();

        freeVo.setNtc_ttl(ntc_ttl);
        freeVo.setNtc_cn(ntc_cn);
        freeMapper.updateTxt(freeVo);
    }

    // 게시물 삭제
    public void delTxt(FreeVo freeVo) {
        Character use_yn = 'N';

        freeVo.setUse_yn(use_yn);
        freeMapper.deleteTxt(freeVo);
    }
}
