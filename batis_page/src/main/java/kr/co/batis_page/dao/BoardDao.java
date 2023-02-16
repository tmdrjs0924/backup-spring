package kr.co.batis_page.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.batis_page.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list(@Param("page") int page, @Param("rnum") int rnum,
			@Param("index") int index, @Param("pstart") int pstart, @Param("pend") int pend,
			@Param("chong") int chong, @Param("field") String field, @Param("keyword") String keyword);
	public void write_ok(BoardDto bdto);
	public void readnum(BoardDto bdto);
	public BoardDto content(BoardDto bdto);
	public BoardDto update(BoardDto bdto);
	public void update_ok(BoardDto bdto);
	public void delete(BoardDto bdto);
	
	public int pwdCheck(BoardDto bdto);
	public boolean pwdCheck2(BoardDto bdto);
	public int getChong(@Param("rnum") int rnum, @Param("field") String field, @Param("keyword") String keyword);
}
