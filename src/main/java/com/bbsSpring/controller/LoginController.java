package com.bbsSpring.controller;

import com.bbsSpring.common.Search;
import com.bbsSpring.vo.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    /**
     * 로그인 화면
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(Model model) throws Exception {
        model.addAttribute("userVo", new UserVo());
        return "login/login";
    }

    /**
     * 회원가입 화면
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signupForm", method = RequestMethod.GET)
    public String signupForm(Model model) throws Exception {
        model.addAttribute("userVo", new UserVo());
        return "login/signupForm";
    }


}
