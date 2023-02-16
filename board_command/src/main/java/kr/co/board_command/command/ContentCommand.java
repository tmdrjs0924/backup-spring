package kr.co.board_command.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.board_command.board.dao.BoardDao;
import kr.co.board_command.board.dto.BoardDto;

public class ContentCommand {

	public void content(Model model, HttpServletRequest request, BoardDao bdao) {
		String id=request.getParameter("id");
		BoardDto bdto=bdao.content(id);
		bdto.setContent(bdto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("bdto", bdto);
	}
}
