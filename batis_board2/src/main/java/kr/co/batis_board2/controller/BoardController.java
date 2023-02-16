package kr.co.batis_board2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.batis_board2.dao.BoardDao;
import kr.co.batis_board2.dto.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/list";
	}
	
	@RequestMapping("/write")
	public String write()
	{
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDto bdto) 
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		bdao.write_ok(bdto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> list=bdao.list();
		
		model.addAttribute("list", list);
		return "/list";
	}
	
	@RequestMapping("/readnum")
	public String readnum(BoardDto bdto)
	{
		//String id=request.getParameter("id");
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		bdao.readnum(bdto);
		//bdao.readnum(id);
		
		return "redirect:/content?id="+bdto.getId();
	}
	
	@RequestMapping("/content")
	public String content(BoardDto bdto, Model model)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		BoardDto bdto2=bdao.content(bdto);
		
		model.addAttribute("bdto", bdto2);
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(BoardDto bdto, Model model)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		BoardDto bdto2=bdao.update(bdto);
		
		model.addAttribute("bdto", bdto2);
		return "/update";
	}
	@RequestMapping("/update_ok")
	public String update_ok(BoardDto bdto)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		bdao.update_ok(bdto);
		
		return "redirect:/content?id="+bdto.getId();
	}
	@RequestMapping("/delete")
	public String delete(BoardDto bdto)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		bdao.delete(bdto);
		
		return "redirect:/list";
	}
}
