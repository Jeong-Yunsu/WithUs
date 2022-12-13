package com.example.withus.Controller;

import com.example.withus.service.FreeServiceImpl;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.FreeVo;
import com.example.withus.vo.UserVo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FreeController {
    @Autowired
    private FreeServiceImpl freeServiceImpl;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @ResponseBody
    @RequestMapping("/getSearchList")
    private byte[] getSearchList(HttpSession session,FreeVo vo) throws Exception{

        Map<String, Object> res = new HashMap<>();
        res.put("success", Boolean.FALSE);
        Character sd = 'Y';
        vo.setUse_yn(sd);//(Character(session.getAttribute("intteSeq").toString()));
        List<FreeVo> searchList = freeServiceImpl.choiceFree(vo);
        res.put("searchList", searchList);
        return new Gson().toJson(res).getBytes("UTF-8");
    }

    @GetMapping("/free")
    public String freepost(HttpSession session, Model model) {
//        Integer ntc_sn = freeServiceImpl.getNtcSn()

        String sd = "Y";
        List<FreeVo> freelist = freeServiceImpl.getFree(sd);
        model.addAttribute("freelist",freelist);
        return "free";
    }

    @GetMapping("/free/{sn}")
    public String inpost(@PathVariable String sn, HttpSession session, Model model) {
        int ntcSn = Integer.parseInt(sn);
        session.setAttribute("ntcSn", ntcSn);
        List<FreeVo> golist = freeServiceImpl.clickFree(ntcSn);
        model.addAttribute("golist", golist);
        return "freeone";
    }

    @GetMapping("/free/post")
    public String enroll(HttpSession session, Model model){
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user",userVo);
        return "freepost";
    }

    @PostMapping("/free/post")
    public String postUpload(FreeVo freeVo) {
        try {
            freeServiceImpl.insertFree(freeVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/free";
    }

    // 글 수정 페이지 이동
    @GetMapping("/freeupdate")
    public String teUpdateTxt(HttpSession session, Model model) {
        Integer ntcSn = (Integer) session.getAttribute("ntcSn");
        FreeVo freeVo = freeServiceImpl.getTxtBySn(ntcSn);
        model.addAttribute("free", freeVo);
        return "freeupdate";
    }

    // 글 수정
    @PostMapping("/freeupdate")
    public String modifyTxt(HttpSession session, FreeVo freeVo) {
        Integer ntcSn = (Integer) session.getAttribute("ntcSn");
        freeVo.setNtc_sn(ntcSn);
        freeServiceImpl.modifyTxt(freeVo);
        return "redirect:/free";
    }

    // 글 삭제
    @PostMapping("/freedelete")
    public String deleteTxt(HttpSession session, FreeVo freeVo) {
        Integer ntcSn = (Integer) session.getAttribute("ntcSn");
        freeVo.setNtc_sn(ntcSn);
        freeServiceImpl.delTxt(freeVo);
        return "redirect:/free";
    }
}
