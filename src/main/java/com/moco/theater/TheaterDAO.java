package com.moco.theater;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moco.multiplex.MultiplexDTO;
import com.moco.util.RowMaker;

@Repository
public class TheaterDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "TheaterMapper.";
	
	/*public int insert(TheaterDTO theaterDTO, MultiplexDTO multiplexDTO, ScreenDTO screenDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", map);
	}*/
	
	public int totalCount(String kind, String search) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		
		int total = sqlSession.selectOne(NAMESPACE+"totalCount", map);
		
		return total;
	}
	public List<TheaterDTO> list(RowMaker rowMaker, String kind, String search) throws Exception{
		
		List<TheaterDTO> ar = new ArrayList<TheaterDTO>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("row", rowMaker);
		map.put("kind", kind);
		map.put("search", search);
		
		ar = sqlSession.selectList(NAMESPACE+"list", map);
		
		return ar;
	}
	
	public int insert(TheaterDTO theaterDTO, MultiplexDTO multiplexDTO) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theaterDTO", theaterDTO);
		map.put("multiplexDTO", multiplexDTO);
		
		sqlSession.insert(NAMESPACE+"theaterRequest", map);
		int result = (Integer)map.get("result");
				
		return result;
	}

	public TheaterDTO view(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
}
