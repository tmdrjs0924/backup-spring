package kr.co.board_command2.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.co.board_command2.dto.BoardDto;

@Service
public interface BoardDao {
	
	public ArrayList<BoardDto> list();
	public void write_ok(BoardDto bdto);
	public void readnum(String id);
	public BoardDto content(String id);
}
