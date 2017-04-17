package com.netease.seckill.service;

import com.netease.seckill.dto.Exposer;
import com.netease.seckill.dto.SeckillExcution;
import com.netease.seckill.entity.Seckill;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by apple on 17/4/16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class SeckillServiceTest {

    @Resource
    SeckillService seckillService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Test
    public void getSeckillList() throws Exception {
        List<Seckill> seckills = seckillService.getSeckillList();
        logger.info("1.seckills={}", seckills);
    }

    @Test
    public void getById() throws Exception {
        long id = 1000l;
        Seckill seckill = seckillService.getById(id);
        logger.info("2.seckill={}", seckill);
    }

    @Test
    public void exposeSeckillUrl() throws Exception {
    }

    @Test
    public void executeSeckill() throws Exception {
    }

    @Test
    public void executeSeckillProcedure() throws Exception {
        long seckillId = 1004;
        long phone = 18868831756l;
        Exposer exposer = seckillService.exposeSeckillUrl(seckillId);
        if (exposer.isExposed()) {
            String md5 = exposer.getMd5();
            SeckillExcution seckillExcution = seckillService.executeSeckillProcedure(seckillId, phone, md5);
            logger.info("=============" + seckillExcution.getStatusInfo());
        }
    }

}