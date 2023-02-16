package kr.co.board_command.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.board_command.board.dao.BoardDao;

public class ReadnumCommand {

	public void readnum(HttpServletRequest request, BoardDao bdao) {
		String id=request.getParameter("id");
		bdao.readnum(id);
	}
}
