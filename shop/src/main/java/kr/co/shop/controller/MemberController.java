package kr.co.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.shop.service.MemberService;
import kr.co.shop.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/main")
	public String main() {
		return "/member/main";
	}
	
	@RequestMapping("/join")
	public String join(MemberVo mvo) {
		return service.join();
	}
	
	@RequestMapping("/join_ok")
	public String join_ok(MemberVo mvo) {
		return service.join_ok(mvo);
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		return service.login(request, model);
	}

	@RequestMapping("/login_ok")
	public String login_ok(MemberVo mvo, HttpSession session) {
		return service.login_ok(mvo,session);
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	// 아이디 중복 검사
	@RequestMapping("/idCheck")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		return service.idCheck(memberId);	
	}
	
	// 이메일 인증 
    @RequestMapping("/mailCheck")
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
       return service.mailCheck(email);
    }
	
}
