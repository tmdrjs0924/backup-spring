package kr.co.shop.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import kr.co.shop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/plist")
	public String plist(Model model) {
		return service.plist(model);
	}
}
