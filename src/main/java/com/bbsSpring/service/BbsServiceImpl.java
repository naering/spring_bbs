package com.bbsSpring.service;

import com.bbsSpring.common.Search;
import com.bbsSpring.dao.BbsDao;
import com.bbsSpring.vo.BbsVo;
import com.bbsSpring.vo.CommentVo;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class BbsServiceImpl implements BbsService {

    @Inject
    private BbsDao bbsDao;

    /**
     * 게시물 목록 조회
     * @return
     * @throws Exception
     */
    public List<BbsVo> getBbsList(Search search) throws Exception {
        return bbsDao.getBbsList(search);
    }

    /**
     * 게시물 조회수 추가
     * @param bbsSeq
     * @return
     * @throws Exception
     */
    public BbsVo getBbsCont(int bbsSeq) throws Exception {
        bbsDao.updateHit(bbsSeq);
        return bbsDao.getBbsCont(bbsSeq);
    }

    /**
     * 게시물 등록
     * @param bbsVo
     * @throws Exception
     */
    @Override
    public void insertBbs(BbsVo bbsVo) throws Exception {
        bbsDao.insertBbs(bbsVo);
    }

    /**
     * 게시글 수정
     * @param bbsVo
     * @throws Exception
     */
    @Override
    public void updateBbs(BbsVo bbsVo) throws Exception {
        bbsDao.updateBbs(bbsVo);
    }

    /**
     * 게시물 삭제
     * @param bbsSeq
     * @throws Exception
     */
    @Override
    public void deleteBbs(int bbsSeq) throws Exception {
        bbsDao.deleteBbs(bbsSeq);
    }

    /**
     * 총 게시글 개수
     * @return
     * @throws Exception
     */
    @Override
    public int getBbsListCnt(Search search) throws Exception {
        return bbsDao.getBbsListCnt(search);
    }

    /**
     * 댓글 조회
     * @param commentSeq
     * @return
     * @throws Exception
     */
    @Override
    public List<CommentVo> getCommentList(int commentSeq) throws Exception {
        return bbsDao.getCommentList(commentSeq);
    }

    /**
     * 댓글 등록
     * @param commentVo
     * @return
     * @throws Exception
     */
    @Override
    public int insertComment(CommentVo commentVo) throws Exception {
        return bbsDao.insertComment(commentVo);
    }

    /**
     * 댓글 수정
     * @param commentVo
     * @return
     * @throws Exception
     */
    @Override
    public int updateComment(CommentVo commentVo) throws Exception {
        return bbsDao.updateComment(commentVo);
    }

    /**
     * 댓글 삭제
     * @param commentSeq
     * @return
     * @throws Exception
     */
    @Override
    public int deleteComment(int commentSeq) throws Exception {
        return bbsDao.deleteComment(commentSeq);
    }


}


