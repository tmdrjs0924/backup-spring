package kr.co.batis_board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.batis_board.dao.BoardDao;

@Controller
public class BoardController {

	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) throws Exception
	{
		BoardDao bdao=new BoardDao();
		bdao.list(request, model);
		
		return "/list";
	}
}