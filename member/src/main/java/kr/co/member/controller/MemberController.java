package kr.co.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.member.dao.MemberDao;
import kr.co.member.dto.MemberDto;

@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main";
	}
	
	@RequestMapping("/member_input")
	public String write() {
		return "/member_input";
	}
	
	@RequestMapping("/userid_check")
	public String userid_check(MemberDto mdto) {
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		boolean chk=mdao.userid_check(mdto);
		if(chk)
			return "redirect:/member_input";
		else
			return "redirect:/member_input?chk=1";
	}
	
	@RequestMapping("/member_input_ok")
	public String write_ok(MemberDto mdto) {
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.member_input_ok();
		
		return "redirect:/login";
	}
	
	@RequestMapping("/main")
	public String list() {
		return "/main";
	}
	
	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request, MemberDto mdto) {
		String chk=request.getParameter("chk");
		String userid=request.getParameter("userid");
		
		model.addAttribute("chk", chk);
		model.addAttribute("userid", userid);
		return "/login";
	}
	
	@RequestMapping("/login_ok")
	public String login_ok(MemberDto mdto, HttpSession session) {
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto2=mdao.login_ok(mdto);
		if(mdto2==null) {
			return "redirect:/login?chk=1";
		}
		else {
			session.setAttribute("userid", mdto2.getUserid());
			session.setAttribute("name", mdto2.getName());
			return "redirect:/main";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@RequestMapping("/usearch")
	public String usearch(MemberDto mdto, Model model) {
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto2=mdao.usearch(mdto);

		model.addAttribute("userid", mdto2.getUserid());
		return "redirect:/login";
	}
	
	@RequestMapping("/psearch")
	public String psearch(MemberDto mdto, Model model) {
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto2=mdao.psearch(mdto);
		System.out.println(mdto.getUserid()+" "+mdto.getName()+" "+mdto.getPhone());
		model.addAttribute("pwd", mdto2.getPwd());
		System.out.println(mdto2.getPhone());
		return "redirect:/login";
	}
}