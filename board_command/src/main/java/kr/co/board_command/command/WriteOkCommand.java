package kr.co.board_command.command;

import kr.co.board_command.board.dao.BoardDao;
import kr.co.board_command.board.dto.BoardDto;

public class WriteOkCommand {

	public void write_ok(BoardDao bdao, BoardDto bdto) {
		bdao.write_ok(bdto);
	}
}
