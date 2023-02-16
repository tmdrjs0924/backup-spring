package kr.co.board_command2.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_command2.command.TotalCommand;
import kr.co.board_command2.dao.BoardDao;
import kr.co.board_command2.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired private Test tt;
	@Autowired private Test2 tt2;
	@Autowired private BoardDao bdao;
	@Autowired private TotalCommand tc;
	
	@RequestMapping("/")
	public String home(Model model) {
		//Test tt=new Test();
		model.addAttribute("name", tt.getName());
		model.addAttribute("name2", tt2.getName());
		return "home";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDto bdto) {
		return tc.write_ok(bdto);
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		return tc.list(model);
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest request) {
		return tc.readnum(request);
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		return tc.content(request, model);
	}
}
