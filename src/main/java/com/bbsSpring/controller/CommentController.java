package com.bbsSpring.controller;

import com.bbsSpring.service.BbsService;
import com.bbsSpring.vo.CommentVo;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/comment")
public class CommentController {

    @Inject
    private BbsService bbsService;

    /**
     * 댓글 조회
     *@param bbsSeq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getCommentList", method = RequestMethod.POST)
    public List<CommentVo> getCommentList(@RequestParam("bbsSeq") int bbsSeq) throws Exception {
        return bbsService.getCommentList(bbsSeq);
    }

    /**
     * 댓글 등록
     * @param commentVo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertComment", method = RequestMethod.POST)
    public Map<String, Object> insertComment(@RequestBody CommentVo commentVo) throws Exception {
        Map<String, Object> result = new HashMap<>();
        try {
            bbsService.insertComment(commentVo);
            result.put("status", "OK");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", "False");
        }
        return result;
    }

    /**
     * 댓글 수정
     * @param commentVo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateComment", method = RequestMethod.POST)
    public Map<String, Object> updateComment(@RequestBody CommentVo commentVo) throws Exception {
        Map<String, Object> result = new HashMap<>();
        try {
            bbsService.updateComment(commentVo);
            result.put("status", "OK");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", "False");
        }
        return result;
    }

    /**
     * 댓글 삭제
     * @param commentSeq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
    public Map<String, Object> deleteComment(@RequestParam("commentSeq") int commentSeq) throws Exception {
        Map<String, Object> result = new HashMap<>();
        try {
            bbsService.deleteComment(commentSeq);
            result.put("status", "OK");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", "False");
        }
        return result;
    }

}
