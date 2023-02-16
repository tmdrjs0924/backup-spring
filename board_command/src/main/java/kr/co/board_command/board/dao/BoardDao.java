package kr.co.board_command.board.dao;

import java.util.ArrayList;

import kr.co.board_command.board.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list(int index);
	public int getChong();
	public void write_ok(BoardDto bdto);
	public BoardDto content(String id);
	public void readnum(String id);
}
