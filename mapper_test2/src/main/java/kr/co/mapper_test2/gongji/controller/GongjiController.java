package kr.co.mapper_test2.gongji.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class GongjiController {

	@Autowired
	private SqlSession sqlSession;
}
