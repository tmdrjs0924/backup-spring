package kr.co.search.dao;

import java.util.ArrayList;

import kr.co.search.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list(String field, String keyword);
}
