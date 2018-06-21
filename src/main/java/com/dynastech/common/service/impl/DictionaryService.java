package com.dynastech.common.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dynastech.common.entity.Dictionary;
import com.dynastech.common.entity.DictionaryExample;
import com.dynastech.common.mapper.DictionaryMapper;
import com.dynastech.common.service.IDictionaryService;

@Service
public class DictionaryService implements IDictionaryService{
	
	@Autowired
	private DictionaryMapper dictionaryMapper;
	
	
	@Override
	public List<Dictionary> selectByExample(DictionaryExample de) {
		return dictionaryMapper.selectByExample(de);
	}
	
	@Override
	public List<Dictionary> findByKind(String kind) {
		
		DictionaryExample de=new DictionaryExample();
		
		de.createCriteria().andKindEqualTo(kind);
		de.setOrderByClause("code");
		
		return dictionaryMapper.selectByExample(de);
	}
	
	@Override
	public Dictionary findById(String id) {
		return dictionaryMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public int add(Dictionary dic) {
		return dictionaryMapper.insertSelective(dic);
	}
	
	@Override
	public int update(Dictionary dic) {
		return dictionaryMapper.updateByPrimaryKeySelective(dic);
	}
	
	@Override
	public int batchDelete(String ...ids) {
		
		Dictionary dic=new Dictionary();
		dic.setIsdeleted(true);
		
		DictionaryExample de=new DictionaryExample();
		
		de.createCriteria().andIdIn(Arrays.asList(ids));
		
		return dictionaryMapper.updateByExampleSelective(dic, de);
	}
}
