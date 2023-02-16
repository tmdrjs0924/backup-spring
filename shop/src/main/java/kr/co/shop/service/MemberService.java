package kr.co.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.MemberVo;

public interface MemberService {
	public String join();
	public String join_ok(MemberVo mvo);
	public String login(HttpServletRequest request, Model model);
	public String login_ok(MemberVo mvo, HttpSession session);
	public String logout(HttpSession session);
	public String idCheck(String memberId) throws Exception;
	public String mailCheck(String email);
	
}
