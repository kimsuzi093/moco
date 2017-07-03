package com.moco.movieRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moco.util.RowMaker;

@Service
public class MovieRequestService {

	@Autowired
	private MovieRequestDAO movieRequestDAO;

	// list
	public List<MovieRequestDTO> movieRequestList(Integer curPage) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		RowMaker rowMaker = new RowMaker();
		rowMaker.makeRow(curPage, 10);
		map.put("row", rowMaker);
		return movieRequestDAO.movieRequestList(map);
	}

	// insert
	public int movieRequestInsert(Map<String, Object> map) throws Exception{
		return movieRequestDAO.movieRequestInsert(map);
	}

	// select
	public MovieRequestDTO movieRequestSelectOne(Map<String, Object> map) throws Exception{
		return movieRequestDAO.movieRequestSelectOne(map);
	}

}
