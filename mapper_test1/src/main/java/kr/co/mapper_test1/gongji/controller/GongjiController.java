package kr.co.mapper_test1.gongji.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mapper_test1.board.dao.BoardDao;
import kr.co.mapper_test1.gongji.dao.GongjiDao;
import kr.co.mapper_test1.gongji.dto.GongjiDto;

@RequestMapping("/gongji")
@Controller
public class GongjiController {

	@Autowired
	private SqlSession sqlSession2;
	
	@RequestMapping("/list")
	public String list(Model model) {
		GongjiDao gdao=sqlSession2.getMapper(GongjiDao.class);
		
		model.addAttribute("list", gdao.list());
		return "/gongji/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/gongji/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(HttpServletRequest request, GongjiDto gdto) {
		GongjiDao gdao=sqlSession2.getMapper(GongjiDao.class);
		int chk;
		if(request.getParameter("chk")==null)
			chk=0;
		else
			chk=1;
		gdto.setChk(chk);
		gdao.write_ok(gdto);
		return "redirect:/gongji/list";
	}
}
