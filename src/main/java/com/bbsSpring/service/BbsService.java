package com.bbsSpring.service;

import com.bbsSpring.common.Pagination;
import com.bbsSpring.common.Search;
import com.bbsSpring.vo.BbsVo;
import com.bbsSpring.vo.CommentVo;

import java.util.List;


public interface BbsService {

    public List<BbsVo> getBbsList(Search search) throws Exception;   // 게시글 목록 조회
    public void insertBbs(BbsVo bbsVo) throws Exception;        // 게시글 등록
    public void updateBbs(BbsVo bbsVo) throws Exception;        // 게시글 수정
    public BbsVo getBbsCont(int bbsSeq) throws Exception;       // 게시글 내용 조회
    public void deleteBbs(int bbsSeq) throws Exception;         // 게시글 삭제
    public int getBbsListCnt(Search search) throws Exception;   // 총 게시글 개수

    public List<CommentVo> getCommentList(int commentSeq) throws Exception; // 댓글 조회
    public int insertComment(CommentVo commentVo) throws Exception; // 댓글 등록
    public int updateComment(CommentVo commentVo) throws Exception; // 댓글 수정
    public int deleteComment(int commentSeq) throws Exception;  // 댓글 삭제
}
