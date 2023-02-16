package kr.co.service.mapper;

import java.util.ArrayList;

import kr.co.service.vo.BoardVo;

public interface BoardMapper {

	public ArrayList<BoardVo> list(int index, int rnum);
	public int getChong(int rnum);
	public void readnum(String id);
	public BoardVo content(String id);
	public int pwdCheck(BoardVo bvo);
	public void delete(int id);
	public BoardVo update(BoardVo bvo);
	public void update_ok(BoardVo bvo);
}
