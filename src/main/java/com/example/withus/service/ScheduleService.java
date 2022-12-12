package com.example.withus.service;

import com.example.withus.vo.ScheduleVo;

import java.util.List;
import java.util.Map;

public interface ScheduleService {


    public List<ScheduleVo> getScheduleList(Integer mbr_sn);

    public void insertDate(ScheduleVo scheduleVo);


    Map<String, Object> getsclist(Integer mbr_sn);

}
