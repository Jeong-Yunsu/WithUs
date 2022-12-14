package com.example.withus.Controller;

import com.example.withus.service.PostServiceImpl;
import com.example.withus.service.ScheduleServiceImpl;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.PostVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private PostServiceImpl postServiceImpl;

    @Autowired
    private ScheduleServiceImpl scheduleServiceImpl;

    @RequestMapping("/")
    public String firstPage() {
        return "first";
    }

//    @RequestMapping("/post")
//    public String postPage() {
//        return "post";
//    }

    @RequestMapping("/store")
    public String postListPage() {
        return "store";
    }

    @RequestMapping("/date")
    public String datePage(HttpSession session, Model model) {
        Integer mbr_sn = (Integer) session.getAttribute("userSn");
        Map<String, Object> result = scheduleServiceImpl.getsclist(mbr_sn);
        model.addAttribute("sclist", result.get("sclist"));
        return "date";
    }

    @RequestMapping("/main")
    public String postList(HttpSession session, Model model, PostVo postVo) {

        Integer group = 1;
        List<PostVo> postList = postServiceImpl.getPostList(group);
        model.addAttribute("postlist", postList);

        Integer mbr_sn = (Integer) session.getAttribute("userSn");
        List<PostVo> postmbrlist = postServiceImpl.getmbrPostList(mbr_sn);
        model.addAttribute("postmbrlist", postmbrlist);

        Map<String, Object> result = postServiceImpl.readjosn(group);
        model.addAttribute("readlist", result.get("readlist"));

        //System.out.println(postList);
        System.out.println(result);
        return "main";
    }
    @RequestMapping("/test")
    public String testPage() {
        System.out.println("테스트 성공");
        return "test";
    }
}