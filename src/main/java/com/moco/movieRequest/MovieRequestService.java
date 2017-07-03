package com.moco.movieRequest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieRequestService {

	@Autowired
	private MovieRequestDAO movieRequestDAO;
	
	// list
	public List<MovieRequestDTO> movieRequestList(Map<String, Object> map) throws Exception{
		return movieRequestDAO.movieRequestList(map);
	}
	
}
