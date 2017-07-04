package com.moco.movieRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moco.movieAPI.BasicMovieDTO;
import com.moco.util.RowMaker;

@Service
public class MovieRequestService {

	@Autowired
	private MovieRequestDAO movieRequestDAO;

	// movieRequestForList
	public List<MovieRequestDTO> movieRequestForList() throws Exception{
		return movieRequestDAO.movieRequestForList();
	}
	// List
	public List<BasicMovieDTO> movieRequestList() throws Exception{
		BasicMovieDTO basicMovieDTO = null;
		//	실질적인 list 반환
		List<BasicMovieDTO> ar = new ArrayList<BasicMovieDTO>();
		// num 들을 꺼내와서 각각의 list를 불러내자.
		List<MovieRequestDTO> nums = this.movieRequestForList();
		for (MovieRequestDTO movieRequestDTO : nums) {
			// basicMovie
			if(movieRequestDTO.getlNum() == 0){
				basicMovieDTO = movieRequestDAO.basicMovieList(movieRequestDTO.getbNum());
				ar.add(basicMovieDTO);
			// lowPriceMovie
			}else{
				basicMovieDTO = movieRequestDAO.lowPriceMovieList(movieRequestDTO.getlNum());
				ar.add(basicMovieDTO);
			}
		}
		return ar;
	}
	
	// movieRequestTotalCount
	public int movieRequestTotalCount() throws Exception{
		return movieRequestDAO.movieRequestTotalCount();
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
