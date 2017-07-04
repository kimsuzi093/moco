package com.moco.screen;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScreenDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "ScreenMapper.";
	
	public int insert(ScreenDTO screenDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", screenDTO);
	}
}
