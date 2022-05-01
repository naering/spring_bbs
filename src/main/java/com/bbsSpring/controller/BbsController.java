package com.bbsSpring.controller;

import com.bbsSpring.common.Search;
import com.bbsSpring.service.BbsService;
import com.bbsSpring.vo.BbsVo;
import com.bbsSpring.vo.CommentVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/bbs")
public class BbsController {

    @Inject
    private BbsService bbsService;

    /**
     * 게시글 목록 조회
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getBbsList", method = RequestMethod.GET)
    public String getBbsList(Model model,
                             @RequestParam(required = false, defaultValue = "1") int page,
                             @RequestParam(required = false, defaultValue = "1") int range,
                             @RequestParam(required = false, defaultValue = "bbsTitle") String searchType,
                             @RequestParam(required = false) String keyword) throws Exception {

        Search search = new Search();
        search.setSearchType(searchType);
        search.setKeyword(keyword);

        // 전체 게시글 개수
        int listCnt =bbsService.getBbsListCnt(search);

        search.pageInfo(page,range,listCnt);

        model.addAttribute("pagination", search);
        model.addAttribute("bbsList", bbsService.getBbsList(search));
        return "bbs/bbsList";
    }

    /**
     * 게시글 등록
     * @return
     */
    @RequestMapping("/bbsWrite")
    public String bbsWrite(@ModelAttribute("bbsVo") BbsVo bbsVo, Model model) {
        return "bbs/bbsWrite";
    }

    /**
     * 게시글 저장
     * @param bbsVo
     * @param rttr
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saveBbs", method = RequestMethod.POST)
    public String saveBbs(@ModelAttribute("BbsVo") BbsVo bbsVo, @RequestParam("mode") String mode,RedirectAttributes rttr) throws Exception {
        if (mode.equals("edit")) {                // 수정일 경우
            bbsService.updateBbs(bbsVo);
        } else {                                  // 신규 등록일 경우
            bbsService.insertBbs(bbsVo);
        }
        return "redirect:/bbs/getBbsList";
    }

    /**
     * 게시글 내용 조회
     * @param model
     * @param bbsSeq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getBbsCont", method = RequestMethod.GET)
    public String getBbsCont(Model model, @RequestParam("bbsSeq") int bbsSeq) throws Exception {
        model.addAttribute("bbsCont", bbsService.getBbsCont(bbsSeq));
        model.addAttribute("commentVo", new CommentVo());  // 댓글 넘기기 위해
        return "bbs/bbsCont";
    }

    /**
     * 게시글 수정 (게시글 등록과 동일한 입력폼 사용)
     * @param bbsSeq
     * @param mode
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bbsUpdate", method = RequestMethod.GET)
    public String bbsUpdate(@RequestParam("bbsSeq") int bbsSeq
            , @RequestParam("mode") String mode, Model model) throws Exception {
        model.addAttribute("bbsCont", bbsService.getBbsCont(bbsSeq));
        model.addAttribute("mode", mode);
        model.addAttribute("bbsVo", new BbsVo());  // 기존 입력화면을 수정하여 사용하므로, 입력폼과 연계하기 위함
        return "bbs/bbsWrite";
    }

    /**
     * 게시글 삭제
     * @param rttr
     * @param bbsSeq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bbsDelete", method = RequestMethod.GET)
    public String bbsDelete(RedirectAttributes rttr, @RequestParam("bbsSeq") int bbsSeq) throws Exception {
        bbsService.deleteBbs(bbsSeq);
        return "redirect:/bbs/getBbsList";
    }
    
    

}
