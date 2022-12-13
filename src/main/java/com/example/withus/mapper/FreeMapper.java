package com.example.withus.mapper;

import com.example.withus.vo.FreeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeMapper {
    void insertFree(FreeVo freeVo);
    List<FreeVo> clickFree(Integer mbr_sn);
    List<FreeVo> choiceFree(FreeVo freeVo);
    List<FreeVo> getFree(String Y);
    FreeVo getTxtBySn(Integer ntc_sn);

    // 수정
    void updateTxt(FreeVo freeVo);

    // 삭제
    void deleteTxt(FreeVo freeVo);
}
