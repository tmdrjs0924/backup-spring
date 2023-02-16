package kr.co.tour.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.tour.dao.TourDao;
import kr.co.tour.dto.TourDto;

@Controller
public class TourController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/write")
	public String write() {
		
		return "/write";
	}

	@RequestMapping("/write_ok")
	public String write_ok(HttpServletRequest request) throws Exception {
		String path=request.getRealPath("/WEB-INF/views/img/");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String fname=multi.getFilesystemName("fname");
		
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		//tdao.write_ok(title,content,fname);
		
		TourDto tdto=new TourDto();
		tdto.setTitle(title);
		tdto.setContent(content);
		tdto.setFname(fname);
		tdao.write_ok2(tdto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		
		model.addAttribute("list", tdao.list());
		return "/list";
	}
	
	@RequestMapping("/content")
	public String content() {
		return "/content";
	}
	
}
