package com.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dynastech.base.common.service.IRedisService;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ="classpath:config/spring/spring-*.xml")
public class RedisTest {
	
	@Autowired
	private IRedisService redisService;

	@Test
	public void test() {
		
		redisService.deleteKeyValue("jsonTest");
		
	}
}
