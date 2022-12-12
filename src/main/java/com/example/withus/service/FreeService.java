package com.example.withus.service;

import com.example.withus.vo.FreeVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface FreeService {
    void insertFree(FreeVo freeVo);
    List<FreeVo> clickFree(Integer mbr_sn);

    List<FreeVo> getFree(String Y);
    List<FreeVo> choiceFree(FreeVo freeVo);

}
