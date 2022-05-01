package com.bbsSpring.service;

import com.bbsSpring.common.Search;
import com.bbsSpring.dao.UserDao;
import com.bbsSpring.vo.UserVo;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Inject
    private UserDao userDao;

    /**
     * 사용자 전체 조회
     * @return
     * @throws Exception
     */
    @Override
    public List<UserVo> getUserList(Search search) throws Exception {
        return userDao.getUserList(search);
    }

    /**
     * 사용자 조회
     * @param memberId
     * @return
     * @throws Exception
     */
    @Override
    public UserVo getUserInfo(String memberId) throws Exception {
        return userDao.getUserInfo(memberId);
    }

    /**
     * 사용자 등록
     * @param userVo
     * @return
     * @throws Exception
     */
    @Override
    public int insertUser(UserVo userVo) throws Exception {
        return userDao.insertUser(userVo);
    }

    /**
     * 사용자 수정
     * @param userVo
     * @return
     * @throws Exception
     */
    @Override
    public int updateUser(UserVo userVo) throws Exception {
        return userDao.updateUser(userVo);
    }

    /**
     * 사용자 삭제
     * @param memberId
     * @return
     * @throws Exception
     */
    @Override
    public int deleteUser(String memberId) throws Exception {
        return userDao.deleteUser(memberId);
    }

    /**
     * 총 사용자 수
     * @param search
     * @return
     * @throws Exception
     */
    @Override
    public int getUserListCnt(Search search) throws Exception {
        return userDao.getUserListCnt(search);
    }

}
