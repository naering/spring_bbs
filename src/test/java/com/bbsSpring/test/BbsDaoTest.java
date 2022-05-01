package com.bbsSpring.test;

import com.bbsSpring.common.Pagination;
import com.bbsSpring.common.Search;
import com.bbsSpring.dao.BbsDao;
import com.bbsSpring.vo.BbsVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/root-context.xml",
        "classpath:spring/dataSource-context.xml"
})
public class BbsDaoTest {
    private static final Logger logger = LoggerFactory.getLogger(BbsDaoTest.class);

    @Inject
    private BbsDao bbsDao;

    @Test
    public void testGetBoardList() throws Exception {
//        Pagination pagination = new Pagination();
//        pagination.pageInfo(1,5,10);
        Search search = new Search();
        search.pageInfo(1,5,10);
        List<BbsVo> boardList = bbsDao.getBbsList(search);
        logger.info("\n Board List \n ");
        System.out.println(("게시판 리스트 : " + boardList));
        if(boardList.size() > 0) {
            for(BbsVo list : boardList) {
                logger.info(list.getBbsTitle());
            }
            System.out.println(("DAO연결 성공 : " + boardList.size()));

        } else {
            logger.info("데이터가 없습니다.");
            System.out.println(("데이터가 없습니다"));
        }

    }


}
