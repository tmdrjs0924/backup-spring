package kr.co.mapper_test1.board.dao;

import java.util.ArrayList;

import kr.co.mapper_test1.board.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public void write_ok(BoardDto bdto);
}
