package com.moco.movieRequest;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MovieRequestDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "MovieRequestMapper.";
	
	// list
	public List<MovieRequestDTO> movieRequestList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"movieRequestList", map);
	}
	
}
