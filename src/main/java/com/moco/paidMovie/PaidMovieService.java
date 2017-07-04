package com.moco.paidMovie;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaidMovieService {

	@Autowired
	private PaidMovieDAO paidMovieDAO;
	
	// movieKind별로 DTO 셋팅
	public PaidMovieDTO DTOSet(PaidMovieDTO paidMovieDTO, String movieKind, int movieNum) throws Exception{
		if(movieKind.equals("basicMovie")){
			paidMovieDTO.setbNum(movieNum);
			paidMovieDTO.setlNum(0);
		}else{
			paidMovieDTO.setlNum(movieNum);
			paidMovieDTO.setbNum(0);
		}
		return paidMovieDTO;
	}
	
	// movieList
	public List<PaidMovieDTO> movieList(Map<String, Object> map) throws Exception{
		return paidMovieDAO.movieList(map);
	}
	// movieOne
	public PaidMovieDTO movieOne(int num) throws Exception{
		return paidMovieDAO.movieOne(num);
	}
	// movieInsert
	public int movieInsert(PaidMovieDTO paidMovieDTO) throws Exception{
		return paidMovieDAO.movieInsert(paidMovieDTO);
	}
	// movieUpdate
	public int movieUpdate(PaidMovieDTO paidMovieDTO) throws Exception{
		return paidMovieDAO.movieUpdate(paidMovieDTO);
	}
	// movieDelete
	public int movieDelete(String fileName) throws Exception{
		return paidMovieDAO.movieDelete(fileName);
	}
	// movieTotalCount
	public int movieTotalCount(String search) throws Exception{
		return paidMovieDAO.movieTotalCount(search);
	}
	
}
