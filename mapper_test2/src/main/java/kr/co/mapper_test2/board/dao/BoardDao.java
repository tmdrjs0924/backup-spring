package kr.co.mapper_test2.board.dao;

import java.util.ArrayList;

import kr.co.mapper_test2.board.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public void write_ok(BoardDto bdto);
}
