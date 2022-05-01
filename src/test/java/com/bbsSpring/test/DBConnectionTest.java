package com.bbsSpring.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.Connection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/dataSource-context.xml"})
public class DBConnectionTest {
    private static final Logger logger = LoggerFactory.getLogger(DBConnectionTest.class);

    @Inject
    private DataSource ds;

    @Test
    public void testConnection() {
        try (Connection con = ds.getConnection()){
            logger.info("\n MariaDB 연결 : " + con);
            System.out.println(("MariaDB 연결 성공 : " + con));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    @Autowired
//    private DataSource ds;
//
//    @Test
//    public void testConnection(){
//        try(Connection con = ds.getConnection()){
//            System.out.println(("MariaDB 연결 성공 : " + con));
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }

}
