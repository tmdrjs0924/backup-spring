package kr.co.batis_board2.dao;

import java.util.ArrayList;

import kr.co.batis_board2.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public void write_ok(BoardDto bdto);
	public void readnum(BoardDto bdto);
	// public void readnum(String id);  // @param("id") = String id
	public BoardDto content(BoardDto bdto);
	public BoardDto update(BoardDto bdto);
	public void update_ok(BoardDto bdto);
	public void delete(BoardDto bdto);
}
