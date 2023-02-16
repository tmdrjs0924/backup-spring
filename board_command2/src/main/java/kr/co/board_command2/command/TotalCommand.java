package kr.co.board_command2.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.board_command2.dao.BoardDao;
import kr.co.board_command2.dto.BoardDto;

@Service
public class TotalCommand {

	@Autowired private BoardDao bdao;
	
	public String write_ok(BoardDto bdto) {
		bdao.write_ok(bdto);
		return "redirect:/list";
	}
	
	public String list(Model model) {
		model.addAttribute("list", bdao.list());
		return "/list";
	}
	
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		bdao.readnum(id);
		return "redirect:/content?id="+id;
	}
	
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		model.addAttribute("bdto", bdao.content(id));
		return "/content";
	}
}
