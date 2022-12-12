package com.example.withus.Controller;

import com.example.withus.service.FreeServiceImpl;
import com.example.withus.vo.FreeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class FreeController {
    @Autowired
    private FreeServiceImpl freeServiceImpl;

    @GetMapping("/getSearchList")
    private List<FreeVo> getSearchList(@RequestParam("type") String type,@RequestParam("keyword") String keyword, Model model) throws Exception{
        FreeVo freeVo = new FreeVo();
        freeVo.setType(type);
        freeVo.setKeyword(keyword);
        return freeServiceImpl.choiceFree(freeVo);
    }

    @GetMapping("/free")
    public String freepost(HttpSession session, Model model) {


        Integer mbr_sn = (Integer) session.getAttribute("userSn");
        String sd = "Y";
        List<FreeVo> freelist = freeServiceImpl.getFree(sd);


        model.addAttribute("freelist",freelist);


        return "free";
    }
    @GetMapping("/free/{sn}")
    public String inpost(@PathVariable String sn, HttpSession session, Model model) {
        Integer ntcSn = Integer.parseInt(sn);
        //Integer mbr_sn = (Integer) session.getAttribute("userSn");
        List<FreeVo> golist = freeServiceImpl.clickFree(ntcSn);
        model.addAttribute("golist", golist);

        return "freeone";
    }

}
