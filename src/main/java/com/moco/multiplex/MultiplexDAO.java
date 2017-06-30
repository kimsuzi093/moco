package com.moco.multiplex;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MultiplexDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "MultiplexMapper.";
	
	public List<MultiplexDTO> list(int theater_num) throws Exception{
		List<MultiplexDTO> ar = new ArrayList<MultiplexDTO>();
		ar = sqlSession.selectList(NAMESPACE+"list", theater_num);
		
		return ar;
	}
	
	public MultiplexDTO view(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
}
