package kr.co.mapper_test2.tour.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TourController {

	@Autowired
	private SqlSession sqlSession;
	
	
}
