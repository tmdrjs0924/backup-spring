package kr.co.board_command.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_command.board.dao.BoardDao;
import kr.co.board_command.board.dto.BoardDto;
import kr.co.board_command.command.ContentCommand;
import kr.co.board_command.command.ListCommand;
import kr.co.board_command.command.ReadnumCommand;
import kr.co.board_command.command.WriteOkCommand;

@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	private BoardDao bdao;
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request) {
		ListCommand lc=new ListCommand();
		lc.list(model, request, bdao);
		return "/board/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDto bdto) {
		WriteOkCommand woc=new WriteOkCommand();
		woc.write_ok(bdao, bdto);
		return "redirect:/board/list";
	}
	
	@RequestMapping("readnum")
	public String readnum(HttpServletRequest request) {
		ReadnumCommand rc=new ReadnumCommand();
		rc.readnum(request, bdao);
		
		return "redirect:/board/content?id="+request.getParameter("id");
	}
	
	@RequestMapping("/content")
	public String content(Model model, HttpServletRequest request) {
		ContentCommand cc=new ContentCommand();
		cc.content(model, request, bdao);
		return "/board/content";
	}
}
