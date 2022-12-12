package com.example.withus.Controller;

import com.example.withus.service.ScheduleServiceImpl;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.ScheduleVo;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ScheduleController {

    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private ScheduleServiceImpl scheduleServiceImpl;

    @GetMapping("/insertdate")
    public String inschedulePage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user",userVo);
        return "insertdate";
    }

    @PostMapping("/insertdate")
    public String toinschedulePage(ScheduleVo scheduleVo) {
        try {
            scheduleServiceImpl.insertDate(scheduleVo);
        }catch ( Exception e){
            e.printStackTrace();
        }
        return "redirect:/date";
    }
}
