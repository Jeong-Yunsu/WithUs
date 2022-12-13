package com.example.withus.websocket;

import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ChatController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @RequestMapping("/chat")
    public ModelAndView chat(HttpSession session, Model model) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat");
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user", userVo);
        return mv;
    }
}