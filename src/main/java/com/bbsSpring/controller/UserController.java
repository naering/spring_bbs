package com.bbsSpring.controller;

import com.bbsSpring.common.Search;
import com.bbsSpring.service.UserService;
import com.bbsSpring.vo.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Inject
    private UserService userService;

    /**
     * 사용자 전체 목록
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
    public String getUserList(Model model,
                              @RequestParam(required = false, defaultValue = "1")int page,
                              @RequestParam(required = false, defaultValue = "1")int range,
                              @RequestParam(required = false, defaultValue = "memberId") String searchType,
                              @RequestParam(required = false) String keyword) throws Exception {

        Search search = new Search();
        search.setSearchType(searchType);
        search.setKeyword(keyword);

        // 전체 회원 수
        int listCnt = userService.getUserListCnt(search);

        search.pageInfo(page,range,listCnt);

        model.addAttribute("pagination", search);
        model.addAttribute("userList", userService.getUserList(search));
        return "user/userList";
    }

    /**
     * 사용자 등록
     * @param userVo
     * @param rttr
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertUser", method = RequestMethod.POST)
    public String insertUser(@ModelAttribute("userVo")UserVo userVo, RedirectAttributes rttr) throws Exception {
        userService.insertUser(userVo);
        return "redirect:/bbs/getBbsList"; // 회원가입 후 게시판으로 바로 이동
    }

}
