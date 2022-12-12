package com.example.withus.service;

import com.example.withus.mapper.ScheduleMapper;
import com.example.withus.vo.PostVo;
import com.example.withus.vo.ScheduleVo;
import lombok.RequiredArgsConstructor;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{
    private final ScheduleMapper scheduleMapper;
    public List<ScheduleVo> getScheduleList(Integer mbr_sn){
        return scheduleMapper.getScheduleList(mbr_sn);

    }

    public void insertDate(ScheduleVo scheduleVo){
        String cal_ttl = scheduleVo.getCal_ttl();
        Date cal_str_dt = scheduleVo.getCal_str_dt();
        Date cal_end_dt = scheduleVo.getCal_end_dt();

        scheduleVo.setCal_ttl(cal_ttl);
        scheduleVo.setCal_str_dt(cal_str_dt);
        scheduleVo.setCal_end_dt(cal_end_dt);

        scheduleMapper.insertSchedule(scheduleVo);
    }

    @Override
    public Map<String, Object> getsclist(Integer mbr_sn) {

        List<ScheduleVo> sclist = scheduleMapper.getScheduleList(mbr_sn);

        JSONArray scjslist = JSONArray.fromObject(sclist);


        Map<String, Object> result = new HashMap<>();
        result.put("sclist",scjslist);

        return result;
    }



}
