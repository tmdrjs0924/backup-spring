package kr.co.myshop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import kr.co.myshop.service.ProductService;
import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.ProductVo;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("qs")
	private ProductService service;
	
	@RequestMapping("/product/product")
	public String product(Model model) {
		return service.product(model);
	}
	
	@RequestMapping("/product/product_ok")
	public String product_ok(HttpServletRequest request,ProductVo pvo) throws Exception {
		return service.product_ok(request, pvo);
	}
	
	@RequestMapping("/product/getjung")
	public void getjung(HttpServletRequest request, PrintWriter out) {
		service.getJung(request, out);
	}
	
	@RequestMapping("/product/getso")
	public void getso(HttpServletRequest request, PrintWriter out) {
		service.getSo(request, out);
	}
	
	@RequestMapping("/product/getcode")
	public void getcode(HttpServletRequest request, PrintWriter out) {
		service.getCode(request, out);
	}
	
	@RequestMapping("/product/plist")
	public String plist(HttpServletRequest request, Model model) {
		return service.plist(request, model);
	}
	
	@RequestMapping("/product/pcontent")
	public String pcontent(HttpServletRequest request, Model model, HttpSession session) {
		return service.pcontent(request, model, session);
	}
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out) {
		/*
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else
			return service.wish_add(session, request);
		*/
		service.wish_add(session, request, out);
	}
	
	@RequestMapping("/product/wish_del")
	public void wish_del(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.wish_del(session, request, out);
	}
	
	@RequestMapping("/product/cart_add")
	public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		service.cart_add(request, session, out);;
	}
	
	@RequestMapping("/product/gumae")
	public String gumae(HttpServletRequest request, HttpSession session, Model model) {
		return service.gumae(request, session, model);
	}
	
	@RequestMapping("/product/member_phone")
	public void member_phone(HttpServletRequest request, PrintWriter out, HttpSession session) {
		service.member_phone(request, out, session);
	}
	
	@RequestMapping("/product/baeview")
	public String baeview(HttpSession session, Model model) {
		return service.baeview(session, model);
	}
	
	@RequestMapping("/product/jusoadd")
	public String jusoadd() {
		return service.jusoadd();
	}
	
	@RequestMapping("/product/jusoadd_ok")
	public String jusoadd_ok(BaesongVo bvo, HttpSession session) {
		return service.jusoadd_ok(bvo, session);
	}
	
	@RequestMapping("/product/baeup")
	public String baeup(HttpServletRequest request, Model model) {
		return service.baeup(request, model);
	}
	
	@RequestMapping("/product/baeup_ok")
	public String baeup_ok(BaesongVo bvo, HttpSession session) {
		return service.baeup_ok(bvo, session);
	}
	
	@RequestMapping("/product/baedel")
	public String baedel(HttpServletRequest request, HttpSession session) {
		return service.baedel(request, session);
	}
	
	@RequestMapping("/product/chgcla")
	public String chgcla(HttpServletRequest request, Model model) {
		return service.chgcla(request, model);
	}
	
	@RequestMapping("/product/chg_ok")
	public void chg_ok(HttpServletRequest request, PrintWriter out) {
		service.chg_ok(request, out);
	}
	
	@RequestMapping("/product/gumae_ok")
	public String gumae_ok(int id, GumaeVo gvo, HttpSession session) {
		return service.gumae_ok(id, gvo, session);
	}
	
/*	3개의 Vo를 이용하여 jumun 내용보기
	@RequestMapping("/product/jumun")
	public String jumun(HttpServletRequest request,Model model) {
		return service.jumun(request,model);
	}
*/
	@RequestMapping("/product/jumun")
	public String jumun(HttpServletRequest request, Model model) {
		return service.jumun2(request, model);
	}
}
