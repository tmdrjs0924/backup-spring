package kr.co.board_old;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

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
	public String list(Model model) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.list(model);
		
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
		bdao.content(bdto, model);
		
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(BoardDto bdto, Model model) throws Exception {
		BoardDao bdao=new BoardDao();
		bdao.update(bdto, model);
		
		return "/update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(BoardDto bdto) throws Exception {
		BoardDao bdao=new BoardDao();
		if(bdao.isPwdCheck(bdto)) {
			bdao.update_ok(bdto);
			
			return "redirect:/content?id="+bdto.getId();
		}
		else
			return "redirect:/update?id="+bdto.getId()+"&chk=1";
	}
	
	@RequestMapping("/delete")
	public String delete_ok(BoardDto bdto) throws Exception {
		BoardDao bdao=new BoardDao();
		if(bdao.isPwdCheck(bdto)) {
			bdao.delete(bdto);

			return "redirect:/list";
		}
		else
			return "redirect:/content?id="+bdto.getId()+"&chk=1";
	}
}
