package com.bbsSpring.service;

import com.bbsSpring.common.Search;
import com.bbsSpring.vo.UserVo;

import java.util.List;

public interface UserService {

    public List<UserVo> getUserList(Search search) throws Exception; // 사용자 전체 조회
    public UserVo getUserInfo(String memberId) throws Exception;     // 사용자 조회
    public int insertUser(UserVo userVo) throws Exception;           // 사용자 등록
    public int updateUser(UserVo userVo) throws Exception;           // 사용자 수정
    public int deleteUser(String memberId) throws Exception;         // 사용자 삭제
    public int getUserListCnt(Search search) throws Exception;       // 총 회원 수
}
