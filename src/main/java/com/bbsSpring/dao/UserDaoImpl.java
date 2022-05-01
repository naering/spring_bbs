package com.bbsSpring.dao;

import com.bbsSpring.common.Search;
import com.bbsSpring.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao{

    @Inject
    private SqlSession sqlSession;
    
    /**
     * 사용자 전체 조회
     * @return
     * @throws Exception
     */
    @Override
    public List<UserVo> getUserList(Search search) throws Exception {
        return sqlSession.selectList("userMapper.getUserList", search);
    }

    /**
     * 사용자 조회
     * @param memberId
     * @return
     * @throws Exception
     */
    @Override
    public UserVo getUserInfo(String memberId) throws Exception {
        return sqlSession.selectOne("userMapper.getUserInfo", memberId);
    }

    /**
     * 사용자 등록
     * @param userVo
     * @return
     * @throws Exception
     */
    @Override
    public int insertUser(UserVo userVo) throws Exception {
        return sqlSession.insert("userMapper.insertUser", userVo);
    }

    /**
     * 사용자 수정
     * @param userVo
     * @return
     * @throws Exception
     */
    @Override
    public int updateUser(UserVo userVo) throws Exception {
        return sqlSession.update("userMapper.updateUser", userVo);
    }

    /**
     * 사용자 삭제
     * @param memberId
     * @return
     * @throws Exception
     */
    @Override
    public int deleteUser(String memberId) throws Exception {
        return sqlSession.update("userMapper.deleteUser", memberId);
    }

    /**
     * 총 사용자 수
     * @param search
     * @return
     * @throws Exception
     */
    @Override
    public int getUserListCnt(Search search) throws Exception {
        return sqlSession.selectOne("userMapper.getUserListCnt", search);
    }

}
