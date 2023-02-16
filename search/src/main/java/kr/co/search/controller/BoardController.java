package kr.co.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.search.dao.BoardDao;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home() {
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request) {
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		String field="title";
		if(request.getParameter("field")!=null)
			field=request.getParameter("field");
		String keyword="";
		if(request.getParameter("keyword")!=null)
			keyword=request.getParameter("keyword");
		
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", bdao.list(field, keyword));
		return "/list";
	}
}
