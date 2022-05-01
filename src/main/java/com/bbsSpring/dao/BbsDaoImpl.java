package com.bbsSpring.dao;

import com.bbsSpring.common.Search;
import com.bbsSpring.vo.BbsVo;
import com.bbsSpring.vo.CommentVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class BbsDaoImpl implements BbsDao {

    @Inject
    private SqlSession sqlSession;  // DB Connection 알아서 관리해 주는 객체

    /**
     * 게시물 목록 조회
     *
     * @param search
     * @return
     * @throws Exception
     */
    @Override
    public List<BbsVo> getBbsList(Search search) throws Exception {
        return sqlSession.selectList("bbsMapper.getBbsList", search);
    }

    /**
     * 게시글 조회
     *
     * @param bbsSeq
     * @return
     * @throws Exception
     */
    @Override
    public BbsVo getBbsCont(int bbsSeq) throws Exception {
        return sqlSession.selectOne("bbsMapper.getBbsCont", bbsSeq);
    }

    /**
     * 게시글 등록
     *
     * @param bbsVo
     * @return
     * @throws Exception
     */
    @Override
    public int insertBbs(BbsVo bbsVo) throws Exception {
        return sqlSession.insert("bbsMapper.insertBbs", bbsVo);
    }

    /**
     * 게시글 수정
     *
     * @param bbsVo
     * @return
     * @throws Exception
     */
    @Override
    public int updateBbs(BbsVo bbsVo) throws Exception {
        return sqlSession.update("bbsMapper.updateBbs", bbsVo);
    }

    /**
     * 게시글 삭제
     *
     * @param bbsSeq
     * @return
     * @throws Exception
     */
    @Override
    public int deleteBbs(int bbsSeq) throws Exception {
        return sqlSession.delete("bbsMapper.deleteBbs", bbsSeq);
    }

    /**
     * 게시글 조회수 업데이트
     *
     * @param bbsSeq
     * @return
     * @throws Exception
     */
    @Override
    public int updateHit(int bbsSeq) throws Exception {
        return sqlSession.update("bbsMapper.updateHit", bbsSeq);
    }

    /**
     * 총 게시글 개수
     *
     * @param search
     * @return
     * @throws Exception
     */
    @Override
    public int getBbsListCnt(Search search) throws Exception {
        return sqlSession.selectOne("bbsMapper.getBbsListCnt", search);
    }

    /**
     * 댓글 조회
     *
     * @param commentSeq
     * @return
     * @throws Exception
     */
    @Override
    public List<CommentVo> getCommentList(int commentSeq) throws Exception {
        return sqlSession.selectList("commentMapper.getCommentList", commentSeq);
    }

    /**
     * 댓글 등록
     *
     * @param commentVo
     * @return
     * @throws Exception
     */
    @Override
    public int insertComment(CommentVo commentVo) throws Exception {
        return sqlSession.insert("commentMapper.insertComment", commentVo);
    }

    /**
     * 댓글 수정
     *
     * @param commentVo
     * @return
     * @throws Exception
     */
    @Override
    public int updateComment(CommentVo commentVo) throws Exception {
        return sqlSession.update("commentMapper.updateComment", commentVo);
    }

    /**
     * 댓글 삭제
     *
     * @param commentSeq
     * @return
     * @throws Exception
     */
    @Override
    public int deleteComment(int commentSeq) throws Exception {
        return sqlSession.delete("commentMapper.deleteComment", commentSeq);
    }


}
