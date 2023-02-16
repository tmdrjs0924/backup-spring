package kr.co.shop.controller;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.AdminService;
import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.ProductVo;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@RequestMapping("/admin/category")
	public String category(Model model) {
		return service.category(model);
	}
	
	@RequestMapping("/admin/getcate2")
	public void getCate2(HttpServletRequest request, PrintWriter out) {
		service.getCate2(request, out);
	}
	@RequestMapping("/admin/getcate3")
	public void getCate3(HttpServletRequest request, PrintWriter out) {
		service.getCate3(request, out);
	}
	
	@RequestMapping("/admin/getpcode")
	public void getPcode(HttpServletRequest request, PrintWriter out) {
		service.getPcode(request, out);
	}
	
	@RequestMapping("/admin/cate1_insert")
	public String cate1_insert(Cate1Vo c1vo) {
		return service.cate1_insert(c1vo);
	}
	@RequestMapping("/admin/cate2_insert")
	public String cate2_insert(Cate2Vo c2vo) {
		return service.cate2_insert(c2vo);
	}
	@RequestMapping("/admin/cate3_insert")
	public String cate3_insert(Cate3Vo c3vo) {
		return service.cate3_insert(c3vo);
	}
	
	@RequestMapping("/admin/product")
	public String product(Model model) {
		return service.product(model);
	}
	
	@RequestMapping("/admin/productinsert")
	public String productInsert(HttpServletRequest request) throws Exception {
		return service.productInsert(request);
	}
}
