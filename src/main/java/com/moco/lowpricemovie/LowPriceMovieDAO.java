package com.moco.lowpricemovie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moco.util.RowMaker;

@Repository
public class LowPriceMovieDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "LowPriceMovieMapper.";
	
	//TOTAL COUNT
	public int totalCount(String kind, String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("kind", kind);
		map.put("search", search);
		int total = sqlSession.selectOne(NAMESPACE+"totalCount", map);
		return total;
	}
	
	//LIST
	public List<LowPriceMovieDTO> list(RowMaker rowMaker, String kind, String search) throws Exception{
		List<LowPriceMovieDTO> ar = new ArrayList<LowPriceMovieDTO>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		map.put("row", rowMaker);
		ar = sqlSession.selectList(NAMESPACE+"list", map);
		return ar;
	}
	
	//VIEW
	public LowPriceMovieDTO view(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	
}
