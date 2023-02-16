package kr.co.myshop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MypageService {
	public String wishview(HttpSession session, Model model);
	public String wishdel(HttpServletRequest request);
	public String cart_add(HttpServletRequest request, HttpSession session);
	public String cartview(HttpSession session, Model model);
	public String cartdel(HttpServletRequest request);
	public void cart_up2(HttpServletRequest request, HttpSession session, PrintWriter out);
}
