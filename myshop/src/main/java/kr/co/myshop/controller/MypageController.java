package kr.co.myshop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.myshop.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("ms")
	private MypageService service;
	
	@RequestMapping("/mypage/wishview")
	public String wishview(HttpSession session, Model model) {
		return service.wishview(session, model);
	}
	
	@RequestMapping("/mypage/wishdel")
	public String wishdel(HttpServletRequest request) {
		return service.wishdel(request);
	}
	
	@RequestMapping("/mypage/cart_add")
	public String cart_add(HttpServletRequest request, HttpSession session) {
		return service.cart_add(request, session);
	}
	
	@RequestMapping("/mypage/cartview")
	public String cartview(HttpSession session, Model model) {
		return service.cartview(session, model);
	}
	
	@RequestMapping("/mypage/cartdel")
	public String cartdel(HttpServletRequest request) {
		return service.cartdel(request);
	}
	
	@RequestMapping("/mypage/cart_up2")
	public void cart_up2(HttpServletRequest request, HttpSession session, PrintWriter out) {
		service.cart_up2(request, session, out);
	}
}