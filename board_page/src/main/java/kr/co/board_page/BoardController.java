package kr.co.board_page;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/")
	public String home(Model model)	{
	/*
		String[] name={"홍길동","배트맨","슈퍼맨","뽀로로","하하하"};
	    model.addAttribute("name", name);
	    
	    ArrayList<String> list1=new ArrayList<String>();
	    list1.add("짜장면");
	    list1.add("난자완스");
	    list1.add("전가복");
	    list1.add("비빔밥");
	    list1.add("짜파게티");
	    
	    model.addAttribute("list1",list1);
	    
	    // Dto를 요소로 가지는 ArrayList
	    ArrayList<SungDto> slist=new ArrayList<SungDto>();
	    SungDto sdto=new SungDto();
	    sdto.setName("홍길동");
	    sdto.setKor(100);
	    sdto.setEng(99);
	    sdto.setMat(88);
	    slist.add(sdto);
	    
	    sdto=new SungDto();
	    sdto.setName("배트맨");
	    sdto.setKor(80);
	    sdto.setEng(70);
	    sdto.setMat(90);
	    slist.add(sdto);
	    
	    model.addAttribute("slist", slist);
	*/
		return "redirect:/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDto bdto) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.write_ok(bdto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.list(request, model);
		
		return "/list";
	}
	
	@RequestMapping("/readnum")
	public String readnum(BoardDto bdto) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.readnum(bdto);
		
		return "redirect:/content?id="+bdto.getId();
	}
	
	@RequestMapping("/content")
	public String content(BoardDto bdto, Model model) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.conetent(bdto, model);
		
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(BoardDto bdto, Model model) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.update(bdto, model);
		
		return "/update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(BoardDto bdto, Model model) throws Exception {
		BoardDao bdao=new BoardDao();
		if(bdao.isPwdCheck(bdto)) {
			bdao.update_ok(bdto);
			
			return "redirect:/content?id="+bdto.getId();
		}
		else {
			return "redirect:/update?id="+bdto.getId()+"&chk=1";
		}
	}
	
	@RequestMapping("/delete")
	public String delete(BoardDto bdto) throws Exception {
		BoardDao bdao=new BoardDao();
		if(bdao.isPwdCheck(bdto)){
			bdao.delete(bdto);
			
			return "redirect:/list";
		}
		else
			return "redirect:/content?id="+bdto.getId()+"&chk=1";
	}
}