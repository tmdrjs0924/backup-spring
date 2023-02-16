package kr.co.mapper_test1.tour.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mapper_test1.gongji.dao.GongjiDao;
import kr.co.mapper_test1.tour.dao.TourDao;

@RequestMapping("/tour")
@Controller
public class TourController {

	@Autowired
	private SqlSession sqlSession3;
	
	@RequestMapping("/list")
	public String list(Model model) {
		TourDao tdao=sqlSession3.getMapper(TourDao.class);
		
		model.addAttribute("list", tdao.list());
		return "/tour/list";
	}
}
