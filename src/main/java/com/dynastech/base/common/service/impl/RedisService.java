package com.dynastech.base.common.service.impl;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.dynastech.base.common.service.IRedisService;

@Service
public class RedisService implements IRedisService{
	
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	public void setValue(String key,Object value){
		redisTemplate.boundValueOps(key).set(value);
	}
	
	public void setValue(String key,Object value,long timeOut){
		redisTemplate.boundValueOps(key).set(value,timeOut,TimeUnit.MILLISECONDS);
	}
	
	@Override
	public void setValue(String key, Object value, long timeOut, TimeUnit timeUnit) {
		redisTemplate.boundValueOps(key).set(value,timeOut,timeUnit);
	}
	
	public Object getValue(String key){
		return redisTemplate.boundValueOps(key).get();
	}
	
	public void deleteKeyValue(String key){
		redisTemplate.delete(key);
	}	

}
