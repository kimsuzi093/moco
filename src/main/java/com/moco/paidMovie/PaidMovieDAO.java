package com.moco.paidMovie;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaidMovieDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "PaidMovieMapper.";
	
	// movieList
	public List<PaidMovieDTO> movieList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"movieList" , map);
	}
	// movieOne
	public PaidMovieDTO movieOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"movieOne", num);
	}
	// movieInsert
	public int movieInsert(PaidMovieDTO paidMovieDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"movieInsert", paidMovieDTO);
	}
	// movieUpdate
	public int movieUpdate(PaidMovieDTO paidMovieDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"movieUpdate", paidMovieDTO);
	}
	// movieDelete
	public int movieDelete(String fileName) throws Exception{
		return sqlSession.delete(NAMESPACE+"movieDelete", fileName);
	}
	// movieTotalCount
	public int movieTotalCount(String search) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"movieTotalCount", search);
	}
	
}
