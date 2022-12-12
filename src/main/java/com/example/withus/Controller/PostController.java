package com.example.withus.Controller;

import com.example.withus.service.PostServiceImpl;
import com.example.withus.service.UserService;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.PostVo;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PostController {
    @Autowired
    private PostServiceImpl postServiceImpl;
    @Autowired
    private UserServiceImpl userServiceImpl;

    @GetMapping("/post")
    public String toPost(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user",userVo);
        return "post";
    }

    @PostMapping("/post")
    public String postUpload(PostVo postVo, HttpSession session, Model model) {
        try {
            postServiceImpl.upload(postVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/main";
    }

    @GetMapping("/sendLocation")
    public String sendLocation(HttpSession session, String latiVal, String longiVal, Model model) {
        model.addAttribute("latiVal",latiVal);
        model.addAttribute("longiVal",longiVal);
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user",userVo);
        return "post";
    }

    @PostMapping(value="/sendLocation")
    public String tosendLocation(PostVo postVo) {
        postServiceImpl.upload(postVo);
        return "redirect:/main";
    }


//    @RequestMapping("/main")
//    public String postList(Model model) {
//        Integer group = 1;
//        List<PostVo> postList = postServiceImpl.getPostList(group);
//        model.addAttribute("postlist", postList);
//        return "main";
//    }
}
