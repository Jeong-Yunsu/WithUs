package com.example.withus.Controller;

import com.example.withus.service.UserService;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.LoginResponse;
import com.example.withus.vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserServiceImpl userServiceImpl;

    @GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "signup";
    }

    // 회원가입
    @PostMapping("/signup")
    public String signUp(UserVo userVo) {

        try {
            userServiceImpl.signUp(userVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/login";
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String toLoginPage(HttpSession session) {
        LoginResponse sn = (LoginResponse) session.getAttribute("userId");
        if (sn != null) { // 로그인된 상태
            return "redirect:/main";
        }
        return "login"; // 로그인되지 않은 상태
    }

    // 로그인
    @PostMapping("/login")
    public String login(UserVo userVo, ModelMap model, HttpSession session) {
        String mbrId = userVo.getMbr_id();
        String mbrPswd = userVo.getPassword();


        // 유효성 검사
        if (StringUtils.isEmpty(mbrId) || StringUtils.isEmpty(mbrPswd)) {
            model.addAttribute("message", "모든 정보를 입력해주세요");
            return "login";
        }

        //로그인하는 login매서드 사용
        LoginResponse loginResponse = userServiceImpl.login(userVo);

        if (!loginResponse.isSuccess()) {
            model.addAttribute("message", loginResponse.getMessage());
            return "login";
        } else {
            Integer mbrSn = userServiceImpl.getMbrSn(mbrId, mbrPswd);
            session.setAttribute("userSn", mbrSn);
        }
        session.setAttribute("userId", loginResponse);

        return "redirect:/main";
    }

    // 로그아웃
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // 회원 정보 수정 페이지 이동
    @GetMapping("/update")
    public String toUpdatePage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user", userVo);
        return "update";
    }

    // 회원 정보 수정
    @PostMapping("/update")
    public String modifyInfo(HttpSession session, UserVo userVo) {
        Integer sn = (Integer) session.getAttribute("userSn");
        userVo.setMbr_sn(sn);
        userServiceImpl.modifyInfo(userVo);
        return "redirect:/mypage";
    }

    // 회원 탈퇴
    @PostMapping("/delete")
    public String withdraw(HttpSession session) {
        Integer sn = (Integer) session.getAttribute("userSn");
        if (sn != null) {
            userServiceImpl.withdraw(sn);
        }
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("userSn");
        List<UserVo> userList = userServiceImpl.getUserList(sn);
        model.addAttribute("list", userList);
        return "userList";
    }
    @Autowired
    private UserService userService;


    //아이디 중복체크
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam(value = "mbr_id") String mbr_id) {

        int cnt = userService.idCheck(mbr_id);
        return cnt;

    }
}