package com.bbsSpring.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/dataSource-context.xml" })
public class MybatisTest {

    private static final Logger logger = LoggerFactory.getLogger(MybatisTest.class);

    @Inject
    private SqlSessionFactory sessionFactory;

    @Test
    public void testSessionFactory() {
        logger.info("\n Session Factory : " + sessionFactory);
    }

    @Test
    public void testSqlSession() {
        try (SqlSession session = sessionFactory.openSession()){
            logger.info("\n Sql Session : " + session);
            System.out.println(("Mybatis 연결 성공 : " + session));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



//    @Autowired
//    private SqlSessionFactory sessionFactory;
//
//    @Test
//    public void testConnection(){
//        try(SqlSession session = sessionFactory.openSession()){
//            System.out.println(("연결 성공 : " + session));
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }

}





