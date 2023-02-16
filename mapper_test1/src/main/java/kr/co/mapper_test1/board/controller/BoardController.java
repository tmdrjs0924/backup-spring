package kr.co.mapper_test1.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mapper_test1.board.dao.BoardDao;
import kr.co.mapper_test1.board.dto.BoardDto;

@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/list")
	public String list(Model model) {
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		
		model.addAttribute("list", bdao.list());
		return "/board/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(HttpServletRequest request, BoardDto bdto) {
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);

		String[] imsi=request.getParameterValues("dest");
		String dest="";
		for(int i=0;i<imsi.length;i++) {
			dest=dest+imsi[i]+",";
		}
		bdto.setDest(dest);
		bdao.write_ok(bdto);
		
		return "redirect:/board/list"; 
	}
}
